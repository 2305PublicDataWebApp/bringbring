<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8">
    <title>${uData.user.userName}님 과의 채팅</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no"/>

    <!-- Favicons -->
    <link href="../resources/assets/img/main/icon-title.png" rel="icon">
    <link href="../resources/assets/img/main/icon-title.png" rel="apple-touch-icon">

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<%--    <link rel='stylesheet' href='https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css'>--%>
    <link rel="stylesheet" href="../resources/assets/css/chatting/style.css">
    <style>


    </style>
</head>
<body>
    <div style="margin: 0 auto;">
        <div class="floating-chat expand enter">
            <i class="fa fa-comments" aria-hidden="true"></i>
            <div class="chat">
                <div class="header">
                <span class="title">
                    <span onclick="closeCurrentWindow()" style="cursor: pointer;"><</span> &nbsp;
                    ${uData.user.userName}
                </span>
                </div>
                <div class="header text-center" style="border-bottom: 1px solid #17594A;padding-left: 10px;margin-bottom: 5px;">
                    <c:if test="${sessionId eq uData.user.userId}">
                        <button type="button" style="padding: 9px 10px 7px 10px; border-radius: 6px;background-color: #222;font-family: 'LINESeedKR-Bd';font-size: 14px;" readonly>나눔 완료</button>
                    </c:if>
                    <span class="divideTitle">${uData.divide.divTitle}</span>
                </div>
                <ul id="msgArea" class="messages">
<%--                    <div>--%>
<%--                        <li class='other'>안뇽 나야</li>--%>
<%--                    </div>--%>
<%--                    <div>--%>
<%--                        <p class="infoMessageArea">--%>
<%--                        <span class="infoMessage">--%>
<%--                            관리자님이 입장하셨습니다.--%>
<%--                        </span>--%>
<%--                        </p>--%>
<%--                    </div>--%>
                </ul>
                <div class="footer">
                    <div id="opinion" class="text-box messageArea" contenteditable="true" disabled="true" onkeyup="enterkey()"></div>
                    <button id="sendBtn" style="background-color: #17594A;padding: 0px 10px;border-top-left-radius: 0px;border-bottom-left-radius: 0px">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
                            <path d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89L6.637 10.07l-.215-.338a.5.5 0 0 0-.154-.154l-.338-.215 7.494-7.494 1.178-.471-.47 1.178Z"/>
                        </svg>
                    </button>
                </div>
            </div>
        </div>
    </div>
<!-- partial -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js'></script>
<script  src="../resources/assets/js/chatting/script.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

</body>
<script>
    function closeCurrentWindow(){
        window.close();
    }

    document.getElementById("sendBtn").addEventListener("click", function() {
        send();
    });

    const username = "${name}";

    const websocket = new WebSocket("ws://localhost:8888/ws/chat");
    websocket.onmessage = onMessage;
    websocket.onopen = onOpen;
    websocket.onclose = onClose;

    let isSeeing = true;
    document.addEventListener("visibilitychange", function() {
        console.log(document.visibilityState);
        if(document.visibilityState == "hidden"){
            isSeeing = false;
        }else{
            isSeeing = true;
        }
    });

    var newExcitingAlerts = (function () {
        var oldTitle = document.title;
        var msg = "★Message!★";
        var timeoutId;
        var blink = function() { document.title = document.title == msg ? ' ' : msg;
            if(isSeeing == true){
                clear();
            }
        };
        var clear = function() {
            clearInterval(timeoutId);
            document.title = oldTitle;
            window.onmousemove = null;
            timeoutId = null;
        };
        return function () {
            if (!timeoutId) {
                timeoutId = setInterval(blink, 1000);
            }
        };
    }());

    setInterval(() => console.log(new Date()), 10000); //prevent chrome refresh

    $(document).ready(function(){
        $(".floating-chat").click();

        $("#disconn").on("click", (e) => {
            disconnect();
        })

        $("#button-send").on("click", (e) => {
            send();
        });
    })

    function enterkey(){
        if (window.event.keyCode == 13) {
            send();
        }
    }
    function send(){
        console.log(username + ":" + $("#opinion").text());
        if($("#opinion").text() != ""){
            websocket.send(username + ":" + $("#opinion").text());
            $("#opinion").text('');
        }
    }

    function onClose(evt) {
        var str = username + ": 님이 방을 나가셨습니다.";
        websocket.send(str);
    }

    function onOpen(evt) {
        var str = username + ": 님이 입장하셨습니다.";
        websocket.send(str);
    }

    function onMessage(msg) {
        var data = msg.data;
        var sessionId = null;
        var message = null;
        var arr = data.split(":");

        for(var i=0; i<arr.length; i++){
            console.log('arr[' + i + ']: ' + arr[i]);
        }

        var cur_session = username;

        console.log("cur_session : " + cur_session);


        sessionId = arr[0];
        message = arr[1];

        if("${uData.user.userNo} ne ${user.userNo}"){
            $.ajax({
                url: "/chatting/insert.do",
                data: { divNo: ${uData.divide.divNo}
                    , userNo: ${user.userNo}
                    , getUserNo: ${uData.user.userNo}
                    , chatContent: message
                },
                type: "POST",
                success: function(data) {
                    if(data === "success"){
                        alert("insert 성공!");
                    }else{
                        alert("조회수 증가 실패!");
                    }

                },
                error: function() {
                    alert("Ajax 오류! 관리자에게 문의하세요");
                }
            });
        }

        console.log("sessionID : " + sessionId);
        console.log("cur_session : " + cur_session);



        var divElement = document.createElement("div");
        var liElement = document.createElement("li");

        if(message == undefined){
            message = "채팅이 종료되었습니다.";
        }
        if(message == " 님이 입장하셨습니다."){
            message = sessionId + "님이 입장하셨습니다.";
            var ulElement = document.getElementById("msgArea");
            // p 요소 생성
            var pElement = document.createElement("p");
            pElement.setAttribute("class", "infoMessageArea");

            // span 요소 생성
            var spanElement = document.createElement("span");
            spanElement.setAttribute("class", "infoMessage");

            // 텍스트 노드 생성 및 추가
            var textNode = document.createTextNode(message);

            // span 요소에 텍스트 노드 추가
            spanElement.appendChild(textNode);

            // p 요소에 span 요소 추가
            pElement.appendChild(spanElement);

            // ul 요소에 p 요소 추가
            ulElement.appendChild(pElement);
        }else{
            if(sessionId == cur_session){

                // var ulElement = document.getElementById("msgArea");
                // // p 요소 생성
                // var pElement = document.createElement("p");
                // pElement.setAttribute("class", "infoMessageArea");
                //
                // // span 요소 생성
                // var spanElement = document.createElement("span");
                // spanElement.setAttribute("class", "infoMessage");
                //
                // // 텍스트 노드 생성 및 추가
                // var textNode = document.createTextNode(message);
                //
                // // span 요소에 텍스트 노드 추가
                // spanElement.appendChild(textNode);
                //
                // // p 요소에 span 요소 추가
                // pElement.appendChild(spanElement);
                //
                // // ul 요소에 p 요소 추가
                // ulElement.appendChild(pElement);

                divElement.setAttribute("class", "chatDiv");
                liElement.setAttribute("class", "other");
                var textNode = document.createTextNode(message);
                liElement.appendChild(textNode);
                divElement.append(liElement);
                $("#msgArea").append(divElement);


            }
            else{
                divElement.setAttribute("class", "chatDiv");
                liElement.setAttribute("class", "self");
                var textNode = document.createTextNode(message);
                liElement.appendChild(textNode);
                divElement.append(liElement);
                $("#msgArea").append(divElement);

                if(isSeeing == false){
                    newExcitingAlerts();
                }
            }
        }

        document.getElementById("msgArea").scrollTop = document.getElementById("msgArea").scrollHeight;
    }
</script>
<style>
    .text-box div:nth-child(n+1) {
        display: none;
    }
</style>
</html>
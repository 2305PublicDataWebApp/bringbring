<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko" >
<head>
    <meta charset="UTF-8">
    <title>${getUser.userName}님 과의 채팅</title>
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
                    <span class="divideTitle">
<%--                        <a href="/divide/detail.do?divNo=${uData.divide.divNo}">--%>
                            ${uData.divide.divTitle}
<%--                        </a>--%>
                    </span>
                </div>
                <ul id="msgArea" class="messages">
<%--                    이전날짜 저장--%>
                    <c:set var="previousDate" value="" scope="page" />
                    <c:forEach var="chat" items="${cList}" varStatus="i">
                        <fmt:parseDate value="${chat.chatCreateDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parseDateTime" type="both" />
                        <fmt:parseDate value="${chat.chatCreateDate}" pattern="yyyy-MM-dd" var="parseDate" type="both" />
                        <c:if test="${parseDate ne previousDate}">
                            <%-- 현재 날짜와 이전 날짜가 다른 경우에만 날짜를 출력합니다. --%>
                            <p class="infoMessageArea">
                                <span class="infoMessage"><fmt:formatDate value="${parseDate}" pattern="yyyy년 MM월 dd일" /></span>
                            </p>
                            <%-- 현재 날짜를 이전 날짜로 업데이트합니다. --%>
                            <c:set var="previousDate" value="${parseDate}" scope="page" />
                        </c:if>

                        <c:if test="${user.userNo eq chat.userNo}">
                            <div class="chatDiv">
                                <li class='other'>${chat.chatContent}</li>
                                <span class="otherTime">
                                    <fmt:formatDate value="${parseDateTime}" pattern="HH:mm" />
                                </span>
                            </div>
                        </c:if>
                        <c:if test="${user.userNo ne chat.userNo}">
                            <div class="chatDiv">
                                <li class='self'>${chat.chatContent}</li>
                                <span class="selfTime">
                                    <fmt:formatDate value="${parseDateTime}" pattern="HH:mm" />
                                </span>
                            </div>
                        </c:if>
                    </c:forEach>
                </ul>
                <div class="footer">
                    <div id="opinion" class="text-box messageArea" contenteditable="true" disabled="true" onkeyup="enterkey()"></div>
                    <button id="sendBtn" class="align-self-center" style="background-color: #17594A;padding: 2px 10px 0px 10px;border-top-left-radius: 0px;border-bottom-left-radius: 0px">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>\
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

    <script>
        //테스트
        $(document).ready(function(){

            var roomName = [[${room.name}]];
            var roomId = [[${room.roomId}]];
            var username = [[${authentication.principal.username}]];

            console.log(roomName + ", " + roomId + ", " + username);

            var sockJs = new SockJS("/stomp/chat");
            //1. SockJS를 내부에 들고있는 stomp를 내어줌
            var stomp = Stomp.over(sockJs);

            //2. connection이 맺어지면 실행
            stomp.connect({}, function (){
                console.log("STOMP Connection")

                //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                    var content = JSON.parse(chat.body);

                    var writer = content.writer;
                    var str = '';

                    if(writer === username){
                        str = "<div class='col-6'>";
                        str += "<div class='alert alert-secondary'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div></div>";
                        $("#msgArea").append(str);
                    }
                    else{
                        str = "<div class='col-6'>";
                        str += "<div class='alert alert-warning'>";
                        str += "<b>" + writer + " : " + message + "</b>";
                        str += "</div></div>";
                        $("#msgArea").append(str);
                    }

                    $("#msgArea").append(str);
                });

                //3. send(path, header, message)로 메세지를 보낼 수 있음
                stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, writer: username}))
            });

            $("#button-send").on("click", function(e){
                var msg = document.getElementById("msg");

                console.log(username + ":" + msg.value);
                stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, writer: username}));
                msg.value = '';
            });
        });
        //테스트

        function formatTime(hours, minutes) {
            return (hours < 10 ? "0" : "") + hours + ":" + (minutes < 10 ? "0" : "") + minutes;
        }

        function displayCurrentTime() {
            const now = new Date();
            const hours = now.getHours();
            const minutes = now.getMinutes();

            return formatTime(hours, minutes);
        }

        // 호출하여 현재 시간 표시
        console.log(displayCurrentTime());

        function closeCurrentWindow(){
            window.close();
        }

        document.getElementById("sendBtn").addEventListener("click", function() {
            send();
        });

        const username = "${name}";

        // const websocket = new WebSocket("ws://localhost:8888/ws/chat");
        // websocket.onmessage = onMessage;
        // websocket.onopen = onOpen;
        // websocket.onclose = onClose;

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


            console.log("sessionID : " + sessionId);
            console.log("cur_session : " + cur_session);



            var divElement = document.createElement("div");
            var liElement = document.createElement("li");
            var spanElement = document.createElement("span");

            if(message == undefined){
                // message = "채팅이 종료되었습니다.";
                return false;
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

                    divElement.setAttribute("class", "chatDiv");
                    liElement.setAttribute("class", "other");
                    spanElement.setAttribute("class", "otherTime");
                    var textNode = document.createTextNode(message);
                    liElement.appendChild(textNode);
                    var textNode = document.createTextNode(displayCurrentTime());
                    spanElement.appendChild(textNode);
                    divElement.append(liElement);
                    divElement.append(spanElement);
                    $("#msgArea").append(divElement);

                    <%--if("${uData.user.userNo} ne ${user.userNo}"){--%>
                    <%--$.ajax({--%>
                    <%--    url: "/chatting/insert.do",--%>
                    <%--    data: { divNo: ${uData.divide.divNo}--%>
                    <%--        , userNo: ${user.userNo}--%>
                    <%--        , getUserNo: ${getUser.userNo}--%>
                    <%--        , chatContent: message--%>
                    <%--        , chatRoomNo: ${cList.get(0).chatRoomNo}--%>
                    <%--    },--%>
                    <%--    type: "POST",--%>
                    <%--    success: function(data) {--%>
                    <%--        if(data === "success"){--%>
                    <%--            // alert("insert 성공!");--%>
                    <%--        }else{--%>
                    <%--            alert("채팅저장 실패!");--%>
                    <%--        }--%>

                    <%--    },--%>
                    <%--    error: function() {--%>
                    <%--        alert("Ajax 오류! 관리자에게 문의하세요");--%>
                    <%--    }--%>
                    <%--});--%>

                }
                else{
                    divElement.setAttribute("class", "chatDiv");
                    liElement.setAttribute("class", "self");
                    spanElement.setAttribute("class", "selfTime");
                    var textNode = document.createTextNode(message);
                    liElement.appendChild(textNode);
                    var textNode = document.createTextNode(displayCurrentTime());
                    spanElement.appendChild(textNode);
                    divElement.append(liElement);
                    divElement.append(spanElement);
                    $("#msgArea").append(divElement);

                    if(isSeeing == false){
                        newExcitingAlerts();
                    }
                }
            }

            document.getElementById("msgArea").scrollTop = document.getElementById("msgArea").scrollHeight;
        }
    </script>
</body>
<style>
    .text-box div:nth-child(n+1) {
        display: none;
    }
</style>
</html>
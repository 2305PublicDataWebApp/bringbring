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
        .floating-chat .chat .messages li.self:before {
            background-image: url(${getUser.userProfilePath});
            background-color: white;
        }
        .floating-chat .chat .messages li.other:before {
            background-image: url(${user.userProfilePath});
            background-color: white;
        }
        .header a:link, .header a:visited{
            color: #103b31;
            text-decoration: none;
        }
    </style>
</head>
<body>
    <div style="margin: 0 auto;">
        <div class="floating-chat expand enter">
            <i class="fa fa-comments" ></i>
            <div class="chat">
                <div class="header">
                <span class="title">
                    <span id="closeWindow" style="cursor: pointer;"><</span> &nbsp;
                    ${getUser.userName}
                </span>
                </div>
                <div class="header text-center" style="border-bottom: 1px solid #17594A;padding-left: 10px;margin-bottom: 5px;">
                    <c:if test="${sessionId eq uData.user.userId && room.chatDivYn.toString() eq 'N'}">
                        <button id="divYnBtn" type="button" style="padding: 9px 10px 7px 10px; border-radius: 6px;background-color: #222;font-family: 'LINESeedKR-Bd';font-size: 14px;" readonly>나눔 완료</button>
                    </c:if>
                    <c:if test="${room.chatDivYn.toString() eq 'Y'}">
                        <button id="divYnBtn" type="button" style="pointer-events: none;;padding: 9px 10px 7px 10px; border-radius: 6px;background-color: #656262;font-family: 'LINESeedKR-Bd';font-size: 14px;" readonly>나눔 완료</button>
                    </c:if>
                    <span class="divideTitle">
                        <a href="/divide/detail.do?divNo=${uData.divide.divNo}">
                            ${uData.divide.divTitle}
                        </a>
                    </span>
                </div>
                <ul id="msgArea" class="messages">
<%--                    이전날짜 저장--%>
                    <c:set var="previousDate" value="" scope="page" />
                    <c:forEach var="chat" items="${cList}" varStatus="i">
                        <fmt:parseDate value="${chat.chatCreateDate}" pattern="yyyy-MM-dd'T'HH:mm" var="parseDateTime" type="both" />
                        <fmt:parseDate value="${chat.chatCreateDate}" pattern="yyyy-MM-dd" var="parseDate" type="both" />
                        <c:if test="${parseDate ne previousDate}">
                            <%-- 현재 날짜와 이전 날짜가 다른 경우에만 날짜를 출력합니다. --%>
                            <p class="infoMessageArea">
                                <span class="infoMessage">
                                    <fmt:formatDate value="${parseDate}" pattern="yyyy년 MM월 dd일" />
                                </span>
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
                    <div id="opinion" class="text-box messageArea" contenteditable="true" disabled="true" ></div>
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
        <jsp:include page="/include/loginJs.jsp"></jsp:include>
        //테스트
        $(document).ready(function(){
            openElement();
            var chatroomNo = "${room.chatroomNo}";
            var username = "${user.userName}";

            console.log(chatroomNo + ", " + username);


            var sockJs = new SockJS("/stomp/chat");
            //1. SockJS를 내부에 들고있는 stomp를 내어줌
            var stomp = Stomp.over(sockJs);

            //2. connection이 맺어지면 실행
            stomp.connect({}, function (){
                console.log("STOMP Connection")

                //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                stomp.subscribe("/sub/chatting/"+chatroomNo, function (chat) {

                    var content = JSON.parse(chat.body);

                    var divElement = document.createElement("div");
                    var liElement = document.createElement("li");
                    var spanElement = document.createElement("span");

                    if(content.message === "bringbring chatting start"){
                        message = content.writer + "님이 입장하셨습니다.";
                        var ulElement = document.getElementById("msgArea");
                        var pElement = document.createElement("p");
                        pElement.setAttribute("class", "infoMessageArea");
                        var spanElement = document.createElement("span");
                        spanElement.setAttribute("class", "infoMessage");
                        var textNode = document.createTextNode(message);

                        spanElement.appendChild(textNode);
                        pElement.appendChild(spanElement);
                        ulElement.appendChild(pElement);
                    } else if(content.message === "bringbring chatting close"){
                        message = content.writer + "님이 퇴장하셨습니다.";
                        var ulElement = document.getElementById("msgArea");
                        var pElement = document.createElement("p");
                        pElement.setAttribute("class", "infoMessageArea");
                        var spanElement = document.createElement("span");
                        spanElement.setAttribute("class", "infoMessage");
                        var textNode = document.createTextNode(message);

                        spanElement.appendChild(textNode);
                        pElement.appendChild(spanElement);
                        ulElement.appendChild(pElement);
                    } else if(content.message === "chatting divide complete"){
                        message = "나눔이 완료되었습니다.";
                        var ulElement = document.getElementById("msgArea");
                        var pElement = document.createElement("p");
                        pElement.setAttribute("class", "infoMessageArea");
                        var spanElement = document.createElement("span");
                        spanElement.setAttribute("class", "infoMessage");
                        var textNode = document.createTextNode(message);

                        spanElement.appendChild(textNode);
                        pElement.appendChild(spanElement);
                        ulElement.appendChild(pElement);
                    }else{
                        if(content.userNo === ${user.userNo}){

                            divElement.setAttribute("class", "chatDiv");
                            liElement.setAttribute("class", "other");
                            spanElement.setAttribute("class", "otherTime");
                            var textNode = document.createTextNode(content.message);
                            liElement.appendChild(textNode);
                            var textNode = document.createTextNode(displayCurrentTime());
                            spanElement.appendChild(textNode);
                            divElement.append(liElement);
                            divElement.append(spanElement);
                        }
                        else if(content.userNo !== ${user.userNo}){
                            divElement.setAttribute("class", "chatDiv");
                            liElement.setAttribute("class", "self");
                            spanElement.setAttribute("class", "selfTime");
                            var textNode = document.createTextNode(content.message);
                            liElement.appendChild(textNode);
                            var textNode = document.createTextNode(displayCurrentTime());
                            spanElement.appendChild(textNode);
                            divElement.append(liElement);
                            divElement.append(spanElement);
                        }
                        $("#msgArea").append(divElement);
                    }

                    document.getElementById("msgArea").scrollTop = document.getElementById("msgArea").scrollHeight;
                });

                //3. send(path, header, message)로 메세지를 보낼 수 있음
                stomp.send('/pub/chat/enter', {}, JSON.stringify({chatroomNo: chatroomNo, writer: username, userNo: ${user.userNo}}))
            });

            // divYnBtn 버튼 엘리먼트 가져오기
            var divYnBtn = document.getElementById("divYnBtn");
            // divYnBtn이 존재하면 클릭 이벤트 리스너 추가
            if (divYnBtn) {
                divYnBtn.addEventListener("click", function() {
                    if(confirm("나눔 완료로 바꾸시겠습니까? 한 번 누르면 취소할 수 없습니다.")){
                        // stomp.send()를 사용하여 원하는 동작 수행
                        $.ajax({
                            url: "/chatting/updateDivide.do",
                            data: { chatroomNo : ${room.chatroomNo} },
                            type: "POST",
                            success: function(data) {
                                if(data === "success"){
                                    stomp.send('/pub/chat/divide', {}, JSON.stringify({chatroomNo: chatroomNo, message: "", writer: username, userNo: ${user.userNo}}));
                                }else{
                                    alert("나눔완료 실패!");
                                }

                            },
                            error: function() {
                                alert("Ajax 오류! 관리자에게 문의하세요");
                            }
                        });
                    }
                });

            }


            $("#sendBtn").on("click", function(e){
                // enterkey();
                var msg = document.getElementById("opinion");
                if(msg.textContent.length < 1){
                    return false;
                }
                // DB 보내기
                console.log(username + ":" + msg.textContent);
                $.ajax({
                    url: "/chatting/insert.do",
                    data: { divNo: ${uData.divide.divNo}
                        , userNo: ${user.userNo}
                        , getUserNo: ${getUser.userNo}
                        , chatContent: msg.textContent
                        , chatRoomNo: chatroomNo
                    },
                    type: "POST",
                    success: function(data) {
                        if(data === "success"){

                        }else{
                            alert("채팅저장 실패!");
                        }

                    },
                    error: function() {
                        alert("Ajax 오류! 관리자에게 문의하세요");
                    }
                });

                stomp.send('/pub/chat/message', {}, JSON.stringify({chatroomNo: chatroomNo, message: msg.textContent, writer: username, userNo: ${user.userNo}}));

                // 추가하기 끝
                msg.textContent = '';
            });

            $("#closeWindow").on("click", function(e){
                stomp.send('/pub/chat/close', {}, JSON.stringify({chatroomNo: ${room.chatroomNo}, writer: username, userNo: ${user.userNo}}));
                window.close();

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

        const sendBtn = document.getElementById('sendBtn');
        // 호출하여 현재 시간 표시

        console.log(displayCurrentTime());

        const opinion = document.getElementById('opinion');

        // Enter 키가 눌렸을 때 sendBtn 클릭
        opinion.addEventListener('keydown', function(event) {
            if (event.keyCode === 13) {
                sendBtn.click();
            }
        });


        function onClose(evt) {
            var str = username + ": 님이 방을 나가셨습니다.";
            stomp.send('/pub/chat/message', {}, JSON.stringify({chatroomNo: chatroomNo, message: str, writer: username}));
            // websocket.send(str);
        }



    </script>
</body>
<style>
    .text-box div:nth-child(n+1) {
        display: none;
    }
</style>
</html>
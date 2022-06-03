<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Chat With Stranger</title>
<style>
body {
	background: #21151e;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	font-family: "Courier New", Courier, monospace;
}

span {
	position: relative;
	display: inline;
	padding: 15px 30px;
	color: #bb91b7;
	text-transform: uppercase;
	letter-spacing: 4px;
	text-decoration: none;
	font-size: 24px;
	overflow: hidden;
	transition: 0.2s;
}

textarea, #send, #disconnect, #message {
	position: relative;
	display: inline;
	padding: 5px 10px;
	color: #bb91b7;
	letter-spacing: 4px;
	text-decoration: none;
	font-size: 20px;
	overflow: hidden;
	transition: 0.2s;
}

#chatText, #message {
	color: black;
}

#send:hover, #disconnect:hover {
	color: #bb91b7;
	background: #9e0e86d0;
	box-shadow: 0 0 3px #9e0e86d0, 0 0 9px #9e0e86d0, 0 0 15px #9e0e86d0;
}
</style>
</head>
<body>
	<textarea id="chatText" rows="25" cols="40" disabled></textarea>
	<span> <input id="message" type="text" autocomplete="off">
		<input id="send" onclick="wsSendMessage();" value="Send" type="button">
		<input id="disconnect" onclick="wsCloseConnection();"
		value="Disconnect" type="button">
	</span>
	<br>

	<script type="text/javascript">
            var webSocket = new WebSocket("ws://localhost:8080/groupchat/websocketendpoint");
            var chatText = document.getElementById("chatText");
            chatText.value = "";
            var message = document.getElementById("message");
            webSocket.onopen = function(message) {
                wsOpen(message);
            };
            webSocket.onmessage = function(message) {
                wsGetMessage(message);
            };
            webSocket.onclose = function(message) {
                wsClose(message);
            };
            webSocket.onerror = function(message) {
                wsError(message);
            };

            function wsOpen(message) {
                chatText.value += "Connected ... \n";
            }

            function wsSendMessage() {
                webSocket.send(message.value);
                chatText.value =chatText.value + "me: " +message.value + "\n";
                message.value = "";
            }

            function wsCloseConnection() {
                webSocket.close();
            }

            function wsGetMessage(message) {
                chatText.value += message.data + "\n";
            }

            function wsClose(message) {
                chatText.value += "Disconnect ... \n";
            }

            function wserror() {
                chatText.value += "Error ... \n";
            }
             window.onbeforeunload = function() {
            return "Are you sure you want to leave? ";
        };
        var input = document.getElementById("message");
            input.addEventListener('keyup',(e)=>{
            if (e.keyCode === 13){
                event.preventDefault();
                document.getElementById("send").click();
            }
        });
        </script>
</body>
</html>
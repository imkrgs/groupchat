<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.groupchat.entity.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css"
	integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<style type="text/css">
html, body {
	height: 100%;
	background-color: rgb(16, 7, 25);
}

.content {
	margin: 0;
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
	color: #eadde9;
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
<title>Group chat</title>
</head>
<body>
	<!--nav bar starts -->

	<nav class="navbar sticky-top navbar-dark bg-dark">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"> <i class="fa-solid fa-comments"></i>
				Group Chat
			</a>
			<ul class="narbar-nav">
				<li class="nav-item"><a class="nav-link" aria-current="page"
					href="#" style="color: white"><i class="fa-solid fa-user"></i>
						<%=session.getAttribute("user")%> </a></li>
			</ul>
		</div>
	</nav>

	<!--nav bar ends -->

	<!--main content -->
	<div class="content">
		<textarea class="" id="chatText" rows="19" cols="55"
			disabled></textarea>
		<span> <textarea class="form-control" id="message" rows="1"
				cols="15"></textarea> <input id="send" class="btn"
			onclick="wsSendMessage();" value="Send" type="button" /> <input
			id="disconnect" class="btn" onclick="wsCloseConnection();"
			value="Disconnect" type="button" />
		</span>
		 <input type="hidden" id="uid" name="uid" value="<%=session.getAttribute("user")%>">
	</div>
	<!--content ends -->

	<!--footer starts here -->
	<footer class="footer">
		<div class="container text-center">
			<small>Copyright &copy; Group Chat Created By IMKRGS</small>
		</div>
	</footer>
	<!--footer ends here -->


	<script type="text/javascript">
          var webSocket = new WebSocket(
            "ws://localhost:8080/groupchat/websocketendpoint"
          );
          var uid = document.getElementById("uid").value;
          
          var chatText = document.getElementById("chatText");
          
          chatText.value = "";
          var message = document.getElementById("message");
          
          webSocket.onopen = function (message) {
            wsOpen(message);
          };
          
          webSocket.onmessage = function (message) {
            wsGetMessage(message);
          };
          
          webSocket.onclose = function (message) {
            wsClose(message);
          };
          
          webSocket.onerror = function (message) {
            wsError(message);
          };

          function wsOpen(message) {
            chatText.value += "Connected ... \n";
          }

          function wsSendMessage() {
        	let jdata = '{"username":'+uid+', "message":'+message.value+'}';
            webSocket.send(jdata);
            chatText.value = chatText.value + " me :" + message.value + "\n";
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
          window.onbeforeunload = function () {
            return "Are you sure you want to leave? ";
          };
          var input = document.getElementById("message");
          input.addEventListener("keyup", (e) => {
            if (e.keyCode === 13) {
              event.preventDefault();
              document.getElementById("send").click();
            }
          });
        </script>
</body>
</html>

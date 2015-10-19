<%@ page contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>밥친구닷컴</title>
		<style type="text/css">
			*{
				margin:0px;
				padding:0px;
			}
			#top{
				min-width:940px;
				display:flex;
				min-height: 
			}
			#logo{
				text-align:center;
				width:200px;
				margin: 10px; 0px;
				display:inline-block;
			}
			#join{
				width:250px;
				border:20px;
				padding:20px;
				text-align:center;
				display:inline-block;
			}
			#tab_design{
				margin-top:10px;
				flex:1;
				margin-bottom:0px;
				margin-left:80px;
				padding:18px;
			}
			#menu{
				margin:auto;
				text-align:center;
				width:700px;
			}
			.i{
				background-color:#FF0000;
				font-size:large;
				padding:10px;
				text-align:center;
				color:white;
				display:inline-block;
			}
			#content{
				display:flex;
				height:100%;
			}
			#content1{
				text-align:center;
				width:250px;
			}
			#content2{
				height:100%;
				flex:1;
				display: inline-block;	
			}
			#content3{
				width:330px;
			}
			#side1{
				height:150px;
			}
			#frame{
				width:100%;
				height:83vh;
			}
			.tab_menu li {/*아이콘 및 카테고리 글쓰를 포함하는 li*/
			  position: relative;
			  float: left;
			  list-style:none;
			  margin-right: 2px;
			}
			.tab_menu li a {
			  display: block;
			  padding: 0.5em 1.5em;
			  background: #e5e9ea;
			  color: #607291;
			  font-size: 16px;
			  -webkit-border-radius: 7px 7px 0 0;
			  -webkit-transition: all 0.2s;
			}
			.tab_menu li:hover a, 
			.tab_menu li a:focus, 
			.tab_menu li.active a {/*a태그(아이콘및 글씨)위에 마우스 커서가 올라갔을 때, a에 focus됬을 때, a가 클릭됬을 때*/
			  padding-left: 2.2em;
			  padding-right: 0.8em;
			  background: #f9f9f9;
			  -webkit-box-shadow: 1px -1px 2px #5c5c5c;
			}
			.tab_menu li img {
			  opacity: 0;
			  position: absolute;
			  top: 7px;
			  left: 16px;
			  -webkit-transition: all 0.2s;
			}/*탭 메뉴의  img태그에 대해  투명도를 0으로 하여 안보이게 하고 변화가 있을 시 모든 변화에 대해 수행 시간을 0.2초로 한다.*/
	
			.tab_menu li:hover img,
			.tab_menu li.active img {
			  opacity: 1;
			  left: 6px;
			}
			.i{
				width:200px;
				font-size:large;
				background:red;
				color:white;
				height:50px;
			}
			
		</style>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript">
			$(function() {
				var $menu_li = $('.tab_menu li');
				var $menu_a = $menu_li.find('a');
					
				// $menu 내부의 a 클릭 시 이벤트 핸들링
				$menu_a.click(function(e) {		
					// 대상 참조.
					var $this = $(this);
						
					// 활성화된 a 클릭 시, 작동하지 않도록 설정.
		 			if($this.parent().hasClass('active')) return;
		 			
		 			// $menu_link에서 active 클래스 제거
					$menu_li.removeClass('active');
					
					// 클릭한 a의 부모 li에 active 클래스 추가
					$this.parent().addClass('active');
				
					// 브라우저 링크 기본 동작 차단
					//e.preventDefault();
				});
			});
			
			//여기서 부터 채팅 관련 스크립트 
			//웹소켓 전역 변수 선언
			var ws = null;

			//연결 하기
			function connect() {
				ws = new WebSocket("ws://" + window.location.host + "/FriendsBob/chatgroup-ws");
				ws.onopen = function () {
				    log("[info] WebSocket 연결 됨");					
					setConnected(true);
				};
				ws.onmessage = function (event) {
				    log('[info] 받은 메시지 :' + event.data);
				    handleTextMessage(event.data);
				};
				ws.onclose = function (event) {
				    log('[info] WebSocket 연결 닫힘');
				    setConnected(false);
				};
			}
            
            //연결 닫기
            function disconnect() {
                if (ws != null) {
                    ws.close();
                    ws = null;
                }
                setConnected(false);
            }
            
            //요소 활성화 정리
            function setConnected(connected) {  
            	if(connected) {
            		$("#btnConnect").attr("disabled","disabled");
					$("#btnDisConnect").removeAttr("disabled");
                    
                    $("#userName").removeAttr("disabled"); 
                    $("#btnAddUser").removeAttr("disabled");
                    
                    $("#groupName").removeAttr("disabled");
                    $("#btnChangeGroup").removeAttr("disabled");
                    $("#newGroupName").removeAttr("disabled");                   
                    $("#btnAddGroup").removeAttr("disabled");
                    
                    $("#message").removeAttr("disabled");
                    $("#btnSend").removeAttr("disabled");
            	} else {
                    $("#groupList li").remove();
                    $("#userList li").remove();
                    
                    $("#userName").val("");
                    $("#groupName").val("기본그룹");
                    
                    $("#btnConnect").removeAttr("disabled");
                    $("#btnDisConnect").attr("disabled","disabled");
                    
                    $("#userName").attr("disabled","disabled");  
                    $("#btnAddUser").attr("disabled","disabled");
                    
                    $("#groupName").attr("disabled","disabled");
                    $("#btnChangeGroup").attr("disabled","disabled");
                    $("#newGroupName").attr("disabled","disabled");                    
                    $("#btnAddGroup").attr("disabled","disabled");
                    
                    $("#message").attr("disabled","disabled");
                    $("#btnSend").attr("disabled","disabled");
            	}
            }
            
            //텍스트 메시지 처리
            function handleTextMessage(strJson) {
			    var json = JSON.parse(strJson);
			    var command = json.command;
			    var data = json.data;
			    if(command=="refreshGroupUserList") { 
			    	refreshGroupUserList(data); 
			    } else if(command=="appendChatText") {
			    	log(data.chatText);
			    }
            }
            
            //사용자 등록
            function addUser() {
				var userName = $("#userName").val();
				if(userName == "") {
					alert("사용자 이름을 입력하세요");
					return;
				}
				ws.send(JSON.stringify({
                	command: "addUser",
                	data: {
                		"groupName": "기본그룹",
                		"userName": userName
                	}
                }));
            }
            
            //그룹 등록
            function addGroup() {
            	var newGroupName = $("#newGroupName").val();
            	if(newGroupName == "") {
            		alert("새 그룹 이름을 입력하세요");
					return;
            	}
            	ws.send(JSON.stringify({
                	command: "addGroup",
                	data: {
                		"groupName": newGroupName
                	}
                }));
            	$("#newGroupName").val("");
            }
            
            //그룹 등록
            function changeGroup() {
            	var userName = $("#userName").val();
            	if(userName=="") { 
            		alert("사용자 이름을 입력하세요."); 
            		return;
            	}
            	var groupName = $("#groupName").val();
            	if(groupName=="") { 
            		alert("그룹 이름을 입력하세요."); 
            		return;
            	}
            	ws.send(JSON.stringify({
                	command: "changeGroup",
                	data: {
                		"groupName": groupName,
                		"userName": userName
                	}
                }));
            }            
            
            //그룹에 속하는 회원 이름 나타내기
            function refreshGroupUserList(data) {
            	$("#groupList li").remove();
            	$("#userList li").remove();
            	for(var i=0; i<data.length; i++) {
            		var group = data[i];
            		$("#groupList").append("<li>" + group.groupName + "</li>");
            		if(group.groupName == $("#groupName").val()) {
    	            	for(var j=0; j<group.userNames.length; j++) {
    	            		$("#userList").append("<li>" + group.userNames[j] + "</li>");
    	            	}
            		}
            	}
            }
			
			function sendMessage() {
				var groupName = $("#groupName").val();
				if(groupName == "") {
					alert("그룹 이름을 입력하세요");
					return;
				}
				
				var userName = $("#userName").val();
				if(userName == "") {
					alert("사용자 이름을 입력하세요");
					return;
				}
				
				var message = $("#message").val();	
				if(message == "") {
					alert("메시지를 입력하세요");
					return;
				}
				
                var jsonMessage = {
                	command: "broadcast",
                	data: {
	                	"groupName": groupName, 
	                	"chatText": "[" + userName + "] " + message
                	}
                };
                ws.send(JSON.stringify(jsonMessage));
                $("#message").val("");
	        }			
			
			function log(message) {
				//if(message.indexOf("[info]") != -1) return;
				var console = document.getElementById('console');
				var p = document.createElement('p');
				p.style.wordWrap = 'break-word';
				p.appendChild(document.createTextNode(message));
				console.appendChild(p);
				while (console.childNodes.length > 25) {
				    console.removeChild(console.firstChild);
				}
				console.scrollTop = console.scrollHeight;
			 }
		</script>
			
		</script>
	</head>
	<body>
	<div id="all">
		<div id="top">
				<div id="logo">
					<img src="${pageContext.request.contextPath}/resources/images/logo.jpg"/>
				</div>
				<div id="tab_design">
					<nav class="tab_menu clearfix">
						<ul>
							<li>
								<a href="Mypage/myPageMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/person.png" alt=""/>마이페이지
								</a>
							</li>
							<li>
								<a href="Meeting/meetingMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/cal.png" alt=""/>약속목록
								</a>
							</li>
							<li>
								<a href="Matjib/matjibMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/list.png" alt=""/>맛집정보
								</a>
							</li>
							<li>
								<a href="Review/reviewMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/good.png" alt=""/>모임후기
								</a>
							</li>
							<li>
								<a href="Partner/partnerMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/home.png" alt=""/>제휴사
								</a>
							</li>
						</ul>
					</nav>
				</div>
				<div id="join">
					<a href="exit"><button class="i">로그아웃</button></a>
				</div>
			</div><hr/>
			<div id="content">
				<iframe id="frame" name="main">
				</iframe>
				<hr>
				<div id="content3">
					<div id="side1">
						<h4>그룹 목록</h4>
						<ul id="groupList">
						</ul>
					<h4>그룹 사용자</h4>
						<ul id="userList">
						</ul>
					</div><hr>
					<div id="side2">
						<div id="connectionBox">
						<button id="btnConnect" onclick="connect()">연결하기</button>
						<button id="btnDisConnect" onclick="disconnect()" disabled>연결끊기</button>
					</div>
					<div id="userBox">
						<label>사용자</label>
						<input id="userName" type="text" placeholder="사용자 이름 입력" disabled/>
						<button id="btnAddUser" onclick="addUser()" disabled>등록</button>
					</div>				
					<div id="groupBox">
						<label>그룹명</label>
						<input id="groupName" type="text" value="기본그룹" disabled/>
						<button id="btnChangeGroup" onclick="changeGroup()" disabled>변경</button>
						<label>새그룹</label>
						<input id="newGroupName" type="text" placeholder="새 그룹 이름 입력" disabled/>
						<button id="btnAddGroup" onclick="addGroup()" disabled>등록</button>
					</div>
					<div id="console"></div>
					<div id="sendBox">
						<input id="message" type="text" disabled/>
						<button id="btnSend" onclick="sendMessage()" disabled>보내기</button>
					</div>
						
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

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
			.tab_menu li a:hover, 
			.tab_menu li a:focus, 
			.tab_menu li a:active {/*a태그(아이콘및 글씨)위에 마우스 커서가 올라갔을 때, a에 focus됬을 때, a가 클릭됬을 때*/
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
		</script>
	</head>
	<body>
	<div id="all">
		<div id="top">
				<div id="logo">
					<img src="${pageContext.request.contextPath}/resources/images/logo.jpg"/>
				</div>
				<div id="tab_design">
					<nav class="tab_menu">
						<ul>
							<li>
								<a href="#" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/p.JPG" alt=""/>마이페이지
								</a>
							</li>
							<li>
								<a href="Meeting/meetingMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/l.JPG" alt=""/>약속목록
								</a>
							</li>
							<li>
								<a href="Matjib/matjibMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/m.JPG" alt=""/>맛집정보
								</a>
							</li>
							<li>
								<a href="Review/reviewMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/g.JPG" alt=""/>모임후기
								</a>
							</li>
							<li>
								<a href="Partner/partnerMain" style="text-decoration:none;" target="main">
								<img src="${pageContext.request.contextPath}/resources/images/h.JPG" alt=""/>제휴사
								</a>
							</li>
						</ul>
					</nav>
				</div>
				<div id="join">
					<button class="i">밥친구닷컴 나가기</button>
				</div>
			</div><hr>
			<div id="content">
				<iframe id="frame" name="main">
				</iframe>
				<hr>
				<div id="content3">
					<div id="side1">센
					</div><hr>
					<div id="side2">
					</div>
				</div>
			</div>
		</div>
	</body>
</html>

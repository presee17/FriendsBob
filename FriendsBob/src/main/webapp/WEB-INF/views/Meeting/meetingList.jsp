<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<style type="text/css">
			body {
				color: black;
			}
			table {
				width: 100%;
				border-collapse: collapse;
				font-size: small;
			}
			table, th, td {
				border: 1px solid black;
				text-align: center;
			}
			th {
				background-color: orange;
				color: black;
			}
			
			#buttonGroup {
				margin: 10px;
				text-align: center;
			}
			
			#buttonGroup a {
				display:inline-block;
				width: 70px;
				line-height: 30px;
				text-decoration: none;
				font-size: small;
				color: black;
				border: 1px solid darkgray;
				background-color: gray;
				font-weight: bold;
			}
			
			#buttonGroup a:hover {
				color: black;
				background-color: lightgray;
			}
			
			#pager {
				margin-top: 5px;
				text-align: center;
				font-size: small;
			}
			
			#pager a {
				text-decoration: none;
				color: black;
			}
			
			#pager a:hover {
				color: black;
			}
			
			#pager a.pageNo {
				margin-left: 5px;
				margin-right: 5px;
			}
			
			#pager a.pageNo.selected {
				color: aqua;
			}
			
			.title {
				text-decoration: none;
				color: black;
			}	
			.title:hover {
				color: orange;
			}
		</style>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/excite-bike/jquery-ui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smartedit/js/HuskyEZCreator.js" charset="utf-8"></script>
		<script src="//code.jquery.com/jquery-1.10.2.js"></script>
		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
		<link rel="stylesheet" href="/resources/demos/style.css">
		<script>
		  $(function() {
		    $( "#wd" ).dialog({
		      autoOpen: false,
		      show: {
		        effect: "blind",
		        duration: 300
		      },
		      hide: {
		        effect: "blind",
		        duration: 300
		      },
		      modal : true,
		    });
		 
		    $( "#wBtn" ).click(function() {
		      $( "#wd" ).dialog( "open" );
		    });
		  });
		</script>
		
	</head>
	
	<body>
		<h4>게시물 목록</h4>
		<div id = "wd" title ="게시글쓰기">
		<form name="Form" id="Form" method="post" action="write">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" id="title" name="title"/></td>
				</tr>
				
				<tr>
					<td>상호 명</td>
					<td><input type="text" id="name" name="name"/></td>
				</tr>
				
				<tr>
					<td>최대 참여 인원</td>
					<td><input type="number" id ="total" name="total"/></td>
				</tr>
				
				<tr>
					<td>시/군/구</td>
					<td><input type="text" id ="address1" name="address1"/></td>
				</tr>
				
				<tr>
					<td>동/면/읍</td>
					<td><input type="text" id ="address2" name="address2"/></td>
				</tr>
				
				<tr>
					<td>음식 종류</td>
					<td><input type="text" id ="food" name="food"/></td>
				</tr>
				
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="ir1" rows="5" cols="50">${meeting.content}</textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="button" onclick="submitContents(this)" value="글올리기"/>					
					</td>
				</tr>
			</table>
		</form>
		
 		<script type="text/javascript">
 		
			var oEditors = [];
			
			// 추가 글꼴 목록
			//var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
			
			nhn.husky.EZCreator.createInIFrame({
				oAppRef: oEditors,
				elPlaceHolder: "ir1",
				sSkinURI: "${pageContext.request.contextPath}/resources/smartedit/SmartEditor2Skin.html",	
				htParams : {
					bUseToolbar : true,				// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseVerticalResizer : true,		// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
					bUseModeChanger : true,			// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
					//aAdditionalFontList : aAdditionalFontSet,		// 추가 글꼴 목록
					fOnBeforeUnload : function(){
						//alert("완료!");
					}
				}, //boolean
				fOnAppLoad : function(){
					//예제 코드
					//oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
				},
				fCreator: "createSEditor2"
			});
			function submitContents(elClickedObj) {
				oEditors.getById["ir1"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
				var Form = document.Form;
				console.log(Form);
				
				//var title = document.querySelector("#title");
				var title = document.Form.title;
				console.log(title);
				
				var content = document.Form.ir1;
				
				if(title.value == "" || content.value == "") {
					alert("제목과 내용은 있어야 합니다.");
					return;
				}
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
				
				try {
					elClickedObj.form.submit();
				} catch(e) {}
			}
		</script>
		
		</div>
			
		<table>
			<tr>
				<th style="width:50px">번호</th>
				<th>제목</th>
				<th style="width:60px">글쓴이</th>
				<th style="width:80px">음식 종류</th>
				<th style="width:80px">날짜</th>
				<th style="width:80px">지역</th>
			</tr>
			
			<c:forEach var="meeting" items="${list}">
				<tr>
					<td>${meeting.no}</td>
					<td><a class="title" href="detail?boardNo=${meeting.no}">${meeting.title}</a></td>
					<td>${meeting.memberId}</td>
					<td>${meeting.food}</td>
					<td>${meeting.date}</td>
					<td>${meeting.address1} ${meeting.address2}</td>
				</tr>
			</c:forEach>
		</table>
		
		<div id="pager">
			<a href="list?pageNo=1">[처음]</a>
			
			<c:if test="${groupNo>1}">
				<a href="list?pageNo=${startPageNo-pagesPerGroup}">[이전]</a>
			</c:if>
			
			<c:forEach var="i" begin="${startPageNo}" end="${endPageNo}">
				<a class="pageNo <c:if test="${pageNo==i}">selected</c:if>" 
				   href="list?pageNo=${i}">${i}</a>
			</c:forEach>
			
			<c:if test="${groupNo<totalGroupNo}">
				<a href="list?pageNo=${endPageNo+1}">[다음]</a>
			</c:if>		
	
			<a href="list?pageNo=${totalPageNo}">[맨끝]</a>
		</div>		
		
		<div id="buttonGroup">
			<button id="wBtn">글쓰기</button>
		</div>
	</body>
</html>
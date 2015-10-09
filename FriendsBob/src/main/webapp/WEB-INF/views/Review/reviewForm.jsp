<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기 작성 페이지</title>
		<script type="text/javascript" src="./resources/smartedit/js/HuskyEZCreator.js" charset="utf-8"></script>
		<style type="text/css">
			body {
				font-size: small;
				color: black;
			}
			
			input {
				font-size: 12px;
			}
		</style>
	</head>
	
	<body>
		<h4>후기작성</h4>
		<form method="post" action="write">
			<table width="100%">
				<tr>
					<td>제목</td>
					<td><input type="text" name="title"/></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="writer"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="content" id="content" rows="5" cols="50"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="submit" value="글올리기"/>
						<input type="reset" value="다시작성"/>					
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
				elPlaceHolder: "content",
				sSkinURI: "./resources/smartedit/SmartEditor2Skin.html",	
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
				oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
				
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
				
				try {
					elClickedObj.form.submit();
				} catch(e) {}
			}
	
	</script>
	</body>
<%@ page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE>
<html>
	<head>
		<meta charset="UTF-8">
		<title>후기 작성 페이지</title>
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/smartedit/js/HuskyEZCreator.js" charset="utf-8"></script>
		<style type="text/css">
			body {
				font-size: small;
				color: black;
			}
			
			input {
				font-size: 12px;
			}
		</style>
	</head>
	
	<body>
		<h4>후기작성</h4>
		<form method="post" action="write">
			<table width="100%">
				<tr>
					<td>제목</td>
					<td><input type="text" name="reviewTitle"/></td>
				</tr>
				<tr>
					<td>글쓴이</td>
					<td><input type="text" name="reviewWriter"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="reviewContent" id="reviewContent" rows="5" cols="50">ss</textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="submit" value="글올리기"/>
						<input type="reset" value="다시작성"/>					
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
				elPlaceHolder: "reviewContent",
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
				oEditors.getById["reviewContent"].exec("UPDATE_CONTENTS_FIELD", []);	// 에디터의 내용이 textarea에 적용됩니다.
				
				// 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
				
				try {
					elClickedObj.form.submit();
				} catch(e) {}
			}
	
	</script>
	</body>
</html>
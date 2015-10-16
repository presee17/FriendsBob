<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE>
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
			}
			#logo{
				flex:1;
				margin: 10px; 0px;
				display:inline-block;
			}
			#join{
				border:20px;
				padding:20px;
				display:inline-block;
			}
			#talk{
				flex:3;
			}
			.i{
				font-size:large;
				padding:10px;
				text-align:center;
				display:inline-block;
			}
			.middle{
				width:750px;
				text-align: left;
				
			}
			#main{
				width:100%;
				height:500px;
			}
			#comment1{
				height:40px;
				width:450px;
				position:absolute;
				top:200px;
				left:450px;
				color: white;
				font-weight:bolder;
				background-color:rgba(0,0,0,0);
				padding:5px;
				font-size: x-large;
			}
			#comment2{
				height:40px;
				width:600px;
				text-align:center;
				position:absolute;
				top:400px;
				left:380px;
				background-color:white;
				padding:5px;
				background-color:rgba(0,0,0,0);
				color: white;
				font-size: xx-large;
			}
			#btn{
				height:40px;
				width:150px;
				position:absolute;
				top:300px;
				left:600px;
				font-weight:bolder;
				font-size: large;
				background-color: orange;
				color: white;
			}
		</style>
		
		<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/excite-bike/jquery-ui.css">
		<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-1.11.3.min.js"></script>
 		<script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
    	<script type="application/javascript">
    	
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
    		      }
    		      modal: true,
    		    });
    		 	
    		    $( "#lBtn" ).click(function() {
    		      $( "#ld" ).dialog( "open" );
    		    });
    		  });
	</script> 
	<body>
	<div id = "wd">
		<div title="모임 만들기">
		<hr/>
		<h4>후기작성</h4>
		<form name="Form" id="Form" method="post" action="write">
			<table>
				<tr>
					<td>제목</td>
					<td><input type="text" id="title" name="reviewTitle"/></td>
				</tr>
				<tr>
					<td>내용</td>
					<td><textarea name="reviewContent" id="ir1" rows="5" cols="50"></textarea></td>
				</tr>
				
				<tr>
					<td colspan="2" style="text-align: center;">
						<br/>
						<input type="button" onclick="submitContents(this)" value="글올리기"/>
						<input type="reset" value="다시작성"/>					
					</td>
				</tr>
			</table>
		</form>
		</div>
		
		<script type="text/javascript" id>

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
	</body>
</html>
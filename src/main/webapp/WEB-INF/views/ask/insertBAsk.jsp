<%@page contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>문의등록(B)</title>
<!-- <link rel="stylesheet" href="/css/basic.css"> -->
<%@ include file="/resources/css/basic.css" %>

<style>
h1 {
	font-family: 'MICEGothic Bold';
	font-size: 20px;
}
.commuarea{
  width : 100%;
  height : 20px;
  border : 2px solid #88b04b;
  border-radius: 2px;
}
textarea{
  width : 100%;
  border : 2px solid #88b04b;
  height : 500px;
  border-radius: 2px;
}

.buttonzone{
	text-align: center;
}

button{
	font-family: 'MICEGothic Bold';
	margin : 20px;
}

.searchbutton{
	padding: 12px 40px; 
	font-size: 22px;
	border : 1px solid #858C74;
	border-radius: 5px;
	background-color: #88b04b;
	font-family: 'MICEGothic Bold';
	color : #FFF;
}
</style>

</head>
<body>

<header>
<jsp:include page="../header.jsp"></jsp:include>
</header>

<div class="outline">

	<div class="c_page">
		<div class="title">문의 등록(B)</div>
	</div>
	
	<hr><br>
	
	<form action="insertBAsk.zo" method="post">
		<input type="hidden" name="bm_no" value="${ask.bm_no}" /><!-- (임시값)세션으로 들어갈 자리임. -->
		<input type="hidden" name="a_pmm" value="${0}" /><!-- 관리자 번호는 0번으로 고정해서 들어갈 것. -->
		<h1 class="commutitle">제목</h1>
			<input type="text" name="a_title" class="commuarea"/>
			<div class="container" style="height: 10px;"></div>
		<h1 class="commutitle">브랜드이름</h1><!-- (임시값)세션으로 들어갈 자리임. -->
			<input type="text" value="${ask.bi_name}" readonly="readonly" class="commuarea"/>
			<div class="container" style="height: 10px;"></div>
		<h1 class="commutitle">내용</h1>
			<textarea name="a_content" cols="40" rows="10"></textarea>
		<br><br>
		<div class="buttonzone">
			<button type="submit" class="searchbutton">새글 등록</button>
		</div>
	</form>
	
	<button onclick="location.href='getBAskList.zo'" class="backbutton">돌아가기</button>
	
	<br><br><br><br><br><br>
	
</div>

	
<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
	
</body>
</html>
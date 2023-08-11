<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫밀리마트:Pet-millyMart</title>
<!-- CSS 파일 연결 -->

<%@ include file="/resources/css/main.css"%>
<!-- 스위퍼 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">


<script type="text/javascript" src="resources/js/jssource.js">
	/* function listView(userid){
	 let f = document.createElement('form');
	
	 let obj;
	 obj = document.createElement('input');
	 obj.setAttribute('type', 'hidden');
	 obj.setAttribute('name', 'p_pno');
	 obj.setAttribute('value', userid);
	
	 f.appendChild(obj);
	 f.setAttribute('method', 'post');
	 f.setAttribute('action', 'getProduct.do');
	 document.body.appendChild(f);
	 f.submit();
	 }

	 function goPost(){
	 let f = document.createElement('form');
	 f.setAttribute('method', 'post');
	 f.setAttribute('action', 'getProduct.do?p_pno=1');
	 document.body.appendChild(f);
	 f.submit();
	 } */
</script>

</head>
<body>
	<header>

		 <jsp:include page="header.jsp"></jsp:include>



	</header>
	<main>
		<h1>Brand</h1>
		<!-- 각종 브랜드 -->
		<div class="brand_list">

			<a href="brand1.bt"><img class="brand"
				src="resources/brandlogo/brandlogo1.png" alt="슈펫"></a> <a
				href="brand2.bt"><img class="brand"
				src="resources/brandlogo/brandlogo2.png"></a> <a href="brand3.bt"><img
				class="brand" src="resources/brandlogo/brandlogo3.png"></a> <a
				href="brand4.bt"><img class="brand"
				src="resources/brandlogo/brandlogo4.png" alt="슈펫"></a> <a
				href="brand5.bt"><img class="brand"
				src="resources/brandlogo/brandlogo5.png"></a> <a href="#"><img
				class="brand"
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40uiu186G3wH1OAsQRFLlWoAHOADoULSp_w&usqp=CAU"></a>
			<a href="#"><img class="brand"
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40uiu186G3wH1OAsQRFLlWoAHOADoULSp_w&usqp=CAU"></a>
			<a href="#"><img class="brand"
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40uiu186G3wH1OAsQRFLlWoAHOADoULSp_w&usqp=CAU"></a>
			<a href="#"><img class="brand"
				src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT40uiu186G3wH1OAsQRFLlWoAHOADoULSp_w&usqp=CAU"></a>


		</div>
		<br> <br>
		<!-- 이벤트 및 광고 -->
		<%--  <%@include file="slideShow.jsp" %>--%>

		<br> <br> <a href="javascript:void(0)"
			onClick="javascript:goPost()">클릭시 POST로 페이지 </a> <a
			href="javascript:listView('1')">유저아이디</a>
		<h1>Product</h1>
		<!--신상or할인or베스트  -->
		<div class="productcard_list">

			<c:set var="i" value="0" />
			<c:set var="j" value="7" />



			<table>
				<c:forEach items="${productList}" var="product">
				
				
					<c:if test="${i%j==0}">
							<tr>
						</c:if>

						<div class="productcard_box" onclick="'href=#'">
							<div class="productcard_head">

								<a href="getProduct.do?p_pno=${product.p_pno}"><img
									class="productcard" src="./MemberUpload/${product.p_pimg}"></a>

							</div>
							<h5 class="productcard_body_title" align="center">${product.p_name}<br>${product.p_disprice}원</h5>
						</div>
						
						
								<c:if test="${i%j==j-1}">
							</tr>
						</c:if>
						<c:set var="i" value="${i+1}" />
						
						
				</c:forEach>
			</table>




			<!-- <div class="productcard_box" >
			<div class="productcard_head">
			
			<a href="getProduct.do?p_pno=1">
			<img class="productcard" src="http://image.auction.co.kr/itemimage/18/29/6c/18296c8816.jpg">
			</a>
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">강아지 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div>
	    <div class="productcard_box" onclick="'href=#'">
			<div class="productcard_head">
			<img class="productcard" src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTcvOFyTqelbvW-YSYhH4gESnDjXyq8BPFjrw&usqp=CAU">
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">고양이 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div>
		<div class="productcard_box" onclick="'href=#'">
			<div class="productcard_head">
			<img class="productcard" src="http://image.auction.co.kr/itemimage/18/29/6c/18296c8816.jpg">
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">강아지 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div>
		<div class="productcard_box" onclick="'href=#'">
			<div class="productcard_head">
			<img class="productcard" src="http://image.auction.co.kr/itemimage/18/29/6c/18296c8816.jpg">
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">강아지 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div>
		<div class="productcard_box" onclick="'href=#'">
			<div class="productcard_head">
			<img class="productcard" src="http://image.auction.co.kr/itemimage/18/29/6c/18296c8816.jpg">
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">강아지 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div>
		<div class="productcard_box" onclick="'href=#'">
			<div class="productcard_head">
			<img class="productcard" src="http://image.auction.co.kr/itemimage/18/29/6c/18296c8816.jpg">
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">강아지 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div>
		<div class="productcard_box" onclick="'href=#'">
			<div class="productcard_head">
			<img class="productcard" src="http://image.auction.co.kr/itemimage/18/29/6c/18296c8816.jpg">
			</div>
			<div class="productcard_body">
				<p class="productcard_body_title">강아지 사료</p>
				<p class="productcard_body_content">5,000<p>
			</div>
		</div> -->
		</div>

		<br> <br> <br> <br>

	</main>

	<jsp:include page="footer.jsp"></jsp:include>


</body>
</html>
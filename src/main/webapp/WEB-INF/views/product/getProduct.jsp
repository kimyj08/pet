<%@page contentType="text/html; charset=UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html >
<html>
<head>

<%@include file = "/resources/css/basic.css" %>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>상품 상세</title>
  
<style>
body {
	font-family: 'KoPubWorldDotum';
	width: 100%;
	height: 100%;
}

@font-face {
	font-family: 'twayair';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_tway@1.0/twayair.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'MICEGothic Bold';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2206-01@1.0/MICEGothic Bold.woff2')
		format('woff2');
	font-weight: 700;
	font-style: normal;
}

@font-face {
	font-family: 'KoPubWorldDotum';
	font-weight: 300;
	font-style: normal;
	src:
		url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumLight.eot');
	src:
		url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumLight.eot?#iefix')
		format('embedded-opentype'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumLight.woff2')
		format('woff2'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumLight.woff')
		format('woff'),
		url('https://cdn.jsdelivr.net/gh/webfontworld/kopus/KoPubWorldDotumLight.ttf')
		format("truetype");
	font-display: swap;
}

.form {
	margin-left: 100px;
	margin-right: 100px;
}

.title {
	font-family: 'MICEGothic Bold';
	font-size: xx-large;
}

.sub_txt {
	float: right;
	font-family: 'KoPubWorldDotum';
}

table {
	border-top: solid 2px #858C74;
	border-bottom: solid 2px #858C74;
	width: 65%;
	border-spacing: 0px;
}

th {
	padding: 20px;
	background-color: #92bd51;
	color: white;
	border-top: solid 1px #858C74;
	border-bottom: solid 1px #858C74;
}

td {
	/* border-top: solid 1px #858C74; */
	padding-left: 10px;
	border-bottom: solid 1px #858C74;
}

.tip_txt {
	font-size: x-small;
}

/* ul li {
	font-family: 'KoPubWorldDotum';
	list-style: none;
	list-style-type: none;
	display: inline;
	float: left;
} */

.checkbutton {
	padding: 2px 8px;
	background-color: #92bd51;
	border-radius: 5px;
	border: 1px solid;
	font-size: smail;
}

.backbutton {
	padding: 12px 40px;
	font-size: 22px;
	border: 1px solid black;
	border-radius: 5px;
	background-color: #FFFFFF;
}

.submitbutton {
	padding: 12px 40px;
	font-size: 22px;
	border: 1px solid black;
	border-radius: 5px;
	background-color: black;
	color: #FFFFFF;
}
</style>
<script type="text/javascript">

var sell_price;
var amount;

	function init () {
	 sell_price = document.form.sell_price.value;
	 amount = document.form.s_quantity.value;
	 document.form.sum.value = sell_price;
	 change();
	}

	function add () {
	 hm = document.form.s_quantity;
	 sum = document.form.sum;
	 hm.value ++ ;

	  sum.value = parseInt(hm.value) * sell_price; 
	  
	  
	}

	function del () {
	 hm = document.form.s_quantity;
	 sum = document.form.sum;
	  if (hm.value > 1) {
	   hm.value -- ;
	    sum.value = parseInt(hm.value) * sell_price;
	  }
	}

	function change () {
	 hm = document.form.s_quantity;
	 sum = document.form.sum;

	  if (hm.value < 0) {
	   hm.value = 0;
	  }
	 sum.value = parseInt(hm.value) * sell_price;
	} 
	
	function togo(){
		
		alert(document.getElementById("sum").value)
	}
	
</script>
</head>
<body onload="init();">
<jsp:include page="./../header.jsp"></jsp:include>

	<center>
		<h1>제품상세페이지</h1>
		<hr>
		<form action="getBuy.sj" method="post" enctype="multipart/form-data" name="form">
			<input name="p_pno" type="hidden" value="${product.p_pno}" />
			<input name="um_no" type="hidden" value="${userNo}">
			<input name="bm_no" type="hidden" value="${product.bm_no}">
			<table>
				<colgroup>
					<col width="150">
					<col width="*">
					<col width="150">
					<col width="*">
				</colgroup>
				<tbody>
	
				
				
				
					<tr>
						<td rowspan="10" class="ess"><img
							src="./MemberUpload/${product.p_pimg}" width="350" height="440"></td>

					</tr>


					<tr>
						<td class="ess"><span class="tit">제품명 |
								${product.p_name}</span></td>
						<td align="left"></td>

					</tr>

					<tr>
						<td class="ess"><span class="tit">판매가격 |
								${product.p_price}
									<input type="hidden" name="sell_price" value="	${product.p_price}">
								</span></td>
						<td align="left"></td>
					</tr>

					<tr>
						<td class="ess"><span class="tit">상세정보 |
								${product.p_detail}</span></td>
						<td align="left"></td>
					</tr>



					<tr>
						<td class="ess"><span class="tit">등록일시 |
								${product.p_regdate}</span></td>
						<td align="left"></td>
					</tr>



					<tr>

						<td class="ess"><span class="tit">A/S가능여부 |
								${product.p_as}</span></td>
						<td align="left"></td>
					</tr>



					<tr>
						<td class="ess"><span class="tit">반품가능여부 |
								${product.p_ox}</span></td>
						<td align="left"></td>
					</tr>
					
					<tr>
						<td class="ess">
						<ul>
						<li><span class="tit">수량 <input type="text" name="s_quantity" value="1" size="3" onchange="change();"></span></li>
						<input type="button" value=" + " onclick="add();"><input type="button" value=" - " onclick="del();"><br>
			</td>
						</ul>
				
					</tr>



					<tr>
						<td class="ess"><span class="tit">총가격
						

금액 : <input id="sum" type="text" name="sum" size="11" readonly>원
						
								</span></td>
						<td align="left"></td>
					</tr>

					<tr>
						<td>
						<c:if test="${userGr eq '2' }"> 
							<button type='submit'>
								구매하기
							</button>&nbsp;&nbsp;&nbsp;
								</c:if>		   
			<!-- <button type='submit' class="button">
								<a href="getBasketList.ba">장바구니</a>
							</button>&nbsp;&nbsp;&nbsp; -->

<input type="submit" value="장바구니" formaction="insertBasket.ba">&nbsp;&nbsp;&nbsp;

							
								<input type="submit" value="문의" formaction="insertBAsk2.zo">
							&nbsp;&nbsp;&nbsp;
	
		
				
							<button type='button'>
								<a href="getProductList.do">상품목록</a>
							</button>&nbsp;&nbsp;&nbsp;
							
							
										 <c:if test="${userGr eq '1' }"> 
			
      			<!-- 유저아이디 로그인 -->		
			
							
							<button type='button'>
							<a href="deleteProductService.do?p_pno=${product.p_pno}" >글삭제</a>
							</button>&nbsp;&nbsp;&nbsp;
				
	
     	
	</c:if>			
							
						</td>

					</tr>

				</tbody>
			</table>

		</form>
		<hr>

	</center>
	
	
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
<jsp:include page="../footer.jsp"></jsp:include>
</body>




</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

<!-- <link rel="stylesheet" type="text/css" href="/resources/css/basic.css"> --> 

<%@ include file="/resources/css/basic.css" %>
<style>
 /* 	.productcard{
 	background-color: gray;
 	width: 100px;
    height: 150px;
    display: center;
    border-radius:10px;
     }
  	.productcard_box:hover{
 	transform: translateY(-.5rem);
	}
	.productcard_box:hover ~ .productcard{
  	transform: translateX(1rem);
	}
	
	.productcard_box{
 	background-color: lightgray;
    border-radius: 10px;
    width: 100px;
    height: 200px;
    text-align: left;
    display: inline-block;
    margin: 20px;
    scroll-snap-align: center;
	}
	.addtocart{
	background-color: gray;
	border: solid gray;
	border-radius: 5px;
	height:20px;
	width:75px;
	color:white;
	}
	.buy{
	background-color: #92bd51;
	border: solid #92bd51;
	border-radius: 5px;
	height:20px;
	width:75px;
	color:white;
	}
	.product-newandbest{
	display: flex;
	margin-left:200px;
	}
	.product-all{
	display: flex;
	margin-left:200px;
	}
	h5{
	font-size: 10px;
	}
	.productcard_body_title{
	margin: 5px; 
	}
	.brand-logo{
	margin-top: 30px;
	margin-left:200px;
	border-radius:10px;
	width: 200px;
	height: 100px;
	}
	.brand-history{
	background-color: lightgray;
	margin-left:200px;
	border-radius:10px;
	width: 900px;
	height: 150px;
	}
	ul {
  	float: right;
	}

 */
		.shoppinghead{
	background-color:#92bd51;
	color : white;
	}
	
		.buttonarea{
	text-align: right;
	} 
	</style>
	
	<script>
	function selectAll(selectAll)  {
		  const checkboxes 
		       = document.getElementsByName('product');
		  
		  checkboxes.forEach((checkbox) => {
		    checkbox.checked = selectAll.checked;
		  })
		}
	</script>
</head>
<body>
<header>
<jsp:include page="../header.jsp"></jsp:include>
</header> 
	
	<div class = "outline">
	<br>
	<br>
	<br>
	<br>
	<br>
	

		<div class="getShoppingList_page">
		<div class="title">장바구니</div>
	</div>
	<hr>
	<br>
	<br>
	
		<form action="getBuy.sj" method="post">
		<table>
                
                <tr class="shoppinghead" style="text-align: center;">
                    <td>상품코드번호</td>
                    <td>상품명</td>
                    <td>상품상세정보</td>
                    <td>상품금액</td>
                    <td>주문수량</td>
                     <td>구매금액</td>
                     <td>장바구니삭제</td>
                 
                </tr>
                
                <c:set var= "total" value="0" />
                 
                <c:forEach items="${basketList}" var="basket" >
                
                <tr class="cart__list__detail" style="text-align: center;">
	                <td bgcolor="#92bd51;"><img
							src="./MemberUpload/${basket.p_pimg}" width="100" height="100">${basket.p_pno} </td>
					<td bgcolor="#92bd51;">${basket.p_name}</td>
					<td bgcolor="#92bd51;">${basket.p_detail}</td>
					<td bgcolor="#92bd51;">${basket.p_price}</td>
					<td bgcolor="#92bd51;">${basket.s_quantity}</td>
					
					<c:set var= "sum" value="${basket.p_price*basket.s_quantity} "/>
							
 					<td bgcolor="#92bd51;"><c:out value = "${sum}"/></td>
 					<td bgcolor="#92bd51;"><a href="deleteBasket.ba?s_no=${basket.s_no }&um_no=${basket.um_no}&p_pno=${basket.p_pno}">삭제</a></td>
 			
 		
				</tr>
				
			<c:set var="total" value="${total+(basket.p_price*basket.s_quantity)}"/>
		
		
                </c:forEach>
          
                
        </table>
       <div align="right"><h2>총 결제금액 : <c:out value = "${total}"/> 원</h2></div>
        <input value = "${userNo }" type="hidden" name="um_no">
      <input value = "${total }" type="hidden" name="sum">
     <input value = "${basketList}" type="hidden" name="basketlist">
      
       <br><br><br>
       <div class="buttonarea">
       
		<button type = "submit" class="submitbutton">선택상품 구매</button>
		<button onclick="location.href='entryend.jsp'" class="backbutton">선택상품 삭제</button>	
		</div>
        </form>
		
		<br>
		<br>
		<br>


	
	</div>
	
	
	<footer>
<jsp:include page="../footer.jsp"></jsp:include>
</footer>
</body>
</html>
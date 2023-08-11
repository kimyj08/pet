<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 페이지</title>
<link rel="stylesheet" href="css/basic.css">
<%@ include file="/resources/css/basic.css"%>

<style>
.totalpricebox {
	font-family: 'KoPubWorldDotum';
	border: solid 2px #858C74;
	width: 100%;
	display: flex;
	flex-wrap: wrap;
	justify-content: center;
	padding-top: 20px;
	padding-bottom: 20px;
}

label {
	font-family: 'KoPubWorldDotum';
	font-size: 14px;
}

.ordertable {
	text-align: center;
}

td {
	/* border-top: solid 1px #858C74; */
	
}
</style>

<script type="text/javascript">

function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* 버튼 색상 변경 */
		/* 모든 색상 동일 */
			$(".address_btn").css('backgroundColor', '#555');
		/* 지정 색상 변경 */
			$(".address_btn_"+className).css('backgroundColor', '#3c3838');	
}

</script>



</head>
<body>

	<header>
		<jsp:include page="../header.jsp"></jsp:include>
	</header>
	

<form action="getBuy1.sj" method="post">
	<div class="outline">
		<br> <br>
		<div class="title">주문상품</div>
		<hr>
		<br>
		
		<table class="ordertable table">
			<thead>
				<tr>
					<th>No.</th>
					<th>상품 및 옵션 정보</th>
					<th>상품 금액</th>
					<th>상품 갯수</th>
					<th>총 금액</th>
				</tr>
			</thead>
			<tbody>
				
					<c:if test="${basketList!=null}">
						<c:forEach items="${basketList}" var="basket">

							<tr class="cart__list__detail" style="text-align: center;">
								<td bgcolor="#92bd51;"><img
									src="./MemberUpload/${basket.p_pimg}" width="100" height="100"><input
									name="p_pno" value="${basket.p_pno}" type="hidden"><br>${basket.p_name}
								</td>
								<td bgcolor="#92bd51;">${basket.p_detail}</td>
								<td bgcolor="#92bd51;">${basket.p_price}</td>
								<td bgcolor="#92bd51;">${basket.s_quantity}</td>

								<c:set var="sum" value="${basket.p_price*basket.s_quantity} " />
								<fmt:formatNumber value="${basket.p_price*basket.s_quantity}"
									pattern="#,###" />
								<td bgcolor="#92bd51;"><c:out value="${sum}" /></td>



							</tr>
						</c:forEach>
					</c:if>


					<c:set var="total"
						value="${total+(basket.p_price*basket.s_quantity)}" />



					<c:if test="${basketList==null}">
						<tr class="cart__list__detail" style="text-align: center;">
							<td bgcolor="#92bd51;"><img
								src="./MemberUpload/${product.p_pimg}" width="100" height="100"><input
								name="p_pno" value="${product.p_pno}" type="hidden"><br>${product.p_name}
							</td>
							<td bgcolor="#92bd51;">${product.p_detail}</td>
							<td bgcolor="#92bd51;">${product.p_price}</td>
							<td bgcolor="#92bd51;">${basket.s_quantity}</td>

							<c:set var="sum" value="${product.p_price*basket.s_quantity} " />

							<td bgcolor="#92bd51;"><c:out value="${sum}" /></td>

						</tr>
					</c:if>
			</tbody>



		</table>



		<br>
		<%-- 		<%=request.getParameter("s_quantity")%> --%>
		<%-- ${buyto.sum} --%>
		<div class="container totalpricebox">
			<div class="price">
				총 상품금액&nbsp;&nbsp;&nbsp;<span class="price_num"><strong><fmt:formatNumber
							type="number" value="${product.p_price*basket.s_quantity}"
							pattern="#,###" var="sum2" /> ${sum2 }</strong>원</span>
			</div>
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 배송비 = 3000원
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<div class="price total_num">
				총 주문금액<span class="price_num"><strong class="ID_total_price"><fmt:formatNumber
							type="number" value="${product.p_price*basket.s_quantity+3000}"
							pattern="#,###" var="sum2" /> ${sum2 }</strong>원</span>
			</div>
		</div>

		<br> <br>
		<!-- 주문자 orderer 줄여서 ord로 적음 -->
		<div class="title">주문자 정보</div>
		<hr>
		<br>
		<table>
			<colgroup>
				<col width="150">
				<col width="*">
				<col width="150">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th class="ess"><span class="tit">주문자이름</span></th>
					<td><input type="text" name="o_odno" class="ord_name"
						placeholder="" value="${user.um_ars}">
						<div class="tip_txt "></div>
					<th><span class="tit">전화번호</span></th>
					<td><input type="text" name="po_number" class="ord_tel"
						placeholder="전화번호" style="width: 180px" value="${user.um_tel }">
						<div class="tip_txt "></div></td>
				</tr>
				<tr>
					<th class="ess"><span class="tit">이메일 주소</span></th>
					<td colspan="3">
						<div class="input_box mail">
							<input type="text" name="m_join_email"
								class="input_design js_email_prefix" placeholder="이메일 아이디"
								style="width: 150px" value="${user.um_email} "> <span
								class="mail_icon">＠</span> <select name="m_join_email_select"
								class="js_email_suffix_select">
								<option value="">선택해주세요</option>
								<option value="naver.com">naver.com</option>
								<option value="daum.net">daum.net</option>
								<option value="hanmail.net">hanmail.net</option>
								<option value="daum.net">daum.net</option>
								<option value="gmail.com">gmail.com</option>
								<option value="nate.com">nate.com</option>
								<option value="empal.com">empal.com</option>
								<option value="direct">직접입력</option>
							</select>
						</div>
					</td>
				</tr>
			</tbody>
		</table>

		<br> <br>
		<div class="addressInfo_input_div">
			<!-- 수령인 정보는 recipient의 약자인 reci로 적어뒀습니다 -->
			<div class="title">수령인 정보</div>
			<hr>
			<br>

			<table>
				<colgroup>
					<col width="150">
					<col width="*">
					<col width="150">
					<col width="*">
				</colgroup>

				<tbody>

					<tr>
						<th class="ess"><span class="tit">배송지 선택</span></th>
						<td><label><input type="radio" name="po_addr"
								class="order_adress_select" value="memberadress"
								checked="checked"> 기본 주소</label>
							<button class="address_btn address_btn_1" onclick="showAdress(1)">사용자
								정보 주소록</button>
							<button class="address_btn address_btn_2" onclick="showAdress(2)">직접
								입력</button></td>
					</tr>
					<tr>

						<th class="ess"><span class="tit">수령인 이름</span></th>

						<td style="width: 130px;"><input type="text" name="po_name"
							class="reci_name" placeholder="이름을 입력해주세요."
							value="${user.um_ars}"></td>
						<th style="border-top: solid 1px #858C74;"><span class="tit">수령인
								전화번호</span></th>
						<td style="border-top: solid 1px #858C74;"><input type="text"
							name="po_number" class="reci_tel" placeholder="전화번호"
							style="width: 180px;" value="${user.um_tel}">
							<div class="tip_txt">배송 관련 연락을 받을 수 있는 연락처를 적어주세요.</div></td>
					</tr>
					<tr>
						<th class="ess"><span class="tit">수령인 주소</span></th>
						<td>
							<div class="input_box">
								<input type="text" name="reci_zonecode" id="_zonecode"
									class="input_design" value="" style="width: 100px"
									readonly="readonly"> <a href="#none"
									onclick="new_post_view(); return false;" class="checkbutton">주소검색</a>
							</div>
							<div class="input_full">
								<input type="text" name="reci_address_doro" id="_addr_doro"
									class="input_design" placeholder="도로명 주소" style="width: 400px;"
									readonly="readonly"><br> <input type="text"
									name="reci_address2" id="_addr2" class="input_design"
									placeholder="나머지 주소" style="width: 400px;"
									value="${user.um_addr}">
							</div>
						</td>
					</tr>
					<tr>
						<th class="ess"><span class="tit">배송메세지</span></th>
						<td colspan="3">
							<div class="input_box mess">
								<select name="reci_mess_select" class="reci_mess_select">
								</select><br> <input type="text" name="reci_mess_text"
									class="reci_mess_text" placeholder="40자 이내로 입력해주세요."
									style="width: 300px">
							</div>
						</td>
					</tr>

				</tbody>

			</table>
		</div>

		<br> <br>

		<div class="title">결제 방식</div>
		<hr>
		<br>
		<table>
			<colgroup>
				<col width="150">
				<col width="*">
				<col width="150">
				<col width="*">
			</colgroup>
			<tbody>
				<tr>
					<th class="ess"><span class="tit">결제 수단</span></th>
					<td><label><input type="radio" name="paymentselect"
							class="payment_select" value="depositnobank"> 무통장 입금 </label> <label><input
							type="radio" name="paymentselect" class="payment_select"
							value="paycard">신용 카드</label>
						<div class="tip_txt">카드 결제는 결제하기를 누르면 진행창이 팝업됩니다.</div></td>
				</tr>
				<tr>
					<th class="ess"><span class="tit">무통장 입금</span></th>
					<td colspan="3">
						<div class="input_box mess">
							<select name="reci_mess_select" class="reci_mess_select">
								<option value="">입금 은행 선택</option>
								<option value="1">국민 은행</option>
								<option value="2">기업 은행</option>
								<option value="3">농협</option>
								<option value="4">우리 은행</option>
								<option value="5">신한 은행</option>
								<option value="6">하나 은행</option>
								<option value="7">sc 제일 은행</option>
							</select>
						</div>
					<th class="ess"><span class="tit">입금자 명</span></th>
					<td><input type="text" name="pay_name" class="pay_name"
						placeholder="정확한 입금자 명을 입력해주세요." style="width: 300px;">
			</tbody>

		</table>


		<br> <br> <br>
		<button type="button" class="backbutton"
			onclick="product/getProduct.do">뒤로가기</button>
		<a href="gotomain.do">결제</a>

		<!-- 다음 페이지 넘어가면 주문번호 및 입금할 은행과 계좌번호 출력 -->

		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
	</div>

</form>


	<footer>
		<jsp:include page="../footer.jsp"></jsp:include>
	</footer>

</body>
</html>
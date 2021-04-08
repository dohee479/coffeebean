<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="/WEB-INF/views/layout/header.jsp"%>
<div class="bsk_content">
	<dv class="bsk_containe detail">
		<div class="bsk_title">
			<h4 class="bsk_h_font">장바구니</h4>
			<div class="bsk_side">
				<span class="bsk_text_font2">01 장바구니 ></span><span
					class="bsk_text_font1">02 주문서작성/결제 ></span><span
					class="bsk_text_font1">03 주문완료</span>
			</div>
		</div>
		<hr>
		<div>
			<form method="post" name="basket">
				<input type="hidden" name="${_csrf.parameterName}"
					value="${_csrf.token}" />

				<table class="bsk_table_1">
					<tr style="border-top: solid 1px #343a40;">
						<th></th>
						<th>상품/옵션 정보</th>
						<th>수량</th>
						<th>상품금액</th>
						<th>합계금액</th>
					</tr>
					<c:set var="sum_price" value="0" />
					<c:forEach var="list" items="${list}">

						<tr>
							<td style="width: 2em;"><input type="checkbox"
								name="orderchk" id="orderchk" checked="on"
								onclick="orderChkChange()" value="${list.basket_item_id}"></td>
							<td id="bsk_td_main">
							<img width="100px"src="downloadAttach?basket_item_id=${list.basket_item_id}" 
							style="cursor: pointer" onclick="productClick(${list.product_id})"/>
									<div class="item_info_wrap">
									<span class="item_info">
										<span class="basket_title" style="cursor: pointer"
											onclick="productClick(${list.product_id})">
											${list.product_title} </span> 
											
											<span class="basket_option">선택용량
											: ${list.basket_volume} 선택분쇄타입 :
										<c:if test="${list.basket_grind eq '1'}">
										홀빈(분쇄안함)
									</c:if>
										<c:if test="${list.basket_grind eq '2'}">
										프렌치프레스분쇄
									</c:if>
										<c:if test="${list.basket_grind eq '3'}">
										핸드드립분쇄
									</c:if>
										<c:if test="${list.basket_grind eq '4'}">
										더치용분쇄
									</c:if></span>
									</span>
								</div>
								</td>
							<td><span>${list.basket_product_count}</span>개</td>
							<fmt:parseNumber var="product_price" integerOnly="true"
								value="${list.order_product_price/list.basket_product_count}" />
							<td><span>${product_price}원</span></td>
							<td><span class="order_product_price">
									${list.order_product_price} </span>원</td>
						</tr>
						<c:set var="sum_price"
							value="${sum_price + list.order_product_price }" />
					</c:forEach>
				</table>

				<div class="bsk_sumbox float-center ">
					<div class="d-inline-block align-self-cnter mr-3 text-right">
						<div>총 상품금액</div>
						<div class="text-danger">
							<span class="total_price mt-2"><fmt:formatNumber value="${sum_price}" pattern="#,###"/></span>원
							
						</div>
					</div>
					<img class="mr-3 align-self-center" height="30px"
						src="<%=application.getContextPath()%>/resources/images/order/+.PNG" />
					<div class="d-inline-block align-self-center mr-3">
						<div>배송비</div>
						<div>
							<c:if test="${sum_price eq 0}">
								<c:set var="delevery_price" value="0"/> 
							</c:if>
							<c:if test="${sum_price ne 0}"> 
								<c:set var="delevery_price" value="2500"/> 
							</c:if>
							<span class="delevery_price mt-2">${delevery_price}</span>원
						</div>
					</div>
					<img class="mr-3 align-self-center" height="30px"
						src="<%=application.getContextPath()%>/resources/images/order/=.PNG" />
					<div class="d-inline-block align-self-center mr-3">
						<div>합계</div>
						<div class="text-danger">
							<span class="order_price mt-2"><fmt:formatNumber value="${ sum_price + delevery_price }" pattern="#,###"/></span>원
						</div>
					</div>
				</div>

				<div class="bsk_button_div">
					<div class="bsk_left_button">
						<input class="deleteBasketItem" type="submit"
							onclick="selectBoxCheck()"
							formaction="<%=application.getContextPath()%>/mypage/selectBasketItemDelete"
							value="선택상품삭제">
						<button>선택 상품 찜</button>
					</div>
					<div class="bsk_right_button">
						<button type="submit" onclick="selectBoxCheck()"
							formaction="${pageContext.request.contextPath}/order/basket_order">선택
							상품 주문</button>
						<button type="submit" onclick="orderAll()"
							formaction="${pageContext.request.contextPath}/order/basket_order"
							style="background-color: rgb(219, 120, 103); color: white">전체
							상품 주문</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	const productClick=(product_id)=>{
		location.href="${pageContext.request.contextPath}/product/detail/"+product_id;		
	}
	
	const selectBoxCheck = () => {
		
		if ( $("input[name='orderchk']:checked").length > 0){
			// 체크된 값이 하나라도 있을 경우
		}else{
			alert("상품을 하나이상 선택해주세요.");
			event.preventDefault();
		}
	}
	
	const orderAll = () => {
		
		$("input:checkbox[type=checkbox]").prop("checked", true);
		
		if ( $("input[name='orderchk']:checked").length > 0){
			// 체크된 값이 하나라도 있을 경우
		}else{
			alert("장바구니에 담긴 상품이 없습니다.");
			event.preventDefault();
		}	
	}
	
	const orderChkChange = () => {
		
		if ( $("input[name='orderchk']:checked").length <= 0){
			$(".delevery_price").html(0);
		}
		else{
			$(".delevery_price").html(2500);
		}
		var elements = document.getElementsByClassName('order_product_price');
		
		var i=0;
		var order_price=0;
		$('input:checkbox[name=orderchk]').each(function() {
			
			if(this.checked){
				console.log(elements[i].innerHTML*1);
				order_price = order_price + elements[i].innerHTML*1;
			}	
			i++;
		})
	
		$(".total_price").html(numberWithCommas(order_price));
		$(".order_price").html(numberWithCommas(order_price + $(".delevery_price").text()*1) );
		
	}
	
	 const numberWithCommas = (x) => x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
	
</script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>
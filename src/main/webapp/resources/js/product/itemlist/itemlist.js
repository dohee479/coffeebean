$('.minus').click(function (){
	let cnt = parseInt($('.count_value').val())-1;
	if (cnt<=0){
		cnt=1;
	}
	document.querySelector('.count_value').value = cnt;
})

$('.plus').click(function (){
	let cnt = parseInt($('.count_value').val())+1;
	if (cnt>10){
		cnt=10;
	} 
	document.querySelector('.count_value').value = cnt;
	
})

/*const wish= (product_id)=>{
	
	$.ajax({
		url:"/kong/mypage/zzim_insert?${_csrf.parameterName}=${_csrf.token}",
		data:{product_id},
		method:"post",
	}).then(data=>{
		console.log(data.result);
		if(data.result==="success"){
			alert("찜리스트에 추가하였습니다.")
			location.reload();
			//location.replace("${pageContext.request.contextPath}/product/detail");				
		}else{
			alert("이미 찜한 상품입니다.");
			location.reload();
			//location.replace("${pageContext.request.contextPath}/product/detail");				
		}
		
	})
	
}	*/
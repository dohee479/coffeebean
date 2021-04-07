$(document).ready(function(){
    		
		/*수량옵션시작*/

		$('.minus').click(function (){
			
			let op1 = document.getElementById("volume");
			let op1val = op1.options[op1.selectedIndex].value;
			
			let op2 = document.getElementById("volume");
			let op2val = op2.options[op2.selectedIndex].value;
			
			if(op1val === "0"){
				document.querySelector('.selected_volume .dd').innerHTML="<span style='color:red;'>용량을 먼저 선택해주세요</span>";
			}
			
			let cnt = parseInt($('.count_value').val())-1;
			if (cnt<=0){
				cnt=1;
			} 
			
			else{
					document.querySelector('.count_value').value = parseInt(cnt);
					
					let origin_price=document.querySelector('.item_description dd.price').innerHTML;
					let total_price=parseInt(origin_price);
					
					if(op1val=="200")
						total_price = total_price * parseInt(cnt);
					
					if(op1val=="500")
						total_price = total_price *2*  parseInt(cnt);
					
					if(op1val=="1000")
						total_price = total_price *4* parseInt(cnt);

					total_price = numberWithCommas(total_price); 
	           		document.querySelector('.total_price .dd').innerHTML = total_price;
					}
			
		})
		
		$('.plus').click(function (){
			
			let op1 = document.getElementById("volume");
			let op1val = op1.options[op1.selectedIndex].value;
			
			let op2 = document.getElementById("volume");
			let op2val = op2.options[op2.selectedIndex].value;
			
			if(op1val === "0"){
				document.querySelector('.selected_volume .dd').innerHTML="<span style='color:red;'>용량을 먼저 선택해주세요</span>";
			}
			
			 else {
				let cnt = parseInt($('.count_value').val())+1;
				if (cnt>10){
					cnt=10;
				}
				
				else{
					document.querySelector('.count_value').value = parseInt(cnt);
					
					let origin_price=document.querySelector('.item_description dd.price').innerHTML;
					let total_price=parseInt(origin_price);
					
					if(op1val=="200")
						total_price = total_price * parseInt(cnt);
					
					if(op1val=="500")
						total_price = total_price *2*  parseInt(cnt);
					
					if(op1val=="1000")
						total_price = total_price *4* parseInt(cnt);

					total_price = numberWithCommas(total_price); 
	           		document.querySelector('.total_price .dd').innerHTML = total_price;
					}
				}
			})
		
		/*수량옵션끝*/
		});

            
        const change_mash = () => {
	
			let vol = document.getElementById("volume");
			let val = vol.options[vol.selectedIndex].value;

			let mash_type = document.getElementById("mesh");
	        let mash_val = mash_type.options[mash_type.selectedIndex].innerHTML;
	        document.querySelector('.selected_mashed .dd').innerHTML= mash_val;    
        	
		}

        const change_price = () => {
	
			document.querySelector('.count_value').value = 1;

            let origin_price=document.querySelector('.item_description dd.price').innerHTML;
			let total_price=parseInt(origin_price);
			
			let op1 = document.getElementById("volume");
			let op1val = op1.options[op1.selectedIndex].value;

            document.querySelector('.total_price .dd').innerHTML="";
            let volume = document.getElementById("volume");
            let volume_val = volume.options[volume.selectedIndex].innerHTML;
            document.querySelector('.selected_volume .dd').innerHTML=volume_val;

			if(op1val=="200")
				document.querySelector('.total_price .dd').innerHTML = numberWithCommas(total_price);
				
			if(op1val=="500")
				document.querySelector('.total_price .dd').innerHTML = numberWithCommas(total_price*2);
					
			if(op1val=="1000")
				document.querySelector('.total_price .dd').innerHTML = numberWithCommas(total_price*4);
				
        }

        const numberWithCommas = (x) => x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");


const compareBasket = () => {
	$.ajax({
		url: "/kong/product/basket",
		method: "get"
	})
	.then(data => {
		$("#compare_all").addClass('btn-primary');
		$('#compare_item option').remove();
		$('#compare_item').append('<option selected disabled value="초기값">전체 상품중에서 비교상품을 선택하세요.</option>');
		for (i = 0; i < data.basketList.length; i++) {
			$('#compare_item').append(`<option id="option" value="${data.basketList[i].basket_item_id}">${data.basketList[i].product_title}</option>`); 
		}
	})
	.then(() => {
		$('#compare_item').change(function() {
			let basket_item_id = $(this).val();
			$.ajax({
				url: "/kong/product/basketitem",
				data: {basket_item_id}, 
				method: 'get'
			})
			.then(data => {
				document.querySelector('.compare_attribute_name').innerHTML = data.product_title;
	            document.querySelector('.compare_attribute_price').innerHTML = data.product_price;
	            document.querySelector('.compare_attribute_taste').innerHTML = data.product_taste;
	            document.querySelector('.compare_attribute_origin').innerHTML = data.product_country;
	            document.querySelector('.compare_attribute_rate').innerHTML = data.product_grade;
			})
		})
	})
}


		const checkOption = () => {
			
			let op1 = document.getElementById("volume");
			let op1val = op1.options[op1.selectedIndex].value;
			
			let op2 = document.getElementById("mesh");
			let op2val = op2.options[op2.selectedIndex].value;
			
			if(op1val === "0" || op2val === "0"){
				if(op1val === "0" )
					document.querySelector('.selected_volume .dd').innerHTML="<span style='color:red;'>용량을 선택해주세요.</span>";
			
				if(op2val === "0")
					document.querySelector('.selected_mashed .dd').innerHTML="<span style='color:red;'>분쇄유형을 선택해주세요</span>";
				
				$("input[name=cart]").attr("data-target", "#");
				event.preventDefault();
			}
			else{
				$("input[name=cart]").attr("data-target", "#cart");
			}
	
		}
        
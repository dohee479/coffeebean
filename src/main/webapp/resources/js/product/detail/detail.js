$(document).ready(function(){
    		
		/*수량옵션시작*/

		$('.minus').click(function (){
			let cnt = parseInt($('.count_value').val())-1;
			if (cnt<=0){
				cnt=1;
			} else {
				document.querySelector('.count_value').value = cnt;
			
				let origin_price=document.querySelector('.item_description dd.price').innerHTML;
				let total_price=parseInt(origin_price);
				total_price = total_price * parseInt(cnt);
				total_price = numberWithCommas(total_price); 
	           	document.querySelector('.total_price .dd').innerHTML = total_price;
			}
			
		})
		
		$('.plus').click(function (){
			
			let vol = document.getElementById("volume");
			let val = vol.options[vol.selectedIndex].value;
			
			let op1 = document.getElementById("volume");
			let op1val = op1.options[op1.selectedIndex].value;
			
			let op2 = document.getElementById("volume");
			let op2val = op2.options[op2.selectedIndex].value;
			
			if(op1val === "0" || op2val === "0"){
				document.querySelector('.selected_volume .dd').innerHTML="용량을 먼저 선택해주세요";
			}
			
			 else {
				let cnt = parseInt($('.count_value').val())+1;
				if (cnt>10){
					cnt=10;
				}
				document.querySelector('.count_value').value = parseInt(cnt);
				
				let origin_price=document.querySelector('.item_description dd.price').innerHTML;
				let total_price=parseInt(origin_price);
				total_price = total_price * parseInt(cnt);
				total_price = numberWithCommas(total_price); 
           		document.querySelector('.total_price .dd').innerHTML = total_price;
				
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

            document.querySelector('.total_price .dd').innerHTML="";
            let volume = document.getElementById("volume");
            let volume_val = volume.options[volume.selectedIndex].innerHTML;
            document.querySelector('.selected_volume .dd').innerHTML=volume_val;

			let vol = document.getElementById("volume");
			let val = vol.options[vol.selectedIndex].value;

			if(val === "0"){
				total_price = 0;
			}
			
			if(val === "200"){
				
			}
			if(val === "500"){
				total_price = origin_price * 2;
			}
			if(val === "1000"){
				total_price = origin_price * 4;
			}
			
			let cnt = document.querySelector('.count_value').value;
			total_price = total_price * cnt;
           
            total_price = numberWithCommas(total_price); 
            document.querySelector('.total_price .dd').innerHTML = total_price;
        }

        const numberWithCommas = (x) => x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

const compareBasket = () => {
	$.ajax({
		url: "/kong/product/basket",
		method: "get"
	})
	.then(data => {
		console.log(data);
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




        
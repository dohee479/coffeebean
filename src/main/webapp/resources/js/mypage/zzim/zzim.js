$(document).ready(function(){	
		
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
});
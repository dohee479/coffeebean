$(document).ready(function(){
    
    $("#compare_all").click(function(){
                        
        $("#compare_cart").removeClass('btn-primary');
            $(this).addClass('btn-primary');

            $('#compare_item option').remove();
            $('#compare_item').append('<option selected disabled>전체 상품중에서 비교상품을 선택하세요.</option>');
            $('#compare_item').append(`<option value="${'1'}"> ${'(전체)원두1'} </option>`); 
            $('#compare_item').append(`<option value="${'2'}"> ${'(전체)원두2'} </option>`); 
            $('#compare_item').append(`<option value="${'3'}"> ${'(전체)원두3'} </option>`); 
            $('#compare_item').append(`<option value="${'4'}"> ${'(전체)원두4'} </option>`); 
        });

        $("#compare_cart").click(function(){
            $("#compare_all").removeClass('btn-primary');
            $(this).addClass('btn-primary');

            $('#compare_item option').remove();
            $('#compare_item').append('<option selected disabled>장바구니 상품중에서 비교상품을 선택하세요.</option>');
            $('#compare_item').append(`<option value="${'1'}"> ${'(장바구니)원두1'} </option>`);
            $('#compare_item').append(`<option value="${'2'}"> ${'(장바구니)원두2'} </option>`);
            $('#compare_item').append(`<option value="${'3'}"> ${'(장바구니)원두3'} </option>`);
            $('#compare_item').append(`<option value="${'4'}"> ${'(장바구니)원두4'} </option>`);
        });

        $('#compare_item').change(function(){
            var seletedItem = $("#compare_item option:selected").text();
            document.querySelector('.compare_atribute_name').innerHTML = seletedItem;
            document.querySelector('.compare_atribute_price').innerHTML = seletedItem+ "가격";
            document.querySelector('.compare_atribute_taste').innerHTML = seletedItem+" 맛";
            document.querySelector('.compare_atribute_origin').innerHTML = seletedItem+" 원산지";
            document.querySelector('.compare_atribute_rate').innerHTML = seletedItem+" 평점";
        });
});

            
        const change_mash = () => {
            let mash_type = document.getElementById("mesh");
            let mash_val = mash_type.options[mash_type.selectedIndex].innerHTML;
            document.querySelector('.selected_mashed .dd').innerHTML= mash_val;
        };

        const change_price = () => {

            let origin_price=document.querySelector('.item_description dd.price').innerHTML;

            document.querySelector('.total_price .dd').innerHTML="";
            let volume = document.getElementById("volume");
            let volume_val = volume.options[volume.selectedIndex].innerHTML;
            document.querySelector('.selected_volume .dd').innerHTML=volume_val;


            let strTemp = volume_val.split('+');
            let add_price = strTemp[1].slice(0,-1);
            origin_price = parseInt(origin_price);
            add_price = parseInt(add_price);

            let total_price = origin_price + add_price;
            total_price = numberWithCommas(total_price);
            document.querySelector('.total_price .dd').innerHTML = total_price;
        }

        const numberWithCommas = (x) => x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");

        
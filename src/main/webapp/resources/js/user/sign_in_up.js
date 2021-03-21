        const signUpButton = document.getElementById('signUp_mv');
        const signInButton = document.getElementById('signIn_mv');
        const container = document.getElementById('s_container');
        function id_check() {
            var id=document.getElementById('id');
            var available=document.getElementById('s_available');
            var id_value=id.value;
            if(id_value.length>=4){
                available.style.display="block";
                document.getElementById('s_available').innerHTML="사용가능한 아이디입니다."
            }
            else{
                available.style.display="none";
                available.value="";
            }
            
        }
        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");  //container에 클래스 추가
        });
        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        });
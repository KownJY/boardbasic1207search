var frm = document.querySelector('#frm');
if(frm) {
    frm.addEventListener('submit', function(e) {

        if(frm.uid.length < 5 || frm.uid.length >20 ){

            alert("아이디는 5~20 글자입니다.")
            e.preventDefault();
            return;
        }
        else if(frm.upw.length < 5){
            alert("비밀번호를 확인 해주세요")
            e.preventDefault();
            return;
        }


    });

    var show = document.querySelector('#show');

    if(show){
        show.addEventListener('click',function (){

            if(frm.upw.type == 'password'){
                frm.upw.type='text';
                show.value = '비밀번호 보이기';
            }
            else {
                frm.upw.type='password';
                show.value = '비밀번호 숨이기';
            }

        });

    }

}
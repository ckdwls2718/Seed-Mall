function member_check(){
	var Mpost = $("#Mpost").val();
    var Maddr1 = $("#Maddr1").val();
    var Maddr2 = $("#Maddr2").val();
    
	 if(!isKor(mf.Mname)){
		alert('이름은 한글이름만 가능합니다');
		mf.Mname.select();
		return;
	}
	
	if(!isEmail(mf.Email)){
		alert('이메일 형식에 맞아야 합니다');
		mf.Email.select();
		return;
	}
	
	if(!isPasswd(mf.Pwd)){
		alert('비밀번호는 영문자,숫자,!,. 로 4~8자리까지 가능해요');
		mf.Pwd.select();
		return;
	}
	if(mf.Pwd.value!=mf.Pwd2.value){
		alert('비밀번호와 비밀번호 확인이 달라요');
		mf.Pwd2.select();
		return;
	}
	if(!isMobile(mf.Mhp1, mf.Mhp2, mf.Mhp3)){
		alert('핸드폰 형식에 맞지 않아요. (010|011)-(숫자3~4자리)-(숫자4자리)');
		mf.Mhp1.select();
		return;
	}
	
	if(Mpost.length == 0 || Maddr1.length == 0 || Maddr2.length == 0 ){
        alert("상세주소를 입력해주세요");
        $("#Maddr2").focus();
        return false;
    }
	
	mf.submit();
}//-----------------------

/** 
	asdf-12cd@naver.com
	adff.my@daum.net
	asdf12@google.co.kr
*/
function isEmail(input){
	let val=input.value;
	let pattern=/^[\w-_]+(\.[\w]+)*@([a-zA-Z]+\.)+[a-z]{2,3}$/;
	let b=pattern.test(val);
	//alert('email '+b);
	return b;
}

function isDate(input){
	let val=input.value;
	let pattern=/^\d{4}[-\/](0[1-9]|1[012])[-\/](0[1-9]|[12][0-9]|3[01])$/;
	let b=pattern.test(val);
	//alert(b);
	return b;
}//------------------------

/** 
	\b : 단어의 경계를 나타내며, 해당 패턴이 정확하게 일치해야 함을 의미
	(010|011) : 010 또는 011이 와야 함을 의미
	\d{3,4} : 숫자가 3개이상 4개 이하 나와야 함을 의미
	\d{4}: 숫자가 4자 나와야 함을 의미
*/
function isMobile(input1,input2, input3){
	let val=input1.value+"-"+input2.value+"-"+input3.value;
	//alert(val);
	let pattern=/\b(010|011)[-]\d{3,4}[-]\d{4}\b/;
	let b=pattern.test(val);
	//alert('hp '+b);
	return b;
}

/*
\w : 알파벳대소문자,숫자 
\. : 마침표
! : 느낌표
{4,8}: 4~8자리
*/
function isPasswd(input){
	let val=input.value;
	let pattern=/^[\w!\.]{4,8}$/;
	let b=pattern.test(val);
	//alert('pwd '+b);
	return b;
}

/* 
^ : 시작을 의미
$ : 끝을 의미
a-z: 알파벳 소문자
A-Z: 알파벳 대문자
0-9: 아라비아 숫자
_ : _
! : !
+ : 패턴문자가 1개 이상 올 수 있음을 의미
{4}: 4자리까지만 가능
{4,}: 4자리 이상 가능
{4,8}: 4~8자리까지 가능
*/
function isUserid(input){
	let val=input.value;
	//alert(val);
	//let pattern=/^[abc]+$/; //a or b or c
	let pattern=/^[a-zA-Z]{1}[a-zA-Z0-9_!]{3,7}$/;
	//알파벳으로 시작하고 영문,숫자,_!포함해서 4~7자리
	let b=pattern.test(val);
	//alert(b);
	return b;
}

/**
^ : 시작을 의미
$ : 끝을 의미
가-힣 : 한글을 의미
+ : 패턴이 한 번 이상 반복된다는 의미 
*/
function isKor(input){
	let val=input.value;
	//let pattern=new RegExp(/multi/g);// multi문자열이 있는지 여부를 체크하는 패턴
	//let pattern=/multi/g
	let pattern=/^[가-힣]+$/;
	let b=pattern.test(val); //정규식 패턴에 맞으면 true를 반환하고, 틀리면 false를 반환한다
	//alert(b);
	return b;
}

function execPostCode() {
         new daum.Postcode({
             oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
 
                // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 도로명 조합형 주소 변수
 
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }
                // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
                if(fullRoadAddr !== ''){
                    fullRoadAddr += extraRoadAddr;
                }
 
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                console.log(data.zonecode);
                console.log(fullRoadAddr);
                
                 
                $("[name=Mpost]").val(data.zonecode);
                $("[name=Maddr1]").val(fullRoadAddr);
                
                /* document.getElementById('signUpUserPostNo').value = data.zonecode;*/ //5자리 새우편번호 사용
               document.getElementById('Mpost').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('Maddr1').value = fullRoadAddr;
            }
         }).open();
     }
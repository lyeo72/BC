var codeCheck = false;
var code = randomString();
var randCode = $('#randCode').val();
randCode = code;

function sendEmail() {
	let clientEmail = $('#email_Text').val()
	let emailYN = isEmail(clientEmail);
	if(emailYN == true){
			$.ajax({
				type: "GET",
				url: "SendEmail.me?email="+clientEmail+"&randCode="+randCode,
				data: {
					clientEmail,
					randCode
				},
				dataType: 'text',
				success: function(data){
					alert(clientEmail +'로 인증번호가 발송되었습니다.')
				}
			})
			.fail(function() {
				alert('Ajax오류!');
			})
	
		
	}else{
		alert('이메일 형식에 알맞게 입력해주세요. (xxx@xxx.com)')
	}

	}

	function  isEmail(asValue) {
		var regExp = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		return regExp.test(asValue);
			
	}
	function randomString () {
	    const chars = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXTZabcdefghiklmnopqrstuvwxyz'
	    const stringLength = 6
	    let randomstring = ''
	    for (let i = 0; i < stringLength; i++) {
	      const rnum = Math.floor(Math.random() * chars.length)
	      randomstring += chars.substring(rnum, rnum + 1)
	    }
	    return randomstring
	  }
	
	function checkCode() {
		var clientCode = $('#dtl_addr').val();
		if(clientCode.length == 6){
			if(randCode == clientCode){
				alert('인증이 완료되었습니다.');
				codeCheck = true;
			}else{
				alert('인증번호를 다시 입력해주세요');
				codeCheck = false;
			}
		}
		
	}


function checkSubmit() {
	var cPw = document.fr.member_pass.value;
	var cRpw = document.fr.member_repass.value;
	
	
	if(checkIdResult == false) { 
			alert('아이디를 입력해주세요');
			document.fr.member_id.focus();
			return false;
	} else if(checkPasswdResult == false) { 
			alert('비밀번호는 영문자,숫자,특수문자를 3종류 이상을 조합하여 만들어주세요');
			document.fr.member_pass.focus();
			return false;
	} else if(cPw != cRpw){
			alert('비밀번호가 일치하지 않습니다');
			document.fr.member_repass.focus();
			return false;
	
	}else if(codeCheck == false){
		alert('인증번호가 올바르지 않습니다.')
		document.fr.email.focus();
		return false;
	}
	
	if(!document.fr.add_info[0].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	}
	else if(!document.fr.add_info[1].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	}
	else if(!document.fr.add_info[2].checked){
	alert('필수항목에 체크해주세요!')
	return false;
	
	}
	
	return true;
}



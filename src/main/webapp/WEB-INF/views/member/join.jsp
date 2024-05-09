<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>드라이브 어디갈Car!</title>
  <link rel="icon" href="/resources/img/icons8-car-roof-box-48.png">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
    integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">

  <style>
    body {
      min-height: 100vh;

      background: -webkit-gradient(linear, left bottom, right top, from(#92b5db), to(#1d466c));
      background: -webkit-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -moz-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: -o-linear-gradient(bottom left, #92b5db 0%, #1d466c 100%);
      background: linear-gradient(to top right, #92b5db 0%, #1d466c 100%);
    }

    .input-form {
      max-width: 680px;

      margin-top: 80px;
      padding: 32px;

      background: #fff;
      -webkit-border-radius: 10px;
      -moz-border-radius: 10px;
      border-radius: 10px;
      -webkit-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      -moz-box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15);
      box-shadow: 0 8px 20px 0 rgba(0, 0, 0, 0.15)
    }
  </style>
</head>

<body>
  <div class="container">
    <div class="input-form-backgroud row">
      <div class="input-form col-md-12 mx-auto">
        <h4 class="mb-3">회원가입</h4>
        <form class="validation-form" action="/member/join" method="post" accept-charset="utf-8" >
            <div class="mb-3">
              <label for="memberName">이름</label>
              <input type="text" class="form-control" id="memberName" name="memberName" placeholder="" value="" required>
              <div class="invalid-feedback">
                이름을 입력해주세요.
              </div>
            </div>   
            
            <div class="mb-3">
              <label for="memberId">아이디</label>
              <input type="text" class="form-control" id="memberId" name="memberId" placeholder="" value="" required>
              <button class="idChk" type="button" style="margin-top:3px;"id="idChk" onclick="fn_idChk();" value="N">중복확인</button>
              <div class="invalid-feedback">
                아이디를 입력해주세요.
              </div>
            </div> 
            
            <div class="mb-3">
              <label for="memberPw">비밀번호</label>
              <input type="password" class="form-control mb_check" id="memberPw" name="memberPw" placeholder="" value="" required>
              <div class="invalid-feedback">
                비밀번호를 입력해주세요.
              </div>
            </div> 
            
            <div class="mb-3">
              <label for="check">비밀번호 확인</label>
              <input type="password" class="form-control mb_check" id="check" placeholder="" value="" required>
             <font id = "checkPw" size = "2"></font>
            </div> 

          <div class="mb-3">
            <label for="memberMail">이메일</label>
            <input type="email" class="form-control" id="memberMail" name="memberMail" placeholder="you@example.com" required>
            <div class="invalid-feedback">
              이메일을 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="memberAddr1">주소</label>
            <input type="text" class="form-control" id="memberAddr1" name="memberAddr1" placeholder="서울특별시 강남구" required>
            <div class="invalid-feedback">
              주소를 입력해주세요.
            </div>
          </div>

          <div class="mb-3">
            <label for="memberAddr2">상세주소<span class="text-muted">&nbsp;(필수 아님)</span></label>
            <input type="text" class="form-control" id="memberAddr2" name="memberAddr2" placeholder="상세주소를 입력해주세요.">
          </div>

          <hr class="mb-4">
          <div class="custom-control custom-checkbox">
            <input type="checkbox" class="custom-control-input" id="aggrement" required>
            <label class="custom-control-label" for="aggrement">개인정보 수집 및 이용에 동의합니다.</label>
          </div>
          <div class="mb-4"></div>
          <button class="btn btn-primary btn-lg btn-block" type="submit" onclick="registerCheck()">가입 완료</button>
        </form>
      </div>
    </div>
    <footer class="my-3 text-center text-small">
      <p class="mb-1">&copy; 2022 GB</p>
    </footer>
  </div>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script type="text/javascript">
    
/*     window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false); */
//유효성검사    
    function registerCheck(){
    	console.log("들어왔다");
    	if($("#memberName").val() == ""){
    	    alert("이름 필수입니다.");
    	    $("#memberName").focus();
    	    return false;
    	}
    	
    	if($("#memberId").val() == ""){
    	    alert("아이디는 필수입니다.");
    	    $("#memberId").focus();
    	    return false;
    	}
    	
        $.ajax({
    		url : "/member/idChk",
    		type : "post",
    		dataType : "json",
    		data : {"memberId" : $("#memberId").val()},
    		success : function(data){
    			console.log('data : ', data);
    			if(data == 1){
    				alert("중복된 아이디입니다.");
    				$("#memberId").focus();
    				return false;
    			}
    		}
    	})
    	
    	var pwd1 = $("#memberPw").val();
        var pwd2 = $("#check").val();
        
        if (pwd1 != pwd2) {
        	 alert("비밀번호가 불일치 합니다.");
     	    $("#memberPw").focus();
     	   return false;
        } 
        
        if($("#memberMail").val() == ""){
    	    alert("이메일은 필수입니다.");
    	    $("#memberMail").focus();
    	    return false;
    	}
        
        if($("#memberAddr1").val() == ""){
    	    alert("이메일은 필수입니다.");
    	    $("#memberAddr1").focus();
    	    return false;
    	}
        
        if(!$("#aggrement").prop("checked")){
        	alert("동의체크는 필수입니다.");
    	    $("#aggrement").focus();
    	    return false;
    	}
    }
    
    

//아이디 중복체크    
    function fn_idChk(){
    	$.ajax({
    		url : "/member/idChk",
    		type : "post",
    		dataType : "json",
    		data : {"memberId" : $("#memberId").val()},
    		success : function(data){
    			console.log('data : ', data);
    			if(data == 1){
    				alert("중복된 아이디입니다.");
    			}else if(data == 0){
    				$("#idChk").attr("value", "Y");
    				alert("사용가능한 아이디입니다.");
    			}
    		}
    	})
    }
    
//비밀번호 확인
    $('.mb_check').focusout(function () {
    	console.log("들어옴");
        var pwd1 = $("#memberPw").val();
        var pwd2 = $("#check").val();
  
        if ( pwd1 != '' && pwd2 == '' ) {
            null;
        } else if (pwd1 != "" || pwd2 != "") {
            if (pwd1 == pwd2) {
            	$("#checkPw").html('일치');
            	$("#checkPw").attr('color','green');
                
            } else {
            	$("#checkPw").html('불일치');
                $("#checkPw").attr('color','red');
            	
            }
        } 
    });
    
    
  
    
    
</script>

</body>
</html>
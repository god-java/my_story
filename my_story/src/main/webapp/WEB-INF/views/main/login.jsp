<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#login{width:1260px; margin:0 auto;}
#login_body{width:400px; margin:100px auto; border:1px solid #D8D8D8;}
#login_body div{width:100%; height:60px; position:relative;}
#login_body div:nth-child(4){height:50px;}
#login_body div:nth-child(5){height:50px;}
.st_button{width:60%; height:40px;}
#join_btn{border:1px solid #FF9595; background:#FF9595;}
#login label{position:absolute; top:5px; left:90px; font-size:20px; font-weight:boler; color:silver; -webkit-transition-duration:0.5s;}
</style>
</head>
<body>
	<div id="login">
		<div id="login_body">
			<div>
				<h1>로그인</h1>
			</div>
			<div>
				<label for="id" id="id_lb">ID</label>
				<input type="text" id="id" class="st_text">
			</div>
			<div>
				<label for="password" id="password_lb">PASSWORD</label>
				<input type="password" id="password" class="st_text">
			</div>
			<div>
				<input type="button" id="login_btn" class="st_button" value="로그인"> 
			</div>
			<div>
				<input type="button" id="join_btn" onclick="location.href='join'" class="st_button" value="회원가입">
			</div>
			<div>
				<input type="button" id="join_btn" class="st_button" value="정보찾기">
			</div>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('focus','#id',function(){
		$("#id_lb").css({'top':'-25px','left':'80px','font-size':'15px','color':'black'})
	})
	$(document).on('focus','#password',function(){
		$("#password_lb").css({'top':'-25px','left':'80px','font-size':'15px','color':'black'})
	})
	
	$(document).on('blur','#id',function(){
		if(!$("#id").val()){
			$("#id_lb").css({'top':'5px','left':'90px','font-size':'20px','color':'silver'})
		}
	})
	$(document).on('blur','#password',function(){
		if(!$("#password").val()){
			$("#password_lb").css({'top':'5px','left':'90px','font-size':'20px','color':'silver'})
		}
	})
	
	$(document).on('click','#login_btn',function(){
		$.ajax({
			url : 'login_ok',
			type : 'post',
			data : {
				'id' : $("#id").val(),
				'password' : $("#password").val()
			},
			success : function(data){
				var res = data
				if(res>0){
					location.href="main"
				}else{
					alert("아이디 또는 비밀번호가 틀렸습니다.")
				}
			}
		})
	})
})
</script>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="resources/js/empty.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#join{width:1260px; margin:0 auto;}
#join_body{width:500px; height:500px; border:1px solid #D8D8D8; margin:100px auto;}
#join_body div{width:100%; height:60px; position:relative;}
#join label{position:absolute; top:5px; left:110px; font-size:20px; font-weight:boler; color:silver; -webkit-transition-duration:0.5s;}
</style>
</head>
<body>
	<div id="join">
		<form action="join_ok" method="post">
			<div id="join_body">
				<div>
					<h1>회원가입</h1>
				</div>
				<div>
					<span id="overlap_id" class="warn" style="right:110px; top:8px;">
						!
					</span>
					<label for="id" id="id_lb">ID</label>
					<input type="text" id="id" name="id" class="st_text">
				</div>
				<div>
					<label for="password" id="password_lb">PASSWORD</label>
					<input type="password" id="password" name="password" class="st_password">
				</div>
				<div>
					<span id="password_warn" class="warn" style="right:110px; top:8px;">
						!
					</span>
					<label for="password2" id="password_lb2">PASSWORD_IDENTIFY</label>
					<input type="password" id="password2" class="st_password">
				</div>
				<div>
					<label for="name" id="name_lb">NAME</label>
					<input type="text" id="name" name="name" class="st_text">
				</div>
				<div>
					<label for="email" id="email_lb">EMAIL</label>
					<input type="email" id="email" name="email" class="st_email">
				</div>
				<div>
					<input type="submit" id="join_ok" class="st_button" value="가입하기">
					<input type="button" id="join_cancel" class="st_button" value="취소">
				</div>
			</div>
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('focus','#id',function(){
		$("#id_lb").css({'top':'-25px','left':'100px','font-size':'15px','color':'black'})
	})
	$(document).on('focus','#password',function(){
		$("#password_lb").css({'top':'-25px','left':'100px','font-size':'15px','color':'black'})
	})
	$(document).on('focus','#password2',function(){
		$("#password_lb2").css({'top':'-25px','left':'100px','font-size':'15px','color':'black'})
	})
	$(document).on('focus','#name',function(){
		$("#name_lb").css({'top':'-25px','left':'100px','font-size':'15px','color':'black'})
	})
	$(document).on('focus','#email',function(){
		$("#email_lb").css({'top':'-25px','left':'100px','font-size':'15px','color':'black'})
	})
	
	
	$(document).on('blur','#id',function(){
		if(!$("#id").val()){
			$("#id_lb").css({'top':'5px','left':'110px','font-size':'20px','color':'silver'})
		}
	})
	$(document).on('blur','#password',function(){
		if(!$("#password").val()){
			$("#password_lb").css({'top':'5px','left':'110px','font-size':'20px','color':'silver'})
		}
	})
	$(document).on('blur','#password2',function(){
		if(!$("#password2").val()){
			$("#password_lb2").css({'top':'5px','left':'110px','font-size':'20px','color':'silver'})
		}
	})
	$(document).on('blur','#name',function(){
		if(!$("#name").val()){
			$("#name_lb").css({'top':'5px','left':'110px','font-size':'20px','color':'silver'})
		}
	})
	$(document).on('blur','#email',function(){
		if(!$("#email").val()){
			$("#email_lb").css({'top':'5px','left':'110px','font-size':'20px','color':'silver'})
		}
	})
	
	$(document).on('click','#join_ok',function(){
		var jsonData = {
				id : [$("#id"),'아이디를','text'],
				password : [$("#password"),'비밀번호를','text'],
				name : [$("#name"),'이름을','text'],
				email : [$("#email"),'이메일을','text'],
		}
		if(isEmpty(jsonData)){
			return false
		}
		if($("#password").val() != $("#password2").val()){
			alert("패스워드가 일치하지 않습니다.")
			return false
		}
		var submit = true
		$.ajax({
			url : 'overlap_id',
			type : 'post',
			data : {'id':$("#id").val()},
			async : false,
			success : function(data){
				var res = data
				if(res>0){
					alert("중복된 아이디입니다.")
					submit = false
				}else{
				}
			}
		})
		if(!submit){
			return false
		}
	})
	$(document).on('keyup','#id',function(){
		$.ajax({
			url : 'overlap_id',
			type : 'post',
			data : {'id' : $("#id").val()},
			success : function(data){
				var res = data
				console.log(res)
				if(res>0){
					$("#overlap_id").css({'display':'block'})
				}else{
					$("#overlap_id").css({'display':'none'})
				}
			}
		})
	})
	$(document).on('keyup','#password2',function(){
		if($("#password").val() != $("#password2").val()){
			$("#password_warn").css({'display':'block'})
		}else{
			$("#password_warn").css({'display':'none'})
		}
	})
})
</script>
</html>
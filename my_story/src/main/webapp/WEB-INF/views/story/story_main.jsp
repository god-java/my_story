<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="resources/css/style.css"></link>
<script type="text/javascript" src="resources/js/jquery-3.3.1.min..js"></script>
<script type="text/javascript" src="resources/js/empty.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#header{width:100%; height:50px; border-bottom:1px solid #D8D8D8;}
#header ul{width:100%; height:50px; line-height:50px;}
#header li{width:10%; height:30px; text-align:center;}
#top{width:100%; height:200px; line-height:200px; border-bottom:1px solid #D8D8D8;}
#top a{font-size:50px; font-weight:bolder;}
#left_menu{width:250px; height:100%; border-right:1px solid black; position:fixed; left:0; top:0; background:rgba(0,0,0,0.5)}
#menu_body{width:80%; height:80%; position:relative; top:10%; left:10%;}
#profile_image_body{width:100%; height:200px; border:1px solid black;}
#cate_ul{width:100%; height:70%; margin-top:20px; overflow-y:scroll;}
#cate_ul li{width:100%; height:30px; color:white; text-align:left; line-height:30px;}
#add_cate_mask{width:0; height:0; position:absolute; left:0; top:0; background:black; display:none;}
</style>
</head>
<script type="text/javascript">
function board_list(cate_cd,member_cd){
	location.href="board_list?cate_cd="+cate_cd+"&member_cd="+member_cd
}
</script>
<body>
	<div id="add_cate_mask">
	</div>
	<div id="add_cate_body" style="width:350px; height:250px; position:fixed; top:30%; left:40%; border:1px solid black; background:white; display:none;">
		<div style="width:80%; height:80%; position:relative; top:10%; left:10%;">
			<h2>카테고리 등록</h2>
			<div style="width:100%; height:50px; line-height:50px;">
				<select id="up_cate_cd" class="st_select">
					<option value="">--상위 카테고리를 선택--</option>
					<c:forEach var="ctlist" items="${ctlist }">
						<option value="${ctlist.cate_cd }" level="${ctlist.cate_lv }">${ctlist.cate_nm }</option>
					</c:forEach>
						<option value="x" level="-1">선택 안함</option>
				</select>
			</div>
			<div style="width:100%; height:50px; line-height:50px;">
				<input type="text" id="cate_nm" class="st_text" placeholder="카테고리 이름">
			</div>
			<div style="width:100%; height:50px; line-height:50px;">
				<input type="button" id="add_cate_btn" class="st_button" value="등록"> 
				<input type="button" id="add_cate_cancel" class="st_button" value="취소">
			</div>
		</div>
	</div>
	<div id="left_menu">
		<div id="menu_body">
			<div style="width:100%; height:30px;">
				<a href="#none" id="add_cate_body_view">카테고리 등록</a>
			</div>
			<div id="profile_image_body">
				<img src="resources/profile_image/${mdto.profile_image}" style="width:100%; height:100%;">
			</div>
			<ul id="cate_ul">
				<c:forEach var="ctlist" items="${ctlist }">
					<li>
						&nbsp;&nbsp;&nbsp;
						<c:forEach begin="1" end="${ctlist.cate_lv }">
							━
						</c:forEach>
						<a href="board_list?member_cd=${mdto.member_cd}&cate_cd=${ctlist.cate_cd}">${ctlist.cate_nm }</a>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<div id="header">
		<ul>
			<li>
				<c:choose>
					<c:when test="${member_cd == null }">
						<a href="join">회원가입</a>
						<a href="login">로그인</a>
					</c:when>
					<c:otherwise>
						<a href="logout">로그아웃</a>
					</c:otherwise>
				</c:choose>
			</li>
		</ul>
	</div>
	<div id="top">
		<a href="main">${sdto.story_nm }</a>
	</div>
	<div id="center">
		<jsp:include page="${center }"/>
	</div>
	<div id="footer">
	
	</div>
</body>
<script type="text/javascript">

$(document).ready(function(){
	$(document).on('click','#add_cate_body_view',function(){
		var width = $(window).width()
		var height = $(window).height()
		console.log(width) 
		$("#add_cate_mask").css({'width':width,'height':height})
		$("#add_cate_mask").fadeTo('slow',0.5)
		$("#add_cate_body").show()
	})
	$(document).on('click','#add_cate_cancel',function(){
		$("#add_cate_body").hide()
		$("#add_cate_mask").hide()
	})
	$(document).on('click','#add_cate_btn',function(){
		var cate_lv = $("#up_cate_cd option:selected").attr("level")	// 카테고리 레벨찾기
		var jsonData = {												// 유효성 검사 준비
				'up_cate_cd' : [$("#up_cate_cd"),'상위 카테고리를','select'],
				'cate_nm' : [$("#cate_nm"),'카테고리 이름을','text'],
		}
		if(isEmpty(jsonData)){											// 유효성 검사
			return false
		}
		if($("#up_cate_cd").val() == 'x'){
			$("#up_cate_cd").val(null)
		}
		console.log($("#up_cate_cd").val())
		console.log($("#cate_nm").val())
		console.log(cate_lv)
		$.ajax({
			url : 'add_cate_ok',
			type : 'post',
			data : {
				'up_cate_cd' : $("#up_cate_cd").val(),
				'cate_nm' : $("#cate_nm").val(),
				'cate_lv' : cate_lv
			},
			success : function(data){
				var res = data
				if(res>0){
					window.location.reload()
				}
			}
		})
	})
})
</script>
</html>
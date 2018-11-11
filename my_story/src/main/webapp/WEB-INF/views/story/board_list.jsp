<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#board_list{width:1260px; margin:0 auto;}
#board_list_div{width:100%;}
.board_list_body{width:21%; height:350px; border:1px solid black; margin:1.2%; display:inline-block; position:relative; overflow:hidden; cursor:pointer;}
</style>
</head>
<body>
	<div id="board_list">
		<h1>${cate_nm }</h1>
		<input type="button" class="st_button" value="게시물 등록" onclick="location.href='write_board?member_cd=${mdto.member_cd}'">
			<div id="board_list_div">
				<c:forEach var="blist" items="${blist }">
					<div id="board_list_body${blist.board_cd }"  class="board_list_body" param="${blist.board_cd }">
						<img id="list_image${blist.board_cd }" src="resources/upload_image/${blist.board_image }" style="width:100%; height:100%; -webkit-transition-duration:1s;">
						<div id="list_top${blist.board_cd }" style="width:100%; height:50px; background:rgba(0,0,0,0.5); text-align:center; position:absolute; top:-50px; line-height:50px; -webkit-transition-duration:0.5s;">
							<span style="font-size:30px; font-weight:bolder; color:white;">
								${blist.board_title }
							</span>
						</div>
						<div id="list_center${blist.board_cd }" style="width:100%; height:250px; position:absolute; top:50px; background:rgba(0,0,0,0.5); -webkit-transition-duration:0.5s;  -webkit-transform:scale(0);">
							<div style="width:90%; height:90%; position:absolute; top:5%; left:5%; color:white; font-size:15px;">
								${blist.board_sub_content }
							</div>
						</div>
						<div id="list_bottom${blist.board_cd }" style="width:100%; height:50px; background:rgba(0,0,0,0.5); text-align:left; position:absolute; bottom:-50px; -webkit-transition-duration:0.5s;">
							<div style="width:80px; height:50px; line-height:50px; color:white; display:inline-block; position:relative; top:0;">
								좋아요 : ${blist.like_count }
							</div>
							<div style="width:80px; height:50px; line-height:50px; color:white; display:inline-block; position:relative; top:0;">
								댓글 : ${blist.comment_count }
							</div>
							<div style="width:80px; height:50px; line-height:50px; color:white; display:inline-block; position:relative; top:0;">
								조회수 : ${blist.read_count }
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('mouseover','.board_list_body',function(){
		var param = $(this).attr("param");
		$("#list_image"+param).css({'opacity':'0.5'})
		$("#list_top"+param).css({'top':'0px'})
		$("#list_center"+param).css({'-webkit-transform':'scale(1)'})
		$("#list_bottom"+param).css({'bottom':'0px'})
	})
	$(document).on('mouseout','.board_list_body',function(){
		var param = $(this).attr("param");
		$("#list_image"+param).css({'opacity':'1'})
		$("#list_top"+param).css({'top':'-50px'})
		$("#list_center"+param).css({'-webkit-transform':'scale(0)'})
		$("#list_bottom"+param).css({'bottom':'-50px'})
	})
	$(document).on('click','.board_list_body',function(){
		var param = $(this).attr("param")
		location.href = "view_board?member_cd=${mdto.member_cd}&board_cd="+param
	})
})
</script>
</html>
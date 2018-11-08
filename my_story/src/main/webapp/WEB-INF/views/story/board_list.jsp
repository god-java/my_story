<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#board_list{width:1260px; margin:0 auto;}
#board_list_div{width:100%;}
#board_list_body{width:22%; height:400px; border:1px solid black; margin:1.5%; display:inline-block;}
</style>
</head>
<body>
	<div id="board_list">
		<h1>${cate_nm }</h1>
		<input type="button" class="st_button" value="게시물 등록" onclick="location.href='write_board?member_cd=${mdto.member_cd}'">
		<div id="board_list_div">
			<div id="board_list_body">
			
			</div>
			<div id="board_list_body">
			
			</div>
			<div id="board_list_body">
			
			</div>
			<div id="board_list_body">
			
			</div>
		</div>
	</div>
</body>
</html>
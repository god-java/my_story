<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#write_board{width:1260px; height:300px; margin:0 auto;}
#writd_board_table{width:800px; margin:0 auto;}
input,textarea,select{margin-left:10px;}
#board_content div{text-ailgin:left; width:100%; position:relative; left:0;}
</style>
</head>
<body>
	<div id="write_board">
		<h1>게시물 작성</h1>
		<table id="writd_board_table">
			<tr>
				<td class="left">카테고리</td>
				<td class="right">
					<select id="cate_cd" name="cate_cd" class="st_select">
						<c:forEach var="ctlist" items="${ctlist }">
							<option value="${ctlist.cate_cd }">${ctlist.cate_nm }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="left">글제목</td>
				<td class="right">
					<input type="text" id="board_title" class="st_text">
				</td>
			</tr>
			<tr>
				<td class="left">이미지 첨부</td>
				<td class="right" style="position:relative;">
					<label for="image" style=""></label>
					<input type="file" id="image" class="image">
				</td>
			</tr>
			<tr>
				<td class="left">글내용</td>
				<td class="right">
					<div style="width:90%; height:50px; border:1px solid black;">
						<input type="button" id="float_left">
						<input type="button" id="float_center">
					</div>
					<div id="board_content" name="board_content" contentEditable="true" class="st_textarea" style="width:600px; height:500px; border:1px solid black; overflow-y:scroll; text-align:left;">
					
					</div>
				</td>
			</tr>
			<tr>
				<td class="left">파일첨부</td>
				<td class="right">
					<input type="file" id="file" class="file">
				</td>
			</tr>
			<tr>
				<td class="" colspan="2">
					<input type="button" id="write_board_ok" value="작성완료" class="st_button">
				</td>

			</tr>
		</table>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('keyup','#board_content',function(){
 		$(this).children("div").css({'text-align':'center'})
		console.log($(this).html())
	})
	$(document).on('click','#float_center',function(){
 		$("#board_content").children("div").css({'text-align':'center'})
		console.log($(this).html())
	})
	$(document).on('click','#float_left',function(){
 		$("#board_content").children("div").css({'text-align':'left'})
		console.log($(this).html())
	})
	$(document).on('change','#image',function(){
		var url = URL.createObjectURL(event.target.files[0])
		console.log(url)
		var html = "<img class='img' src='"+url+"' param='aa' style='width:500px; height:500px;'>"
		$("#board_content").append(html)
	})
	$(document).on('click','#write_board_ok',function(){
		var date = new Date()
		
		var image = document.getElementsByClassName("img")
		var image_arr = new Array();
		for(var i=0; i<image.length; i++){
			var year = date.getYear()
			var month = date.getMonth()+1
			var day = date.getDay()
			var sss = date.getTime()
			var sum = year+month+day+sss+i
			image_arr.push(sum)
			image[i].setAttribute("src","resources/image_upload/"+sum)
			console.log(image[i].getAttribute("src"))
		}
		console.log(image_arr)
		console.log($("#board_content").html())
	})
})
</script>
</html>
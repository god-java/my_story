<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#write_board{width:1260px; margin:0 auto;}
#writd_board_table{width:800px; margin:0 auto;}
input,texcontent_targetea,select{margin-left:10px;}
#board_content div{text-ailgin:left; width:100%; position:relative; left:0;}
</style>
</head>
<body>
	<div id="write_board">
		<h1>게시물 작성</h1>
		<form action="write_board_ok" method="post" enctype="multipart/form-data">
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
						<input type="text" name="board_title" id="board_title" class="st_text">
					</td>
				</tr>
				<tr>
					<td class="left">이미지 첨부</td>
					<td id="file_td" class="right" style="position:relative;">
						<label for="image1" id="image_label1" class="image_label" param="1" style="width:50px; height:50px; border:1px solid black; display:inline-block; line-height:50px; text-align:center; position:relative;"></label>
						<input type="file" id="image1" class="image" name="image" param="1" style="display:none;">
					</td>
				</tr>
				<tr>
					<td class="left">글내용</td>
					<td class="right">
						
						<div  name="board_content" class="jun_editor" style="width:600px; height:600px;">
							<div style="width:100%; height:50px; border:1px solid black;">
								<input type="button" id="line_up_left" value="왼쪽">
								<input type="button" id="line_up_center" value="중앙">
							</div>
							<div id="board_content" contentEditable="true" class="jun_editor" style="width:100%; height:500px; border:1px solid black; overflow-y:scroll; text-align:left;">
							
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td class="left">서브내용</td>
					<td class="right">
						<textarea name="board_sub_content" style="width:500px; height:200px;"></textarea>
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
		</form>
	</div>
</body>

<script type="text/javascript">
$(document).ready(function(){
	
	var image_index = 1;
	var content_target;
	var line_up = "left";
	var fake_arr = new Array();
	$(document).on('keyup','#board_content',function(e){
		$(this).children("div").css({'text-align':line_up})
		$(this).children("img").css({'text-align':line_up})
		if(e.keyCode=='8'){
			console.log("!!")
			for(var i=0; i<image_index; i++){
				var k = $("#img"+i).attr("param")
				console.log(k)
				if(isNull(k)){
					console.log("rerere")
					$("#image"+i).remove()
					$("#image_label"+i).remove()
				}
				
			}
		}
	})
	$(document).on('click','#line_up_center',function(){
		line_up = "center"
		$("#board_content").css({'text-align':line_up})
 		$("#board_content").children("div").css({'text-align':line_up})
		console.log($(this).html())
	})
	$(document).on('click','#line_up_left',function(){
		line_up = "left"
 		$("#board_content").css({'text-align':line_up})
 		$("#board_content").children("div").css({'text-align':line_up})
		console.log($(this).html())
	})
	$(document).on('click','.image',function(){
		var param = $(this).attr("param")
		if(!isNull($("#image"+param).val())){
			$("#image"+param).remove();
			$("#image_label"+param).remove();
			$("#img"+param).remove()
			$("#img_label"+param).remove()
			return false;
		}
	})
	$(document).on('change','.image',function(){
		var url = URL.createObjectURL(event.target.files[0])
		fake_arr.push(url)
		console.log(url)
		var html = "<img id='img"+image_index+"' class='img' src='"+url+"' param='aa' style='width:500px; height:500px;'>"
		var label_html = "";
		label_html += "<img id='img_label"+image_index+"' class='img' src='"+url+"' param='aa' style='width:100%; height:100%;'>";
		label_html += "<div id='delete_image"+image_index+"' class='delete_image' param='"+image_index+"' style='position:absolute; top:0; left:0; width:100%; height:100%; color:white; font-size:30px; background:rgba(0,0,0,0.5); cursor:pointer; display:none;'>";
		label_html += 	"X";
		label_html += "</div>";
		$("#image_label"+image_index).html(label_html)
		if(isNull(content_target)){
			$("#board_content").append(html)			
		}else{
			var img_element = document.createElement("img")
			img_element.setAttribute("src",url);
			img_element.style = "width:500px; height:500px;";
			img_element.id = "img"+image_index;
			img_element.className = "img";
			content_target.appendChild(img_element)
		}
		image_index++;
		var file_html ="";
		file_html += "<input type='file' id='image"+image_index+"' class='image' name='image' param='"+image_index+"' style='display:none;'>";
		file_html += "<label for='image"+image_index+"' id='image_label"+image_index+"' param='"+image_index+"' class='image_label' style='width:50px; height:50px; border:1px solid black; display:inline-block; position:relative; margin:5px; 5px; line-height:50px; text-align:center;'>";
		file_html += 	"a";
		file_html += "</label>";
		$("#file_td").append(file_html)	
	})
	
	$(document).on('mouseover','.image_label', function(){
		var param = $(this).attr("param")
		console.log(param)
		$("#delete_image"+param).fadeIn()
	})
	$(document).on('mouseout','.image_label', function(){
		var param = $(this).attr("param")
		console.log(";;;")
		$("#delete_image"+param).fadeOut()
	})
	$(document).on('click','#write_board_ok',function(){
		var date = new Date()
		var image = document.getElementsByClassName("img")
		var image_arr = new Array();
		var image_file = document.getElementsByClassName("image")


		alert(image_file.length+"AAA")
		for(var i=0; i<image_file.length-1; i++){
			var file_name = image_file[i].value
			var extension = file_name.split(".")
			if(i==image.length){			// 마지막 비어있는 파일... 파일이 없어서 에러남...
				break;
			}
			var fake_path = document.createElement("input");
			fake_path.setAttribute("type","hidden");
			fake_path.name = "fake_path";
			fake_path.value = image[i].getAttribute("src")
			$("form")[0].appendChild(fake_path)
			
			var extension_send = document.createElement("input")
			extension_send.setAttribute("type","hidden");
			extension_send.name = "extension";
			extension_send.value = extension[1]
			$("form")[0].appendChild(extension_send)
			
		}
		var board_content = document.createElement("input")
		board_content.setAttribute("type","hidden")
		board_content.name = "board_content"
		board_content.value = $("#board_content").html()
		$("form")[0].appendChild(board_content)
		$("form")[0].submit()
	})
	$(document).on('click','#board_content',function(e){
		content_target=e.target
		console.log(content_target)
	})
})
</script>
</html>
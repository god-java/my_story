<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#make_story{width:1260px; margin:0 auto;}
#make_story_body{width:800px; margin:100px auto;}
#ms_table{width:100%;}
.st_text, .st_select{margin-left:10px;}
</style> 
</head>
<body>
	<div id="make_story">
		<div style="width:100%;">
			<h1>스토리 만들기</h1>
		</div>
		<div id="make_story_body">
			<table id="ms_table">
				<tr>
					<td class="left">
						스토리 이름
					</td>
					<td class="right">
						<input type="text" id="story_nm" class="st_text">
					</td>
				</tr>
				<tr>
					<td class="left">
						관심분야
					</td>
					<td class="right">
						<select id="interest" class="st_select">
								<option value="x">-----관심분야 선택-----</option>
							<c:forEach var="clist" items="${clist }">
								<option value="${clist.code_cd }">${clist.code_name }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="left">
						상세분야
					</td>
					<td class="right">
						<select id="interest_detail" class="st_select">
						</select> 
						<input type="button" id="interest_add" class="st_button" value="추가">
					</td>
				</tr>
				<tr>
					<td class="left">
						관심분야 목록
					</td>
					<td id="add" class="right">
						
					</td>
				</tr>
				<tr>
					<td colspan="2" style="height:70px; border:none;">
						<input type="button" id="make_story_ok" class="st_button" value="스토리 만들기">
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	$(document).on('change','#interest',function(){
		var up_code = $(this).val()
		$.ajax({
			url : 'find_interest_detail',
			dataType : 'json',
			type : 'get',
			data : {
				'up_code' : up_code
			},
			success : function(data){
				var clist = data.clist
				code_name = clist[0].code_name
				var html = "";
				$("#interest_detail").html("")
				$.each(clist,function(i){
					html = "";
					html += "<option value='"+clist[i].code_cd+"' param='"+clist[i].code_name+"'>";
					html += 	clist[i].code_name;
					html += "</option>";
					$("#interest_detail").append(html)
				})
			}
		})
	})

	var arr = new Array();	//관심 분야를 담기 위한 배열
	$(document).on('click','#interest_add',function(){
		var code_cd = $("#interest_detail").val()
		var code_name = $("#interest_detail option:selected").html()
		var exit = false
		console.log(code_name)
		var html = "";
		
		$.each(arr,function(i){		//이미 추가된 경우를 확인하기 위해
			if(arr[i] == code_cd){
				alert("이미 추가된 분야입니다.")
				exit = true			//true가 되어 빠져나감
				return false
			}
		})
		if(exit){					// 빠져나감
			return false
		}
		arr.push(code_cd)
		html += "<div class='st_button' id='add_interest"+code_cd+"' style='line-height:30px; display:inline-block; margin:5px; position:relative'>";
		html += 	"<span class='delete_interest' param='"+code_cd+"' style='display:block; width:15px; height:15px; color:white; position:absolute; right:5px;'>";
		html += 		"X";
		html += 	"</span>";
		html += 	code_name;
		html += "</div>";
		$("#add").append(html)
	})
	$(document).on('click','.delete_interest',function(){
		var code_cd = $(this).attr("param")
		$.each(arr,function(i){
			if(arr[i] == code_cd){
				var index = arr.indexOf(i)
				arr.splice(index,1)
			}
		})
		$("#add_interest"+code_cd).remove()
		$.each(arr,function(i){
			console.log(arr[i])
		})
	})
	$(document).on('click','#make_story_ok',function(){
		jQuery.ajaxSettings.traditional = true
		var jsonData = {
				'story_nm' : [$("#story_nm"),'스토리명을', 'text']
		}
		if(isEmpty(jsonData)){
			return false
		}
		if(arr.length<1){
			alert("관심분야는 한개 이상 선택해주세요.")
			return false
		}
		$.ajax({
			url : 'make_story_ok',
			type : 'get',
			data : {
				'interest' : arr,
				'story_nm' : $("#story_nm").val()
			},
			success : function(data){
				var res = data
				if(res>0){
					alert("스토리가 생성되었습니다.")
					location.href="story_main"
				}else{
					alert("이미 스토리가 존재합니다.")
				}
			}
		})
	})
})
</script>
</html>
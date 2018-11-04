<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#add_code{width:1260px; margin:0 auto;}
#code_table{width:80%; margin:0 auto;}
#code_table th, #code_table td{border:1px solid #D8D8D8; height:30px;}
#code_table th:first-chind{width:10%;}
#code_table th:nth-child(2){width:70%;}
#code_table th:nth-child(3){width:10%;}
#code_table th:nth-child(4){width:10%;}
#add_table{width:600px; margin:10px auto;}
#add_table td{height:60px;}
#add_table input{margin-left:10px;}
#add_table span{margin-left:10px;}
</style>
</head>
<body>
	<div id="add_code">
		<h1>코드리스트</h1>
		<table id="code_table">
			<tr>
				<th>CODE_CD</th>
				<th>CODE_NAME</th>
				<th>UP_CODE</th>
				<th>CODE_LEVEL</th>
			</tr>
			<tbody id="code_info">
				
			</tbody>
		</table>
		<h1>코드등록</h1>
		<form id="form" name="form" onsubmit="return false">
			<table id="add_table">
				<tr>
					<td class="left">코드명</td>
					<td class="right">
						<input type="text" id="code_name" name="code_name" class="st_text">
					</td>
				</tr>
				<tr>
					<td class="left">상위코드</td>
					<td class="right">
						<span id="up_code_span"></span>
					</td>
				</tr>
				<tr>
					<td class="left">코드레벨</td>
					<td class="right">
						<span id="code_level_span"></span>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<input type="hidden" name="up_code" id="up_code">
						<input type="hidden" name="code_level" id="code_level">
						<input type="button" class="st_button" id="add_code_ok" value="코드등록">
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	function clist(data){
		var clist = data.clist
		var html = "";
		$("#code_info").html("")		//코드정보 초기화
		$.each(clist,function(i){
			html = "";
			html += "<tr>";
			html += 	"<td>"+clist[i].code_cd+"</td>";
			html += 	"<td style='text-align:left;'>";
			if(clist[i].code_level>0){
				for(var j=0; j<clist[i].code_level; j++){
					html += "&nbsp;&nbsp;&nbsp";
				}
			}
			html +=			"<span class='code_name' param='"+clist[i].code_cd+"' style='margin-left:10px; cursor:pointer; text-decoration:underline;'>";
			html +=				clist[i].code_name;
			html += 		"</span>";
			html += 	"</td>";
			html += 	"<td>"+clist[i].up_code+"</td>";
			html += 	"<td>"+clist[i].code_level+"</td>";
			html += "</tr>";
			$("#code_info").append(html)	//코드 담기
		})
	}
	$.ajax({
		url : 'code_list',
		dataType : 'json',
		data : {},
		type : 'get',
		success : function(data){
			clist(data)
		}
	})
	$(document).on('click','.code_name',function(){
		var code_cd = $(this).attr("param")
		var scroll_top = $("#add_table").offset().top
		$.ajax({
			url : 'code_info',
			dataType : 'json',
			type : 'get',
			data : {
				'code_cd' : code_cd
			},
			success : function(data){
				var cdto = data.cdto;
				console.log(JSON.stringify(cdto))
				$("#up_code_span").html(cdto.code_cd)
				$("#code_level_span").html(cdto.code_level+1)
				$("#up_code").val(cdto.code_cd)
				$("#code_level").val(cdto.code_level)
				$("#code_name").focus()
				$("html, body").animate({scrollTop : scroll_top},10)
			}
		})
	})
	
	$(document).on('click','#add_code_ok',function(){
		console.log("!!!")
		var fd = $("#form").serialize()
		var jsonData = {
			'code_name' : [$("#code_name"),'코드명을','text'],
			'up_code' : [$("#up_code"),'상위코드를','select']
		}
		if(isEmpty(jsonData)){
			return false
		}
		$.ajax({
			url : 'add_code_ok',
			dataType : 'json',
			type : 'post',
			data : fd,
			success : function(data){
				$("#code_name").val("")
				clist(data)
			}
		})
	})
	$(document).on('keyup','#code_name',function(e){
		if(e.keyCode == '13'){
			var fd = $("#form").serialize()
			var jsonData = {
				'code_name' : [$("#code_name"),'코드명을','text'],
				'up_code' : [$("#up_code"),'상위코드를','select']
			}
			if(isEmpty(jsonData)){
				return false
			}
			$.ajax({
				url : 'add_code_ok',
				dataType : 'json',
				type : 'post',
				data : fd,
				success : function(data){
					$("#code_name").val("")
					clist(data)
				}
			})
		}
	})
})

</script>
</html>
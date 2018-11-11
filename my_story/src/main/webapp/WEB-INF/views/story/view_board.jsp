<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
#view_board{width:1260px; margin:0 auto;}
#view_body,#comment_body,#comment_list_body,#comment_count_body{width:900px; margin:0 auto;}
#view_body{border:1px solid #D8D8D8;}
#view_body_top{width:100%; height:100px; border-bottom:1px solid #D8D8D8;}

#view_body_center{width:100%;}

#view_body_bottom{width:100%; height:50px; text-align:left; border-top:1px solid #D8D8D8;}

#comment_write{width:100%; height:300px; border:1px solid #D8D8D8; margin-top:50px;}

#comment_list_body{width:900px; margin-top:50px; border:1px solid #D8D8D8;}

#comment_count_body{width:900px; height:30px; margin-top:50px;}
</style>
</head>
<body>
	<div id="view_board">
		<div id="view_body">
			<div style="width:95%; height:95%; position:relative; left:2.5%; top:2.5%;">
				<div id="view_body_top">
					<div style="width:100%; height:30px; text-align:left; line-height:30px; position:relative;">
						<span style="font-size:15px; font-weight:bolder; margin-left:10px;">
							[${bdto.cate_nm }]
						</span>
						<span id="like_count" style="font-size:15px; font-weight:bolder; position:absolute; right:0; margin-right:10px;">
							좋아요 : ${bdto.like_count }
						</span>
					</div>
					<div style="width:100%; height:40px; text-align:left; line-height:40px;">
						
						<span style="font-size:30px; font-weight:bolder; margin-left:10px;">
							${bdto.board_title }
						</span>
					</div>
					<div style="width:100%; height:30p; text-align:right; line-height:30px;">
						<span style="font-size:15px; color:gray; margin-right:10px;">
							${bdto.write_date }
						</span>
					</div>
				</div>
				<div id="view_body_center">
					<div style="margin-top:10px; margin-left:10px;">
						${bdto.board_content }
						<br>
					</div>
				</div>
				
			</div>
			<div id="view_body_bottom">
				<c:choose>
					<c:when test="${bdto.like_check == 'o' }">
						<div id="delete_like" style="width:50px; height:50px; border:1px solid #D8D8D8; display:inline-block; color:red; line-height:50px;">
							좋아요
						</div>
					</c:when>
					<c:otherwise>
						<div id="add_like" style="width:50px; height:50px; border:1px solid #D8D8D8; display:inline-block; line-height:50px;">
							좋아요
						</div>
					</c:otherwise>
				</c:choose>
				</div>
		</div>
		<div id="comment_body">
			<form id="form" action="write_comment_ok" method="get">
				<div id="comment_write">
					<h3 style="text-align:left;">
					<span style="margin-left:10px;">댓글작성</span>
					</h3>
					<div style="width:100%; height:300px;">
						<div style="width:90%; height:60%; position:relative; top:5%; left:5%; border:1px solid #D8D8D8;">
							<label for="comment_content" id="comment_content_label" style="position:absolute; color:silver; z-index:10; top:6px;">댓글을 작성해주세요</label>
							<textarea id="comment_content_tx" style="resize:none; width:95%; height:90%; position:relative; top:2.5%; border:none; outline:none;"></textarea>
						</div>
						<div style="width:90%; position:relative; top:10%; left:5%; text-align:right;">
							<input type="button" id="write_comment_ok_btn" value="작성완료" class="st_button" style="">
						</div>
					</div>
				</div>
				<input type="hidden" name="board_cd" value="${bdto.board_cd }">
				<input type="hidden" name="member_cd" value="${member_cd }">
				<input type="hidden" name="page_num" value="1">
				<input type="hidden" id="comment_content" name="comment_content">
			</form>
		</div>
		<div id="comment_list_body">
			<div style="width:95%; height:95%; position:relative; top:2.5%; left:2.5%;">
				<h2 style="text-align:left;">
					<span style="margin-left:10px;">댓글목록</span>
				</h2>
				<div id="clist_body">
					<!-- <div style="width:100%; height:250px; border-top:1px solid #D8D8D8; border-bottom:1px solid #D8D8D8; margin-top:20px;">
						<div style="width:95%; height:90%; position:relative; top:5%; left:2.5%;">
							<div style="width:100%; height:20px; line-height:20px; text-align:right;">
								<span style="margin-right:10px;">2018-11-11</span>
							</div>
							<div style="width:100%; height:50px; text-align:left; line-height:50px; display:flex;">
								<div style="width:7%; height:50px; line-height:50px; display:inline-block; position:relative;">
									<img src="resources/profile_image/my_image.jpg" style="width:30px; height:30px; border-radius:100%; position:absolute; top:10px; left:10px;">
								</div>
								<div style="width:93%; height:50px; display:inline-block; text-align:left; line-height:50px;">
									<span style="font-weight:bolder; font-size:15px; margin-left:10px;">노준수</span>
								</div>
							</div>
							<div style="width:100%; height:110px; position:relative;">
								<div style="width:95%; height:95%; position:relative; top:2.5%; left:2.5%; text-align:left; font-size:13px;">
									안녕하세요.
								</div>
							</div>
							<div style="width:100%; height:40px; text-align:right; line-height:40px;">
								<span style="margin-right:10px;">좋아요</span>
								<span style="margin-right:10px;">싫어요</span>
							</div>
						</div>
					</div> -->
				</div>
			</div>
			
		</div>
		<div id="comment_count_body">
			<ul id="comment_count" style="width:100%; height:100%; font-size:0px; display:flex; justify-content:center;">
			
			</ul>
		</div>
	</div>
</body>
<script type="text/javascript">
$(document).ready(function(){
	var member_cd = '${member_cd}';
	var board_cd = '${bdto.board_cd}';
	var start_page;
	var end_page;
	var current_page;
	var page_count;
	var page_block;
	
	function comment_count(data){
		start_page = data.start_page;
		end_page = data.end_page;
		current_page = data.current_page;
		page_count = data.page_count;
		page_block = data.page_block
		var html = "";
		var prev_html = "";
		var next_html = "";
		$("#comment_count").html("")
		
		if(start_page>page_block){
			prev_html += "<li id='prev_comment' param='"+start_page+"' style='width:30px; height:30px; display:inline-block; border:1px solid gray; line-height:30px; cursor:pointer;'>";
			prev_html += 	"이전";
			prev_html += "<li>";
			$("#comment_count").append(prev_html)
		}
		

		for(var i=start_page; i<=end_page; i++){
			html = "";
			if(current_page == i){		//현재 보고있는 댓글 페이지
				html += 	"<li id='page_num' class='page_num' param='"+i+"' style='width:30px; height:30px; display:inline-block; border:1px solid gray; line-height:30px; cursor:pointer; font-weight:bolder;'>";
				html += 		i;
				html += 	"</li>";				
			}else{
				html += 	"<li id='page_num' class='page_num' param='"+i+"' style='width:30px; height:30px; display:inline-block; border:1px solid gray; line-height:30px; cursor:pointer;'>";
				html += 		i;
				html += 	"</li>";
			}
			$("#comment_count").append(html)
		}

		if(page_count>end_page){
			next_html += "<li id='next_comment' param='"+end_page+"' style='width:30px; height:30px; display:inline-block; border:1px solid gray; line-height:30px; cursor:pointer;'>";
			next_html += 	"다음";
			next_html += "<li>";
			$("#comment_count").append(next_html)
		}
	}
	
	
	$(document).on('click','.page_num',function(){
		var page_num = $(this).attr("param")
		$.ajax({
			url : 'comment_list',
			dataType : 'json',
			type : 'get',
			data : {
				'board_cd' : board_cd,
				'page_num' : page_num
			},
			success : function(data){
				comment_list(data)
				comment_count(data)
			}
		})
	})
	
	
	$(document).on('click','#prev_comment',function(){
		var page_num = $(this).attr("param")
		page_num = parseInt(page_num)-page_block			//이전페이지로 가기 위해 -page_block;
		console.log(page_num)
		$.ajax({
			url : 'comment_list',
			dataType : 'json',
			type : 'get',
			data : {
				'board_cd' : board_cd,
				'page_num' : page_num
			},
			success : function(data){
				comment_list(data)
				comment_count(data)
			}
		})
	})
	$(document).on('click','#next_comment',function(){
		var page_num = $(this).attr("param")
		page_num = parseInt(page_num)+1				//다음 페이지로 넘어가기 위해 +1;
		console.log(page_num)
		$.ajax({
			url : 'comment_list',
			dataType : 'json',
			type : 'get',
			data : {
				'board_cd' : board_cd,
				'page_num' : page_num
			},
			success : function(data){
				comment_list(data)
				comment_count(data)
			}
		})
	})
	function comment_list(data){
		var clist = data.clist
		
		var html = "";
		$("#clist_body").html("")
		$.each(clist,function(i){
			html = "";
			html += "<div style='width:100%; height:220px; border-top:1px solid #D8D8D8; margin-top:20px;'>";
			html += 	"<div style='width:95%; height:90%; position:relative; top:5%; left:2.5%;'>";
			html += 		"<div style='width:100%; height:20px; line-height:20px; text-align:right;'>";
			html += 			"<span style='margin-right:10px;'>"+clist[i].comment_date+"</span>";
			html += 		"</div>";
			html += 		"<div style='width:100%; height:50px; text-align:left; line-height:50px; display:flex;'>";
			html += 			"<div style='width:7%; height:50px; line-height:50px; display:inline-block; position:relative;'>";
			html += 				"<img src='resources/profile_image/"+clist[i].profile_image+"' style='width:40px; height:40px; border-radius:100%; position:absolute; left:5px;'>";
			html += 			"</div>";
			html += 			"<div style='width:93%; height:50px; display:inline-block; text-align:left; line-height:50px;'>";
			html += 				"<span style='font-weight:bolder; font-size:15px; margin-left:10px;'>노준수</span>";
			html += 			"</div>";
			html += 		"</div>";
			html += 		"<div style='width:100%; height:110px; position:relative;'>";
			html += 			"<div style='width:95%; height:95%; position:relative; top:2.5%; left:2.5%; text-align:left; font-size:13px; overflow-y:scroll'>";
			html += 				clist[i].comment_content;
			html += 			"</div>";
			html += 		"</div>";
			html += 		"<div style='width:100%; height:40px; text-align:right; line-height:40px;'>";
			html += 			"<span style='margin-right:10px;'>좋아요</span>";
			html += 			"<span style='margin-right:10px;'>싫어요</span>";
			html += 		"</div>";
			html += 	"</div>";
			html += "</div>";
			$("#clist_body").append(html)
		})
	}
	
	
	

	$.ajax({
		url : 'comment_list',
		dataType : 'json',
		type : 'get',
		data : {
			'board_cd' : board_cd
		},
		success : function(data){
			comment_list(data)
			comment_count(data)
		}
	})
	
	
	
	
	
	
	
	
	
	
	

	
	$(document).on('focus','#comment_content',function(){
		$("#comment_content_label").hide()
	})
	$(document).on('blur','#comment_content',function(){
		if(isNull($("#comment_content").val())){
		$("#comment_content_label").show()
		}
	})
	$(document).on('click','#write_comment_ok_btn',function(){
		var comment_content_tx = $("#comment_content_tx").val()
		var comment_content = comment_content_tx.replace(/(\n|\r\n)/g,'<br>')
		$("#comment_content").val(comment_content)
		var form = $("#form").serialize();
		if(isNull(member_cd)){
			alert("댓글은 로그인 후 작성이 가능합니다")
			return false
		}
		if(isNull(comment_content_tx)){
			alert("내용을 입력해주세요.")
			return false
		}
		
		$.ajax({
			url : 'write_comment_ok',
			type : 'post',
			dataType : 'json',
			data : form,
			success : function(data){
			/* 	window.location.reload() */
				comment_list(data)
				comment_count(data)
				$("#comment_content_tx").val("")
			}
		})
	})
})
</script>
<script type="text/javascript">
$(document).ready(function(){
	var member_cd = '${member_cd}';
	var board_cd = '${bdto.board_cd}';
	$(document).on('click','#add_like',function(){
		$.ajax({
			url : 'add_like',
			type : 'get',
			dataType : 'json',
			data : {
				'member_cd' : member_cd,
				'board_cd' : board_cd
			},
			success : function(data){
				var like_count = data.like_count
				$("#like_count").html("좋아요 : "+like_count)
				$("#add_like").css({'color':'red'})
				$("#add_like").attr("id","delete_like")
			}
		})
	})
	$(document).on('click','#delete_like',function(){
		$.ajax({
			url : 'delete_like',
			type : 'get',
			dataType : 'json',
			data : {
				'member_cd' : member_cd,
				'board_cd' : board_cd
			},
			success : function(data){
				var like_count = data.like_count
				$("#like_count").html("좋아요 : "+like_count)
				$("#delete_like").css({'color':'black'})
				$("#delete_like").attr("id","add_like")
			}
		})
	})
})
</script>
</html>
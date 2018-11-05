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
body{background:silver;}
</style>
</head>
<body>
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
	</div>
	<div id="footer">
	
	</div>
</body>
</html>
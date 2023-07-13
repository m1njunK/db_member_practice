<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
<%
	session.invalidate();
	Cookie cookie = new Cookie("id","");
	cookie.setMaxAge(0);	
	response.addCookie(cookie);
%>
<script>
	alert('로그아웃 되었습니다.');
	location.href = 'index.jsp?page=default';
</script>
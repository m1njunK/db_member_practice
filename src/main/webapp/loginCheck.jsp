<%@page import="vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>    
<%@ include file="conn.jsp"%>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String login = request.getParameter("login");
	
	if(login != null){
		Cookie cookie = new Cookie("id",id);
		cookie.setMaxAge(3600*24);
		response.addCookie(cookie);
	}
	
	String sql = "SELECT * FROM test_member WHERE id = ? AND pass = ?;";
	
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	
	rs = pstmt.executeQuery();
	
	if(!rs.next()){
		out.println("<script>");
		out.println("alert('일치하는 회원 정보가 존재하지 않습니다.')");
		out.println("history.back()");
		out.println("</script>");
		return;
	}
	
	MemberVO loginMember = new MemberVO();
	
	loginMember.setNum(rs.getInt(1));
	loginMember.setId(id);
	loginMember.setPass(pass);
	loginMember.setName(rs.getString(4));
	loginMember.setAddr(rs.getString(5));
	loginMember.setPhone(rs.getString(6));
	loginMember.setGender(rs.getString(7));
	loginMember.setAge(rs.getInt(8));
	
	session.setAttribute("loginMember", loginMember);
	
	if(pstmt != null) pstmt.close();
	if(rs != null) rs.close();
	if(conn != null) conn.close();	
	
%>
<script>
	alert('로그인 성공!');
	location.href='index.jsp';
</script>	

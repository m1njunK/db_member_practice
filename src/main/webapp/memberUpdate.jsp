<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="conn.jsp" %>
<%
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	String name = request.getParameter("name");
	String addr = request.getParameter("addr");
	String phone = request.getParameter("phone");
	String gender = request.getParameter("gender");
	String strAge = request.getParameter("age");
	String num = request.getParameter("num");
	
	if(id == null || id.equals("admin")){
		out.println("<script>");
		out.println("alert('나가!!!')");
		out.println("location.href='index.jsp'");
		out.println("</script>");
		return;
	}
	
	int age = Integer.parseInt(strAge);
	
	String sql = "SELECT * FROM test_member WHERE id = "+id;
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		out.println("<script>");
		out.println("alert('이미 사용중인 아이디!')");
		out.println("history.back()");
		out.println("</script>");
		stmt.close();
		return;
	}
	
	sql = "UPDATE test_member SET id = ?, pass = ?, name = ?, addr = ?, phone = ?, gender = ?, age = ? WHERE num = ? ;";
	
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	pstmt.setString(2,pass);
	pstmt.setString(3,name);
	pstmt.setString(4,addr);
	pstmt.setString(5,phone);
	pstmt.setString(6,gender);
	pstmt.setInt(7,age);
	pstmt.setInt(8,Integer.parseInt(num));
/* 	pstmt.setString(9,id); */
	
	int result = pstmt.executeUpdate();
	
	if(result < 0){
		out.println("<script>");
		out.println("alert('우째했노?')");
		out.println("location.href='index.jsp'");
		out.println("</script>");
		return;
	}
	
	if(pstmt != null) pstmt.close();
	if(stmt != null) stmt.close();
	if(conn != null) conn.close();
%>
<script>
	alert('회원정보 수정 완료!');
	location.href='index.jsp?page=memberList';
</script>
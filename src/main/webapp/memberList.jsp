<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<%@ include file="conn.jsp" %>
<%
	if(loginMember.getId() == null || !loginMember.getId().equals("admin")){
		out.println("<script>");
		out.println("alert('어허');");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	}
%>
<table border="1">
	<tr>
		<th colspan="7"><h1>회원목록</h1></th>
	</tr>
	<tr>
		<th>번호</th>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		<th>성별</th>
		<th>나이</th>
	</tr>
<% 
	String sql = "SELECT * FROM test_member ORDER BY num DESC;";
	stmt = conn.createStatement();
	
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		int num = rs.getInt("num");
		String name = rs.getString("name");
		String id = rs.getString("id");
		String addr = rs.getString("addr");
		String phone = rs.getString("phone");
		String gender = rs.getString("gender");
		int age = rs.getInt("age");
%>
	<tr onclick="location.href='index.jsp?page=memberInfo&num=<%=num%>'">
		<td><%=num%></td>
		<td><%=id%></td>
		<td><%=name%></td>
		<td><%=addr%></td>
		<td><%=phone%></td>
		<td><%=gender%></td>
		<td><%=age%></td>
	</tr>		
	<%}%>
</table>
<%
	if(stmt != null) stmt.close();
	if(rs != null) rs.close();
	if(conn != null) conn.close();
%>
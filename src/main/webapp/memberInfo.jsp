<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<%@ include file="conn.jsp"%>
<%
	if(loginMember.getId() == null || !loginMember.getId().equals("admin")){
		out.println("<script>");
		out.println("alert('���� �ϰ� ���ð��� �ƴϴ�!');");
		out.println("location.href='index.jsp'");
		out.println("</script>");
		return;
	}

	int num = Integer.parseInt(request.getParameter("num"));
	
	String id = "";
	String name = "";
	String addr = "";

	stmt = conn.createStatement();
	String sql = "SELECT id,name,addr FROM test_member WHERE num = "+num+";";
	rs = stmt.executeQuery(sql);
	
	if(rs.next()){
		id = rs.getString(1);
		name = rs.getString(2);
		addr = rs.getString(3);
	}else {
		out.println("<script>");
		out.println("alert('�峭ġ������');");
		out.println("location.href='index.jsp';");
		out.println("</script>");
		return;
	}
	if(stmt!=null) stmt.close();
	if(rs!=null) rs.close();
	if(conn!=null) conn.close();
%>
<table>
	<tr>
		<th colspan="2"><%=num%>�� ȸ���� ����</th>
	</tr>
	<tr>
		<td>���̵�</td>
		<td><%=id%></td>
	</tr>
	<tr>
		<td>�̸�</td>
		<td><%=name%></td>
	</tr>
	<tr>
		<td>�ּ�</td>
		<td><%=addr%></td>
	</tr>
	<%if(!id.equals("admin")) {%>
	<tr>
		<td><a href="index.jsp?page=memberUpdateForm&num=<%=num%>">����</a>&nbsp;&nbsp;&nbsp;|</td>
		<td><a href="withdraw.jsp?num=<%=num%>" onclick="return confirm('<%=num%> ȸ�� ������ ������ ����?')">����</a></td>
	</tr>
	<%}else{%>
	<tr>
		<td colspan="2"><a href="index.jsp?page=memberList">Go Back</a></td>
	</tr>
	<%}%>
</table>
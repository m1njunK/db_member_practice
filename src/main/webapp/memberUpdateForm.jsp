<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ include file="conn.jsp" %>
<script type="text/javascript" src="js/inputCheck.js"></script>
<%
	String num = request.getParameter("num");
	
	stmt = conn.createStatement();
	String sql = "SELECT * FROM test_member WHERE num ="+num+";";
	rs = stmt.executeQuery(sql);

	String name = "";
	String id = "";
	String pass = "";
	String addr = "";
	String phone = "";
	String gender = "";
	int age = 0;
	
	if(rs.next()){
		id = rs.getString(2);
		pass = rs.getString(3);
		name = rs.getString(4);
		addr = rs.getString(5);
		phone = rs.getString(6);
		gender = rs.getString(7);
		age = rs.getInt(8);
	}else{
		out.println("<script>");
		out.println("alert('�峭ġ�� ������.')");
		out.println("location.href='index.jsp?page=memberList'");
		out.println("</script>");
		return;
	}
%>
<form action="index.jsp?page=memberUpdate" method="POST">
	<table>
		<tr>
			<td colspan="2">
				<h1>ȸ������ ����</h1>
			</td>
		</tr>
		<tr>
			<td>���̵�</td>
			<td><input type="text" value="<%=id%>" name="id"></td>
		</tr>
		<tr>
			<td>��й�ȣ</td>
			<td><input type="password" value="<%=pass%>" name="pass"></td>
		</tr>
		<tr>
			<td>�̸�</td>
			<td><input type="text" value="<%=name%>" name="name"></td>
		</tr>
		<tr>
			<td>�ּ�</td>
			<td><input type="text" value="<%=addr%>" name="addr"></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><input type="text" value="<%=phone%>" name="phone"></td>
		</tr>
		<tr>
			<td>����</td>
			<td>
				<input type="radio" value="����" name="gender" <%=gender.equals("����") ? "checked" : ""%>>����
				<input type="radio" value="����" name="gender" <%=gender.equals("����") ? "checked" : ""%>>����
			</td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type="text" value="<%=age%>" name="age"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button <%= num.equals("1") ? "disabled" : "" %>>���� �Ϸ�</button>
			</td>
		</tr>
	</table>
	<input type="hidden" value="<%=num%>" name="num"/>
</form>
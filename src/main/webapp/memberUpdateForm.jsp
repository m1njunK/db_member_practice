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
		out.println("alert('장난치지 말랬다.')");
		out.println("location.href='index.jsp?page=memberList'");
		out.println("</script>");
		return;
	}
%>
<form action="index.jsp?page=memberUpdate" method="POST">
	<table>
		<tr>
			<td colspan="2">
				<h1>회원정보 수정</h1>
			</td>
		</tr>
		<tr>
			<td>아이디</td>
			<td><input type="text" value="<%=id%>" name="id"></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="password" value="<%=pass%>" name="pass"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type="text" value="<%=name%>" name="name"></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><input type="text" value="<%=addr%>" name="addr"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type="text" value="<%=phone%>" name="phone"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<input type="radio" value="남성" name="gender" <%=gender.equals("남성") ? "checked" : ""%>>남성
				<input type="radio" value="여성" name="gender" <%=gender.equals("여성") ? "checked" : ""%>>여성
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td><input type="text" value="<%=age%>" name="age"></td>
		</tr>
		<tr>
			<td colspan="2">
				<button <%= num.equals("1") ? "disabled" : "" %>>수정 완료</button>
			</td>
		</tr>
	</table>
	<input type="hidden" value="<%=num%>" name="num"/>
</form>
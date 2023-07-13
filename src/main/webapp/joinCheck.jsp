<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="joinMember" class="vo.MemberVO"/>
<jsp:setProperty property="*" name="joinMember"/>
<%@ include file="conn.jsp" %>
<%
	String id = joinMember.getId();
	String pass = joinMember.getPass();
	String name = joinMember.getName();
	String addr = joinMember.getAddr();
	String phone = joinMember.getPhone();
	String gender = joinMember.getGender();
	int age = joinMember.getAge();
	
	/* String sql = "INSERT INTO test_member SELECT NULL, ?, ?, ?, ?, ?, ?, ? WHERE NOT EXISTS(SELECT 1 FROM test_member WHERE id = '"+id+"')"; */
	String sql = "INSERT IGNORE INTO test_member VALUES(NULL, ?, ?, ?, ?, ?, ?, ?);";
	pstmt = conn.prepareStatement(sql);
	
	pstmt.setString(1, id);
	pstmt.setString(2, pass);
	pstmt.setString(3, name);
	pstmt.setString(4, addr);
	pstmt.setString(5, phone);
	pstmt.setString(6, gender);
	pstmt.setInt(7, age);

	int result = pstmt.executeUpdate();
	
	if(result < 1){
		out.println("<script>");
		out.println("alert('이미 사용중인 아이디 입니다!')");
		out.println("history.back()");
		out.println("</script>");
		return;
	}
	
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
%>
<script>
	alert('회원가입 완료!');
	location.href='index.jsp?page=login';
</script>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<%@ include file="conn.jsp"%>
<%
	String strNum = request.getParameter("num");
	boolean check = false;	

	if(strNum == null){
		strNum = String.valueOf(loginMember.getNum());
		check = true;
	}
	
	int num = Integer.parseInt(strNum);
	
	if(num == 1 || loginMember.getId() == null){
		out.println("<script>");
		out.println("alert('가만두지 않겠어요')");
		out.println("location.href='index.jsp'");
		out.println("</script>");
		return;
	}
	
	String sql = "DELETE FROM test_member WHERE num = ?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setInt(1, num);
	
	int result = pstmt.executeUpdate();
	
	if(result > 0){
		out.println("<script>");
		out.println("alert('회원정보 삭제 완료!')");
		out.println("location.href='index.jsp'");
		out.println("</script>");
	}
	
	if(check){
		session.removeAttribute("loginMember");
		Cookie c = new Cookie("id","");
		c.setMaxAge(0);
		response.addCookie(c);
	}
	
	if(pstmt!=null) pstmt.close();
	if(conn!=null) conn.close();
%>
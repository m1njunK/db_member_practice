<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../conn.jsp" %>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
 <!-- header.jsp -->
<%
	Cookie[] cookies = request.getCookies();
	if(cookies != null && loginMember.getId() == null){
		for(Cookie c : cookies){
			if(c.getName().equals("id")){
				String id = c.getValue();
				String sql = "SELECT * FROM test_member WHERE id = '"+id+"';";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()){
					loginMember.setId(id);
					loginMember.setPass(rs.getString(3));
					loginMember.setName(rs.getString(4));
					loginMember.setAddr(rs.getString(5));
					loginMember.setPhone(rs.getString(6));
					loginMember.setGender(rs.getString(7));
					loginMember.setAge(rs.getInt(8));
				}
				
				session.setAttribute("loginMember", loginMember);
				
				if(stmt != null) stmt.close();
				if(rs != null) rs.close();
				if(conn != null) conn.close();
			}
		}
	}
%>
<ul>
 	<li><a href="index.jsp">home</a></li>
	<%if(loginMember.getId() != null) {%>
	<li>
	<a href="index.jsp?page=info"><%=loginMember.getName()%></a>
	<%=loginMember.getId().equals("admin") ? "님 방가방가~" : "님 반갑습니다."%>
	</li>
	<%if(loginMember.getId().equals("admin")){%>
	<li><a href="index.jsp?page=memberList">회원관리</a></li>
	<%}%>
	<li><a href="logOut.jsp">로그아웃</a></li>
	<%}else{%>
	<li><a href="index.jsp?page=login">로그인</a></li>
 	<li><a href="index.jsp?page=join">회원가입</a></li>
	<%}%> 
</ul>
 
 
 
 
 
 
 
 
 
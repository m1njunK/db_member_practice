<%@page import="java.sql.*"%>
<%-- <%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%> --%>
<%
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/digital_jsp",
			"digital",
			"12345"
	);
	
	Statement stmt = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
%>
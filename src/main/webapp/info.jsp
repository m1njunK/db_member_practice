<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="loginMember" class="vo.MemberVO" scope="session"/>
<table>
	<tr>
		<td colspan="2"><h1>회원정보</h1></td>
	</tr>
	<tr>
		<td>아이디</td>
		<td><%=loginMember.getId()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=loginMember.getName()%></td>
	</tr>
	<tr>
		<td>주소</td>
		<td><%=loginMember.getAddr()%></td>
	</tr>
	<tr>
		<td>전화번호</td>
		<td><%=loginMember.getPhone()%></td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<input type="radio" <%=loginMember.getGender().equals("남성") ? "checked" : "disabled"%>/> 남성
			<input type="radio" <%=loginMember.getGender().equals("여성") ? "checked" : "disabled"%>/> 여성
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=loginMember.getAge()%></td>
	</tr>
	<tr>
		<td colspan="2">
			<button type="button" onclick="location.href='index.jsp';">메인으로</button>
			<%if(!loginMember.getId().equals("admin")){%>
			<button type="button" onclick="withdraw();">회원탈퇴</button>
			<%}%>
		</td>
	</tr>
</table>
<script>
	function withdraw(){
		var bool = confirm("정말로 탈퇴하시겠습니까?");
		if(bool){
			location.href="withdraw.jsp";
		}
	}
</script>
























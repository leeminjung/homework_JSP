<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String userid = request.getParameter("userid");
	String userpw = request.getParameter("userpw");
	String name = request.getParameter("name");
	String hp = request.getParameter("hp");
	String email = request.getParameter("email");
	String hobby[] = request.getParameterValues("hobby"); //hobby는 배열이므로.
	String hobbystr = "";
	for(int i=0; i<hobby.length; i++){
		hobbystr = hobbystr + hobby[i] + " ";	// 드라이브 등산
	}
	String ssn1 = request.getParameter("ssn1");
	String ssn2 = request.getParameter("ssn2");
	String zipcode = request.getParameter("zipcode");
	String address1 = request.getParameter("address1");
	String address2 = request.getParameter("address2");
	String address3 = request.getParameter("address3");
	
	Connection conn = null;
	PreparedStatement pstmt = null; //insert시키기위해서  썼던 클래스 . sql문장 실행해주는 녀석임
	
	String sql = ""; //변수만듦
	String url = "jdbc:mysql://localhost:3306/jcp";
	String uid = "root";
	String upw = "1234";
	
	try{
		Class.forName("com.mysql.cj.jdbc.Driver"); //드라이버를 찾을거임
		conn = DriverManager.getConnection(url, uid, upw); //conn객체를 만들면 DriverManager에서 뽑아쓰죠!
		if(conn != null){ //연결이 되었다면 회원가입을 시켜줄거임!
			sql += "insert into tb_member(mem_userid, mem_userpw, mem_name, ";
			sql += "mem_hp, mem_email, mem_hobby, mem_ssn1, mem_ssn2, mem_zipcode,";
			sql += "mem_address1, mem_address2, mem_address3) values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.setString(2, userpw);
			pstmt.setString(3, name);
			pstmt.setString(4, hp);
			pstmt.setString(5, email);
			pstmt.setString(6, hobbystr);
			pstmt.setString(7, ssn1);
			pstmt.setString(8, ssn2);
			pstmt.setString(9, zipcode);
			pstmt.setString(10, address1);
			pstmt.setString(11, address2);
			pstmt.setString(12, address3);
			pstmt.executeUpdate(); //데이터를 저장시켜줌
		}
	}catch(Exception e){
		e.printStackTrace();
	}
%>
<script>
	alert('회원가입 완료되었습니다');
	location.href='login.jsp';
</script>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<% 
	String firstname=null;
	String lastname=null;
	String message=null;
	String gender=null;
	String age=null;
	String birthday=null;
%>

<% //HTML Practice %>
<html>
	<head>
		<meta charset="UTF-8">
		<title>First JSP</title>
	</head>
	<body>
		<h1> HelloWorld</h1>
		<p> This is a paragraph dfasdfas asdfasd asdfadsf nmn asdfasdf ad sj dkfhk sjdhfk 
			jsdf fhsddif asdfsdf asdfasdf asdfadsf asdnj kssdfad hfk sdfsdf sdfsdf sdfsd
			<strong>jsdasdfda asdf asdf asdfas asdf asasdfdf fkjhka sjdhfjd sfs</strong> 
			dijldnjk vajdn asdjnfksdjnfakj adsf asd f enfj adsnckjnsdjfks mdnjkajsn dfjk 
			sdjnfjskd nfjkas d <em>dasdfasd fsadfgsd asd fgsdfgd fg</em> sdfasdf asdferga dg 
		</p>
		
		<a href="https://bashpolesoftware.com" target=”_blank” >This is a link to Bashpole's website</a>
		<br><br>
		<img src="https://www.humanesociety.org/sites/default/files/styles/768x326/public/2020-07/cat-410261.jpg?h=191a1c11&itok=Y1Z7MQVJ" alt="cat picture" width="300" height="200">
		
		<h2> Unordered List </h2>
		<ul>
  		<li>Coffee</li>
  		<li>Tea</li>
  		<li>Milk</li>
		</ul>
		
		
		<table>
			<thead>
				<tr>
					<th>Name</th>
					<th>Email</th>
					<th>Age</th>
				<tr>
			<thead>
			<tbody>
				<tr>
					<td>Lisa Sun</td>
					<td>lisa.sun.bashpole@gmail.com</td>
					<td>20</td>
				</tr>
				<tr>
					<td>John Doe</td>
					<td>john.doe.bashpole@gmail.com</td>
					<td>19</td>
				</tr>
			</tbody>
		</table>
		
		<br>

<% //HTML Form Begins 
   // The information in this form will be saved in a mySQl Database 
%>
		<form action="Hello.jsp" method="POST">
			<div>
				<label>First Name</label>
				<input type="text" name="first_name" placeholder= "Enter First Name">
			</div>
			<div>
				<label>Last Name</label>
				<input type="text" name="last_name" placeholder= "Enter Last Name">
			</div>
			<div>
				<label>Message</label>
				<textarea name="message"></textarea>
			</div>
			<div>
				<label>Gender</label>
					<select name="gender">
						<option value="male">Male</option>
						<option value="female">Female</option>
						<option value="other">Other</option>
					</select>
			</div>
			<div>
				<label>Age</label>
				<input type="number" name="age" value="30">
			</div>
			<div>
				<label>Birthday</label>
				<input type="date" name="birthday">
			</div>
			<input type="submit" name="submit" value="Submit">
		</form>
		
	</body>

<%@page import="java.sql.*"%>

<% 
if(request.getParameter("first_name") != null)
{
	lastname=request.getParameter("last_name");
	firstname=request.getParameter("first_name");
	message=request.getParameter("message");
	gender=request.getParameter("gender");
	age=request.getParameter("age");
	birthday=request.getParameter("birthday");
}
%>

<br>
<p> <%= firstname %> </p>
<p> <%= lastname %> </p>


<% 
if(request.getParameter("first_name") != null)
{
	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://rds-mysql-landingpage.cakotyklbf1z.us-west-1.rds.amazonaws.com:3306/landingPage_N4G", "admin","lisa1234");
	Statement st=con.createStatement();
	
	st.executeUpdate("insert into test (firstname,lastname,message,gender,age,birthday) values('"+firstname+"','"+lastname+"','"+message+"','"+gender+"','"+age+"','"+birthday+"')");
	//st.executeUpdate("DELETE FROM test WHERE firstname='Lisa'");
}
%>


</html>
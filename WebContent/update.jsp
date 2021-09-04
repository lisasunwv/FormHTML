<% 
  //Infromation is grabbed from the database and information is updated. 
%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
<meta charset="UTF-8">

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String driverName = "com.mysql.jdbc.Driver";
String USER = "admin";
String PASS = "lisa1234"; 
String DB_URL = "jdbc:mysql://rds-mysql-landingpage.cakotyklbf1z.us-west-1.rds.amazonaws.com:3306/landingPage_N4G";
String DB_NAME = "landingPage_N4G";
String ORG_TABLE_NAME = "intakeclientinfo";
String WEBPAGE_TABLE_NAME = "intakeclientwebpage";

String firstname=null;
String lastname=null;
String message=null;
String gender=null;
String age=null;
String birthday=null;
%>

<%
if(request.getParameter("first_name") == null)
{%>
<form action="update.jsp" method="POST">
<div>
	<label>First Name</label>
	<input type="text" name="first_name" placeholder= "first name" >
</div>
<input type="submit" name="submit" value="Submit">
</form>
<%} %>

<% //Begin first submit process%>

<%
if(request.getParameter("first_name") != null && (request.getParameter("submit")).equals("Submit"))
{
  	firstname=request.getParameter("first_name");


	Class.forName(driverName);

	Connection connection = null;
	Statement st= null;
	ResultSet resultSet = null;

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://rds-mysql-landingpage.cakotyklbf1z.us-west-1.rds.amazonaws.com:3306/landingPage_N4G", "admin","lisa1234");
	st=con.createStatement();

    
	//connection = DriverManager.getConnection(DB_URL + DB_NAME, USER, PASS);	
	//statement = connection.createStatement();

	String sql = "SELECT * FROM test where firstname=" + "'" + firstname + "'" ;

	resultSet = st.executeQuery(sql);
	resultSet.next();
	firstname=resultSet.getString("firstname");
	lastname=resultSet.getString("lastname");
	message=resultSet.getString("message");
	gender=resultSet.getString("gender");
	age=resultSet.getString("age");
	birthday=resultSet.getString("birthday");
}
%>


<%
if(request.getParameter("first_name") != null && (request.getParameter("submit")).equals("Submit"))
{
	
%>


<p> <%= request.getParameter("submit") %> </p>


<form action="update.jsp" method="POST">
			<div>
				<label>First Name</label>
				<input type="text" name="first_name" value= <%= firstname %> >
			</div>
			<div>
				<label>Last Name</label>
				<input type="text" name="last_name" value= <%= lastname %> >
			</div>
			<div>
				<label>Message</label>
				<textarea name="message" > <%=message%> </textarea>
			</div>
			<div>
				<label>Gender</label>	
					<select name="gender" >
						<%if(gender.equals("male")) {%>
							<option value="male"selected>Male</option>
							<option value="female" >Female</option>
							<option value="other" >Other</option>
						<%} %>
						<%if(gender.equals("female")) {%>
							<option value="male">Male</option>
							<option value="female" selected>Female</option>
							<option value="other" >Other</option>
						<%} %>
						<%if(gender.equals("other")) {%>
							<option value="male">Male</option>
							<option value="female" >Female</option>
							<option value="other" selected>Other</option>
						<%} %>
					</select>
			</div>
			<div>
				<label>Age</label>
				<input type="number" name="age" value= <%= age %>>
			</div>
			<div>
				<label>Birthday</label>
				<input type="date" name="birthday" value= <%= birthday %>>
			</div>
			<input type="submit" name="submit" value="Update">
		</form>
<%
}
%>
<% //end first submit process%>


<%
if(request.getParameter("submit")!=null && (request.getParameter("submit")).equals("Update"))
		
{
	Class.forName(driverName);

	Connection connection = null;
	Statement st= null;
	ResultSet resultSet = null;

	Class.forName("com.mysql.jdbc.Driver");
	Connection con=DriverManager.getConnection("jdbc:mysql://rds-mysql-landingpage.cakotyklbf1z.us-west-1.rds.amazonaws.com:3306/landingPage_N4G", "admin","lisa1234");
	st=con.createStatement();
	
	lastname=request.getParameter("last_name");
	firstname=request.getParameter("first_name");
	message=request.getParameter("message");
	gender=request.getParameter("gender");
	age=request.getParameter("age");
	birthday=request.getParameter("birthday");
	
	//st.executeUpdate("Update test set firstname= ?,lastname=?,message=?,gender=?,age=?,birthday=? where firstname="+firstname);
	//st.executeUpdate("Update test set firstname= ('"+firstname +"',lastname= ("+lastname+"),message=("+message+"),gender= ("+gender+"),age=("+age+"),birthday=("+birthday+") where firstname="+firstname);
	
	
	st.executeUpdate("Update test set age= '"+age+"', lastname = '"+lastname+"', firstname= '"+firstname+"', message= '"+message+"', gender= '"+gender+"', birthday= '"+birthday+"' where firstname= '"+firstname+"'");

	%>
	<p>
	Your new entry is now. 
	<br><br>
	First Name: <%= firstname %>
	<br>
	Last Name: <%= lastname %>
	<br>
	Message: <%= message %>
	<br>
	Gender: <%= gender %>
	<br>
	Age: <%= age %>
	<br>
	Birthday: <%= birthday %>
	</p>
	
<%} %>


</html>

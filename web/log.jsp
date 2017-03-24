<%@ page import ="java.sql.*" %>
<%
    String userid = request.getParameter("uname");    
    String pwd = request.getParameter("pass");
    out.println("Invalid "+ userid +" "+ pwd );
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/student",
            "root", "abcd");
    Statement st = con.createStatement();
    ResultSet rs;
    rs = st.executeQuery("select * from members where uname='" + userid + "' and pass='" + pwd + "'");
    while(rs.next()) {
        
        String p = rs.getString("pass");
        if( p.equals(pwd))
        {
           response.sendRedirect("Profile.html"); 
        }
        //session.setAttribute("userid", userid);
        //out.println("welcome " + userid);
        //out.println("<a href='logout.jsp'>Log out</a>");
        
    } 
    
      //  out.println("Invalid password <a href='index.jsp'>try again</a>");
    
%>
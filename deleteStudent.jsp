
<%@ page import="com.studentcrud.StudentDAO" %>
<%
    String rollNoParam = request.getParameter("rollNo");
    if (rollNoParam != null) {
        int rollNo = Integer.parseInt(rollNoParam);
        StudentDAO dao = new StudentDAO();
        dao.deleteStudent(rollNo);
    }
    response.sendRedirect("viewStudents.jsp");
%>

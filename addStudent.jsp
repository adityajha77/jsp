<%@ page import="com.studentcrud.Student, com.studentcrud.StudentDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Add Student</title>
</head>
<body>
<%
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        int rollNo = Integer.parseInt(request.getParameter("rollNo"));
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));

        Student student = new Student(rollNo, name, email, age);
        StudentDAO dao = new StudentDAO();
        dao.addStudent(student);

        response.sendRedirect("viewStudents.jsp");
        return;
    }
%>

    <h2>Add Student</h2>
    <form action="addStudent.jsp" method="post">
        Roll No: <input type="number" name="rollNo" required><br><br>
        Name: <input type="text" name="name" required><br><br>
        Email: <input type="email" name="email" required><br><br>
        Age: <input type="number" name="age" required><br><br>
        <input type="submit" value="Add Student">
    </form>
    <br>
    <a href="viewStudents.jsp">Back to List</a>
</body>
</html>
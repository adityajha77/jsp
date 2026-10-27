

<%@ page import="java.util.List, com.studentcrud.Student, com.studentcrud.StudentDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Students</title>
</head>
<body>
    <h2>Student Records</h2>
    <a href="addStudent.jsp">+ Add New Student</a><br><br>

    <table border="1" cellpadding="8" cellspacing="0">
        <tr bgcolor="#f0f0f0">
            <th>Roll No</th>
            <th>Name</th>
            <th>Email</th>
            <th>Age</th>
            <th>Actions</th>
        </tr>
        <%
            StudentDAO dao = new StudentDAO();
            List<Student> students = dao.getAllStudents();
            for (Student s : students) {
        %>
        <tr>
            <td><%= s.getRollNo() %></td>
            <td><%= s.getName() %></td>
            <td><%= s.getEmail() %></td>
            <td><%= s.getAge() %></td>
            <td>
                <a href="updateStudent.jsp?rollNo=<%= s.getRollNo() %>">Edit</a> |
                <a href="deleteStudent.jsp?rollNo=<%= s.getRollNo() %>" 
                   onclick="return confirm('Delete student <%= s.getRollNo() %>?');">Delete</a>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
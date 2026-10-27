<%@ page import="com.studentcrud.Student, com.studentcrud.StudentDAO" %>
<!DOCTYPE html>
<html>
<head>
    <title>Update Student</title>
</head>
<body>
<%
    StudentDAO dao = new StudentDAO();
    int rollNo = Integer.parseInt(request.getParameter("rollNo"));

    // 1. If form is submitted (POST), update the student and redirect[span_3](start_span)[span_3](end_span)
    if ("POST".equalsIgnoreCase(request.getMethod())) {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        int age = Integer.parseInt(request.getParameter("age"));

        Student student = new Student(rollNo, name, email, age);
        dao.updateStudent(student);

        response.sendRedirect("viewStudents.jsp");
        return;
    }

    // 2. Loop through all students to find the matching rollNo (Lab Manual Approach)[span_4](start_span)[span_4](end_span)
    Student s = new Student();
    for (Student student : dao.getAllStudents()) {
        if (student.getRollNo() == rollNo) {
            s = student;
            break;
        }
    }
%>

    <h2>Update Student</h2>
    <form action="updateStudent.jsp" method="post">
        Roll No: <input type="text" name="rollNo" value="<%= s.getRollNo() %>" readonly><br><br>
        Name: <input type="text" name="name" value="<%= s.getName() %>" required><br><br>
        Email: <input type="email" name="email" value="<%= s.getEmail() %>" required><br><br>
        Age: <input type="number" name="age" value="<%= s.getAge() %>" required><br><br>
        <input type="submit" value="Update Student">
    </form>
    <br>
    <a href="viewStudents.jsp">Back to List</a>
</body>
</html>
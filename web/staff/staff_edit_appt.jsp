<%-- 
    Document   : financial_doctor
    Created on : Mar 23, 2014, 2:22:16 PM
    Author     : cynthiachoi
--%>

<%@page import="java.util.List"%>
<%@page import="ece356.Members.Doctor"%>
<%@page import="ece356.Members.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
        <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap-theme.min.css">
        <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <script src="/scripts/jquery.min.js"></script>
        <script src="/bootstrap/js/bootstrap.min.js"></script>
        
        <div class="page-header">
            <h1>Staff Department</h1>
            <span class="label label-default">Freedom is how big your wallet is</span><hr>
            <div class="well well-small">Welcome! ${name}
            <a href="/ece356/Logout">Logout</a>
            </div>            
        </div>
        
        <h3>Editing Appointmnet</h3>
        
        <form method="post" action="StaffServlet">
        <% Appointment a = (Appointment)request.getAttribute("appointment"); %>
        <input type="hidden" name="apptId" value="<%= a.getApptId() %>">
        <input type="hidden" name="doctors" value="<%= request.getParameter("doctors") %>">
        <input type="hidden" name="apptTime" value="<%= request.getParameter("apptTime") %>">
        <input type="hidden" name="requestType" value="7">
            Patient:       <input type="text" name="patient" value="<%= a.getPatientName() %>"><br>
            Doctor:        <select name="doctor"><% List<Doctor> doctors = (List<Doctor>)getServletContext().getAttribute("doctorlist"); %>
                            <% for (Doctor d : doctors) { 
                                    if (d.getName().equals(a.getDoctorName())) { %>
                                        <option value="<%= d.getDoctorId() %>" selected><%= d.getName() %></option>
                                 <% } else { %>
                                        <option value="<%= d.getDoctorId() %>"><%= d.getName() %></option>
                                 <% } 
                               } %>
                            </select><br>
            Room Number:   <input type="text" name="room" value="<%= a.getRoomNumber() %>"><br>
            Time:            <input type="text" name="time" value="<%= a.getApptDate() %>"><br>
            Type:            <input type="text" name="type" value="<%= a.getApptType() %>"><br>
            Active (0 - no, 1 - yes): <input type="text" name="active" value="<%= a.getActive() %>"><br>
            <input type="submit" value="Submit Changes">
        </form>
    </body>
</html>
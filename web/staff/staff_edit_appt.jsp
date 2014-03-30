<%-- 
    Document   : financial_doctor
    Created on : Mar 23, 2014, 2:22:16 PM
    Author     : cynthiachoi
--%>

<%@page import="ece356.Members.Appointment"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    </head>
    <body>
        <h3>Editing Appointmnet</h3>
        <form method="post" action="StaffServlet">
        <% Appointment a = (Appointment)request.getAttribute("appointment"); %>
        <input type="hidden" name="apptId" value="<%= a.getApptId() %>">
        <input type="hidden" name="doctors" value="<%= request.getParameter("doctors") %>">
        <input type="hidden" name="apptTime" value="<%= request.getParameter("apptTime") %>">
        <input type="hidden" name="requestType" value="7">
            Patient:       <input type="text" name="patient" value="<%= a.getPatientName() %>"><br>
            Doctor:        <input type="text" name="doctor" value="<%= a.getDoctorName() %>"><br>
            Room Number:   <input type="text" name="room" value="<%= a.getRoomNumber() %>"><br>
            Time:            <input type="text" name="time" value="<%= a.getApptDate() %>"><br>
            Type:            <input type="text" name="type" value="<%= a.getApptType() %>"><br>
            Active (0 - no, 1 - yes): <input type="text" name="active" value="<%= a.getActive() %>"><br>
            <input type="submit" value="Submit Changes">
        </form>
    </body>
</html>
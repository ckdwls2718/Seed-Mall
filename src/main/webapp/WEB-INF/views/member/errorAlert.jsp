<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isErrorPage="true" %>
<%-- isErrorPage="true"를 주자 --%>
<%
	response.setStatus(200);
%>
<script>
	alert('<%=exception.getMessage()%>')
	history.back();
</script>
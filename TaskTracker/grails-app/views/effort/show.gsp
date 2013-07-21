
<%@ page import="process.Effort" %>
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'effort.label', default: 'Effort')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>
</head>

<body>

<section id="show-effort" class="first">

	<table class="table">
		<tbody>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effort.actualStartDate.label" default="Actual Start Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${effortInstance?.actualStartDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effort.actualEndDate.label" default="Actual End Date" /></td>
				
				<td valign="top" class="value"><g:formatDate date="${effortInstance?.actualEndDate}" /></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effort.phase.label" default="Phase" /></td>
				
				<td valign="top" class="value">${fieldValue(bean: effortInstance, field: "phase")}</td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effort.task.label" default="Task" /></td>
				
				<td valign="top" class="value"><g:link controller="task" action="show" id="${effortInstance?.task?.id}">${effortInstance?.task?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
			<tr class="prop">
				<td valign="top" class="name"><g:message code="effort.teamMember.label" default="Team Member" /></td>
				
				<td valign="top" class="value"><g:link controller="teamMember" action="show" id="${effortInstance?.teamMember?.id}">${effortInstance?.teamMember?.encodeAsHTML()}</g:link></td>
				
			</tr>
		
		</tbody>
	</table>
</section>

</body>

</html>

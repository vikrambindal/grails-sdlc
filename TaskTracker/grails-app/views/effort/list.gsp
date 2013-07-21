
<%@ page import="process.Effort" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'effort.label', default: 'Effort')}" />
	<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>

<body>
	
<section id="list-effort" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="actualStartDate" title="${message(code: 'effort.actualStartDate.label', default: 'Actual Start Date')}" />
			
				<g:sortableColumn property="actualEndDate" title="${message(code: 'effort.actualEndDate.label', default: 'Actual End Date')}" />
			
				<g:sortableColumn property="phase" title="${message(code: 'effort.phase.label', default: 'Phase')}" />
			
				<th><g:message code="effort.task.label" default="Task" /></th>
			
				<th><g:message code="effort.teamMember.label" default="Team Member" /></th>
			
			</tr>
		</thead>
		<tbody>
		<g:each in="${effortInstanceList}" status="i" var="effortInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${effortInstance.id}">${fieldValue(bean: effortInstance, field: "actualStartDate")}</g:link></td>
			
				<td><g:formatDate date="${effortInstance.actualEndDate}" /></td>
			
				<td>${fieldValue(bean: effortInstance, field: "phase")}</td>
			
				<td>${fieldValue(bean: effortInstance, field: "task")}</td>
			
				<td>${fieldValue(bean: effortInstance, field: "teamMember")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${effortInstanceTotal}" />
	</div>
</section>

</body>

</html>

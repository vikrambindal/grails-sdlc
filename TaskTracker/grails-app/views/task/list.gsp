
<%@ page import="process.Task" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="projectContent" />
	<g:set var="entityName" value="${message(code: 'task.label', default: 'Task')}" />
</head>

<body>
	<section id="list-task" class="first">

	<table class="table table-bordered">
		<thead>
			<tr>
			
				<g:sortableColumn property="taskId" title="${message(code: 'task.taskId.label', default: 'Task Id')}" />
				<g:sortableColumn property="taskName" title="${message(code: 'task.taskName.label', default: 'Task Name')}" />
				<g:sortableColumn property="plannedStartDate" title="${message(code: 'task.plannedStartDate.label', default: 'Planned Start Date')}" />
				<g:sortableColumn property="plannedEndDate" title="${message(code: 'task.plannedEndDate.label', default: 'Planned End Date')}" />
							
			</tr>
		</thead>
		<tbody>
		<g:each in="${taskInstanceList}" status="i" var="taskInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><g:link action="show" id="${taskInstance.id}">${fieldValue(bean: taskInstance, field: "taskId")}</g:link></td>
				<td>${fieldValue(bean: taskInstance, field: "taskName")}</td>
				<td><g:formatDate date="${taskInstance.plannedStartDate}" /></td>
				<td><g:formatDate date="${taskInstance.plannedEndDate}" /></td>
							
			</tr>
		</g:each>
		</tbody>
	</table>
	<div class="pagination">
		<bs:paginate total="${taskInstanceTotal}" />
	</div>
</section>

</body>

</html>

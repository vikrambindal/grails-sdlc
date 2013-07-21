
<%@ page import="process.TeamMember" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="projectContent" />
	<g:set var="entityName" value="${message(code: 'teamMember.label', default: 'TeamMember')}" />
</head>

<body>
	
	<table class="table table-bordered">
			<thead>
				<tr>
					<g:sortableColumn property="soeId" title="${message(code: 'teamMember.soeId.label', default: 'KIN ID')}" />
					<g:sortableColumn property="name" title="${message(code: 'teamMember.name.label', default: 'NAME')}" />
					<g:sortableColumn property="role" title="${message(code: 'teamMember.role.label', default: 'ROLE')}" />
					<g:sortableColumn property="email" title="${message(code: 'teamMember.email.label', default: 'E-MAIL')}" />
				</tr>
			</thead>
			<tbody>
				<g:each in="${teamMemberInstanceList}" status="i" var="teamMemberInstance">
					<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
					
						<td>${fieldValue(bean: teamMemberInstance, field: "soeId")}</td>
						<td><g:link action="show" controller="teamMember" id="${teamMemberInstance.id}">${fieldValue(bean: teamMemberInstance, field: "name")}</g:link></td>
						<td>${fieldValue(bean: teamMemberInstance, field: "role")}</td>
						<td>${fieldValue(bean: teamMemberInstance, field: "email")}</td>
					
					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<bs:paginate total="${teamMemberInstanceTotal}" />
		</div>

</body>

</html>

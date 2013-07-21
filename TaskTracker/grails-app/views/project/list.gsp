
<%@ page import="process.Project" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
	<title>Project</title>
</head>

<body>
	
	<table class="table">
		<tbody>
		<g:each in="${projectInstanceList}" status="i" var="projectInstance">
			<tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
			
				<td><b>Code:</b></td>
				<td>${fieldValue(bean: projectInstance, field: "code")}</td>
				<td><b>Name:</b></td>
				<td>${fieldValue(bean: projectInstance, field: "name")}</td>
			
			</tr>
		</g:each>
		</tbody>
	</table>
	<ul id="Menu" class="nav nav-pills">

		<g:set var="entityName" value="Team Member" />
		
		<li class="${ params.action == "list" ? 'active' : '' }">
			<a href="${createLink(action:'list',controller:'teamMember')}" target="appBodyFrame"><i class="icon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></a>
		</li>
		<li class="${ params.action == "create" ? 'active' : '' }">
			<a href="${createLink(action:'create',controller:'teamMember')}" target="appBodyFrame"><i class="icon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></a>
		</li>
		
	</ul>
	<div id="appBody">
            <iframe name="appBodyFrame" id="appBodyFrame" frameborder="0"
                    width="100%" height="500" src="${createLink(action:'index',controller:'teamMember')}"/>
    </div>

</body>

</html>

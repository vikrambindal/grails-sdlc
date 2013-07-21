
<%@ page import="process.Project" %>
<!doctype html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="kickstart" />
	<g:set var="entityName" value="${message(code: 'project.label', default: 'Project')}" />
	<title>Task Tracker</title>
</head>

<body>
	
	<ul id="Menu" class="nav nav-pills">

		<g:set var="entityName" value="Task" />
		
		<li class="${ params.action == "list" || params.action == "index" ? 'active' : '' }">
			<a href="${createLink(action:'list',controller:'task')}" target="taskBodyFrame"><i class="icon-th-list"></i> <g:message code="default.list.label" args="[entityName]"/></a>
		</li>
		<li class="${ params.action == "create" ? 'active' : '' }">
			<a href="${createLink(action:'create',controller:'task')}" target="taskBodyFrame"><i class="icon-plus"></i> <g:message code="default.new.label"  args="[entityName]"/></a>
		</li>
		
	</ul>
	<div id="appBody">
            <iframe name="taskBodyFrame" id="appBodyFrame" frameborder="0"
                    width="100%" height="500" src="${createLink(action:'list',controller:'task')}"/>
    </div>

</body>

</html>

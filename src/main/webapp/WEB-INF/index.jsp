<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="/css/style.css" />
<title>Gold</title>
</head>
<body>
	<div class="container">
		<div class="gold">
			<h2>Your Gold:</h2>
			<h2 class="count"><c:out value="${gold}"/></h2>
			<h2><a href="/reset">Reset</a></h2>
		</div>
	
		<div class="findGold">
			<div class="box">
				<h2>Farm</h2>
				<h2>(Earns 10-20 Gold)</h2>
				<form action="/process">
				<input type="hidden" name="chance" value="1" />
				<input type="hidden" name="location" value="farm" />
				<input type="hidden" name="goldMin" value="10" />
				<input type="hidden" name="goldMax" value="20" />
				<button>Find Gold!</button>
				</form>
			</div>
			<div class="box">
				<h2>Cave</h2>
				<h2>(Earns 5-10 Gold)</h2>
				<form action="/process">
				<input type="hidden" name="chance" value="1" />
				<input type="hidden" name="location" value="cave" />
				<input type="hidden" name="goldMin" value="5" />
				<input type="hidden" name="goldMax" value="10" />
				<button>Find Gold!</button>
				</form>
			</div>
			<div class="box">
				<h2>House</h2>
				<h2>(Earns 2-5 Gold)</h2>
				<form action="/process">
				<input type="hidden" name="chance" value="1" />
				<input type="hidden" name="location" value="house" />
				<input type="hidden" name="goldMin" value="2" />
				<input type="hidden" name="goldMax" value="5" />
				<button>Find Gold!</button>
				</form>
			</div>
			<div class="box">
				<h2>Quest</h2>
				<h2>(Earns/Takes 0-50 Gold)</h2>
				<form action="/process">
				<input type="hidden" name="chance" value="2" />
				<input type="hidden" name="location" value="quest" />
				<input type="hidden" name="goldMin" value="0" />
				<input type="hidden" name="goldMax" value="50" />
				<button>Find Gold!</button>
				</form>
			</div>
		</div>
		<h2>Activities:</h2>
		<div class="activities">
		<c:forEach var="oneMessage" items="${logs}">
			<c:if test="${fn:contains(oneMessage, 'earned')}">
				<p class="complete"><c:out value="${oneMessage}"/></p>
			</c:if>
			<c:if test="${fn:contains(oneMessage, 'lost')}">
				<p class="failed"><c:out value="${oneMessage}"/></p>
			</c:if>
		</c:forEach>
		</div>
	</div>
</body>
</html>
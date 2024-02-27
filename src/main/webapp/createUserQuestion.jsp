<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Ask a Question</title>
</head>
<body>
	<button onclick="window.location.href='userAccount.jsp';">Back to Dashboard</button>
		<h2>Ask a Question</h2>
		<h4>BuyMe is always here to help!</h4>
		<form action="checkUserQuestion.jsp" method="POST">
			<textarea style="font-size: 12pt" rows="1" cols="60" maxlength="250"
				name="question" placeholder = 'Enter your question'></textarea>
			<br> <input type="submit" value="Submit">
		</form>
	<h2>
		<h4>Find more help below:</h4>
		<a href="allQuestions.jsp">All Questions</a><br>
		<a href="searchQuestions.jsp">Search for a Question</a><br>
	</h2>
</body>
</html>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
    <title>Main</title>
</head>
<body class="text-white bg-dark">
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<div class="position-relative text-center" style="background: url(images/bg.png) no-repeat 0px 0px;">
    <div class="mx-auto my-1">
        <h3 class="display-12 fw-normal">JWD Shop</h3>
        <p class="lead fw-normal"><fmt:message bundle="${loc}" key="language.mainPrint"/></p>
    </div>
    <div class="position-relative text-center bg-light">
        <p><img src="images/noutbuk_klaviatura_tehnika_181211_3840x216.jpg" width="100%" height="76%"</p>

        <jsp:include page="blocks/footer.jsp"></jsp:include>
</body>

</html>

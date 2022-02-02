
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="/WEB-INF/tld/Author.tld" prefix="myTag" %>

<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<footer class="bg-dark" style="position: fixed; left: 0; bottom: 0; width: 100%; text-align: center;">
   <ul class="nav justify-content-center">
   </ul>
   <font color ="white">
      <center>
         <myTag:author year="2022" author="Artem Novik"/>
      </center>
   </font>
</footer>
<body>
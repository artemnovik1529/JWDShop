<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
    <title>Statistic</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
</head>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2" style="margin-left: 28px"><fmt:message bundle="${loc}" key="language.stat"/></h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <h4> <p> <font color = black style="margin-left: 28px">   <fmt:message bundle="${loc}" key="language.salesQuantity"/> </ font> </p></h4>
    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th>  <fmt:message bundle="${loc}" key="language.title"/>   </th>
                <th>  <fmt:message bundle="${loc}" key="language.description"/>  </th>
                <th>  <fmt:message bundle="${loc}" key="language.price"/>  </th>
                <th>  <fmt:message bundle="${loc}" key="language.salesQuantity"/></th>
            </tr>
            <c:forEach var="product" items="${products}">
                <tr>
                    <td><c:out value="${product.name}" /></td>
                    <td><c:out value="${product.description}"/></td>
                    <td><c:out value="${product.price}" /></td>
                    <td>
                        <c:forEach var="item" items="${items}">
                            <c:if test="${product.id == item.productId}">
                                <c:out value="${item.quantity}" />
                            </c:if>
                        </c:forEach>
                    </td>
                </tr>
            </c:forEach>
            </thead>
        </table>
    </div>
    </div>
</main>
</div>
</div>
<div class="col-md-10 p-lg-2 mx-auto my-0">
    <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop?command=go_to_profile"> <-   <fmt:message bundle="${loc}" key="language.account"/> </a>
</div>
</div>
</body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
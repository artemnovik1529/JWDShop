<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
    <title>Orders</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
</head>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2" style="margin-left: 28px"><fmt:message bundle="${loc}" key="language.orders"/></h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <h4> <p> <font color = black style="margin-left: 28px">  <fmt:message bundle="${loc}" key="language.bought"/> </ font> </p></h4>
    <div class="table-responsive">
        <table class="table table-striped table-sm">
            <thead style="vertical-align: baseline">
            <tr>
                <th>№</th>
                <th><fmt:message bundle="${loc}" key="language.cost"/></th>
                <th><fmt:message bundle="${loc}" key="language.date"/></th>
                <th><fmt:message bundle="${loc}" key="language.status"/></th>
                <th></th>
                <th></th>

            </tr>
            <c:forEach var="order" items="${orders}">
                <tr>
                <td><c:out value="${order.id}" /></td>
                <td><c:out value="${order.price}"/></td>
                <td><c:out value="${order.orderDate}"/></td>
                <td><c:if test="${order.status == 'true'}"> <fmt:message bundle="${loc}" key="language.statusPayFirst"/></c:if>
                    <c:if test="${order.status == 'false'}"> <fmt:message bundle="${loc}" key="language.statusPaySecond"/></c:if></td>
                <td><a href="shop?command=about_order&id_order=${order.id}&page=${requestScope['page']}" class="nav-link active" style="color: orange"> <fmt:message bundle="${loc}" key="language.more"/></a></td>
                <td><c:if test="${(about != null) && (order.id == id_order)}">
                <tr>
                    <th></th>
                    <th><fmt:message bundle="${loc}" key="language.product"/></th>
                    <th><fmt:message bundle="${loc}" key="language.description"/></th>
                    <th><fmt:message bundle="${loc}" key="language.price"/></th>
                </tr>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td><c:out value="${order.id}" /></</td>
                        <td><c:out value="${product.name}" /></td>
                        <td><c:out value="${product.description}"/></td>
                        <td><c:out value="${product.price}" /><td>
                        <td></td>
                    </tr>
                </c:forEach>
            </c:if></td>
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
<nav aria-label="pagination">
    <ul class="pagination justify-content-center">
        <c:if test="${requestScope['page']>1}">
            <li class="page-item">
                <a class="page-link" style="color: gray" href="shop?command=order_history&page=${requestScope['page']-1}" >Previous</a>
            </li>
        </c:if>
        <li class="page-item"><a class="page-link" style="color: gray" href="shop?command=order_history&page=1">1</a></li>
        <li class="page-item"><a class="page-link" style="color: gray" href="shop?command=order_history&page=2">2</a></li>
        <c:if test="${requestScope['page']<2}">
            <li class="page-item">
                <a class="page-link" style="color: gray" href="shop?command=order_history&page=${requestScope['page']+1}">Next</a>
            </li>
        </c:if>
    </ul>
</nav>
</div>
</body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
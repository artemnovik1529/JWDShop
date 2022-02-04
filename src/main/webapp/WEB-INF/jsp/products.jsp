<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
    <title>Products</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
</head>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">

        <c:if test="${action}" >
            <script type="text/javascript">
                alert("<fmt:message bundle="${loc}" key="language.addToCart"/>");
            </script>
        </c:if>

        <h1 class="h2" style="margin-left: 28px"><fmt:message bundle="${loc}" key="language.products"/></h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>

    <div class="table-responsive">
        <table class="table">
            <thead>
            <tr>
                <th></th>
                <th><fmt:message bundle="${loc}" key="language.title"/></th>
                <th><fmt:message bundle="${loc}" key="language.description"/></th>
                <th><fmt:message bundle="${loc}" key="language.price"/></th>
                <th><fmt:message bundle="${loc}" key="language.specification"/></th>
                <th></th>
                <th></th>
                <th></th>
                <th></th>
            </tr>
            <c:forEach var="product" items="${products}">
            <tr>
                <td> <img src="images/os-apple-dark_icon-icons.com_50847.ico" width="45" height="45"></td>
                <td><c:out value="${product.name}" /></td>
                <td><c:out value="${product.description}"/></td>
                <td><c:out value="${product.price}" /></td>
                <td><a href="shop?command=about_product&id_product=${product.id}&page=${requestScope['page']}" class="nav-link active" style="color: orange"><fmt:message bundle="${loc}" key="language.more"/></a>
                </td>
                <td><c:if test="${(sessionScope.role.name == 'customer') && (customer != null)}">
                <td><a href="shop?command=add_to_order&id=${product.id}&page=${requestScope['page']}" class="nav-link active" style="color: orange"> <fmt:message bundle="${loc}" key="language.addToOrder"/></a></c:if></td>
                <td><c:if test="${sessionScope.role.name == 'admin'}">
                    <a href="shop?command=go_to_edit_product&id=${product.id}&name=${product.name}&description=${product.description}&price=${product.price}" class="nav-link active" style="color: orange"><fmt:message bundle="${loc}" key="language.correct"/></a></c:if></td>
                <td width="650"><c:if test="${(specification != null) && (product.id == id_product)}">
                    <c:out value="${specification}" />  </c:if></td>
                </c:forEach>
            </tr>
            </thead>
        </table>
        <nav aria-label="pagination">
            <ul class="pagination justify-content-center">
                <c:if test="${requestScope['page']>1}">
                    <li class="page-item">
                        <a class="page-link" href="shop?command=show_products&page=${requestScope['page']-1}">Previous</a>
                    </li>
                </c:if>
                <li class="page-item"><a class="page-link" style="color: gray" href="shop?command=show_products&page=1">1</a></li>
                <li class="page-item"><a class="page-link" style="color: gray" href="shop?command=show_products&page=2">2</a></li>
                <c:if test="${requestScope['page']<2}">
                    <li class="page-item">
                        <a class="page-link" style="color: gray" href="shop?command=show_products&page=${requestScope['page']+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</main>
</body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>

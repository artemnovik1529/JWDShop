<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
    <title>Customers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
</head>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<main>
    <div class="d-flex justify-content-between flex-wrap flex-md-nowrap align-items-center pt-3 pb-2 mb-3 border-bottom">
        <h1 class="h2" style="margin-left: 28px"><fmt:message bundle="${loc}" key="language.customers"/></h1>
        <div class="btn-toolbar mb-2 mb-md-0">
        </div>
    </div>
    <div class="table-responsive">
        <div class="table-responsive">
            <table class="table table-striped table-sm">
                <thead style="vertical-align: baseline">
                <tr>
                    <th><fmt:message bundle="${loc}" key="language.id"/></th>
                    <th><fmt:message bundle="${loc}" key="language.fName"/></th>
                    <th><fmt:message bundle="${loc}" key="language.lName"/></th>
                    <th><fmt:message bundle="${loc}" key="language.emailInfo"/></th>
                    <th><fmt:message bundle="${loc}" key="language.phone"/></th>

                </tr>
                <c:forEach var="customer" items="${customers}">
                <tr>
                    <td><c:out value="${customer.id}" /></td>
                    <td><c:out value="${customer.firstName}"/></td>
                    <td><c:out value="${customer.lastName}"/></td>
                    <td><c:out value="${customer.email}"/></td>
                    <td><c:out value="${customer.phoneNumber}"/></td>


                    <form name="block" method="POST" action="shop">
                        <input type="hidden" name="command" value="block"/>
                        <input type="hidden" name="page" value="${requestScope['page']}" />
                        <input type="hidden" name="id" value="${customer.id}" />
                        <td> <c:if test="${!customer.block}">
                            <div class="col-md-5 p-lg-1 mx-auto my-0">
                                <input class="btn btn-outline-secondary" type="submit" value="<fmt:message bundle="${loc}" key="language.block"/>">
                            </div> </td></c:if>
                        <c:if test="${customer.block}">
                            <div class="col-md-5 p-lg-1 mx-auto my-0">
                                <input class="btn btn-danger" type="submit" value="<fmt:message bundle="${loc}" key="language.unblock"/>">
                            </div> </td></c:if>
                    </form>
                </tr>
                </c:forEach>
            </table>
        </div>
        <nav aria-label="pagination">
            <ul class="pagination justify-content-center">
                <c:if test="${requestScope['page']>1}">
                    <li class="page-item">
                        <a class="page-link" href="shop?command=show_customers&page=${requestScope['page']-1}">Previous</a>
                    </li>
                </c:if>
                <li class="page-item"><a class="page-link" style="color: gray" href="shop?command=show_customers&page=1">1</a></li>
                <li class="page-item"><a class="page-link" style="color: gray" href="shop?command=show_customers&page=2">2</a></li>
                <c:if test="${requestScope['page']<2}">
                    <li class="page-item">
                        <a class="page-link" style="color: gray" href="shop?command=show_customers&page=${requestScope['page']+1}">Next</a>
                    </li>
                </c:if>
            </ul>
        </nav>
    </div>
</main>

</body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
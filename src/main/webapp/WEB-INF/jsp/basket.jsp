<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="blocks/header.jsp"></jsp:include>
<head>
   <title>Basket</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
</head>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<c:if test="${products.size() < 1}">
   <h4>
      <font color = "black">
         <fmt:message bundle="${loc}" key="language.emptyBasket"/>
      </ font>
   </h4>
   <h5>
      <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop?command=show_products&page=1">
         <fmt:message bundle="${loc}" key="language.toCatalog"/>
         ->
      </a>
   </h5>
</c:if>
<c:if test="${products.size() > 0}">
<div align="center" class= "bg-white">
   <h3>
      <font color = "black">
         <fmt:message bundle="${loc}" key="language.orderNumber"/>
         №  ${id_order} </ font>
   </h3>
   <div class="table-responsive">
      <div class="table-responsive">
         <table class="table">
            <tr>
               <th><fmt:message bundle="${loc}" key="language.title"/></th>
               <th><fmt:message bundle="${loc}" key="language.description"/></th>
               <th><fmt:message bundle="${loc}" key="language.price"/></th>
               <th></th>
               <th></th>
               <th></th>
            </tr>
            <c:forEach var="product" items="${products}">
               <tr>
                  <td><c:out value="${product.name}" /></td>
                  <td><c:out value="${product.description}"/></td>
                  <td><c:out value="${product.price} BYN" /><td>

                  <c:if test="${(pay == null) && (error == null) && (block == null)}">
                  <td> <a href="shop?command=remove_from_order&product_id=${product.id}" class="btn btn-danger"> <font color = "black"> <fmt:message bundle="${loc}" key="language.removeFrOrder"/> </ font> </a>   <td>
                  </c:if>
               </tr>
            </c:forEach>
            <tr>
               <td><h5><font color = "#082344"><fmt:message bundle="${loc}" key="language.cost"/> ${order_price} BYN </ font></h5><td>
               <td><td>
               <c:if test="${(pay == null) && (error == null) && (block == null)}">
               <td><h4><a href="shop?command=pay_order" class="btn btn-warning"> <fmt:message bundle="${loc}" key="language.pay"/></a></h4></c:if></td>
               <td></td>
               <td></td>
               <td></td>

            </tr>
         </table>
         </c:if>
         </tr>

         <c:if test="${error}">
            <script type="text/javascript">
               alert("<fmt:message bundle="${loc}" key="language.errorBalance"/>");
            </script>
         </c:if>

         <c:if test="${block}">
         <h5>
            <font color = "red">
               <fmt:message bundle="${loc}" key="language.blockMessage"/>
            </ font>
            <h5>
               </c:if>
               </td>

               <c:if test="${pay}">
               <script type="text/javascript">
                  alert("<fmt:message bundle="${loc}" key="language.orderPay"/>");
               </script>
               </c:if>
               <div class="col-md-10 p-lg-2 mx-auto my-0">
                  <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop?command=go_to_profile"> <-   <fmt:message bundle="${loc}" key="language.account"/> </a>
               </div>
      </div>
   </div>
</div>
<div align="center">
</div>
</body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
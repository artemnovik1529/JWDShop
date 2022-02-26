<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
   <title>Profile</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
   <style>
      p {
         padding: 0;
      }
   </style>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<div class= "bg-white">
   <c:if test="${sessionScope.role.name == 'customer'}">
   <h5>
      <ul class="nav justify-content-left border-bottom pb-3 mb-3">
         <li class="nav-item">
            <a href="${pageContext.request.contextPath}/shop?command=order_history&page=1" class="nav-link text-warning" >
               <fmt:message bundle="${loc}" key="language.myOrders"/>
            </a>
         </li>
         <c:if test="${(id_order != null) }">
            <li class="nav-item">
               <a href="shop?command=go_to_basket" class="nav-link text-warning" >
                  <fmt:message bundle="${loc}" key="language.basket"/>
               </a>
            </li>
         </c:if>
      </ul>
      <div class="container">
         <div class="main-body">
            <div class="row gutters-sm">
               <div class="col-md-3 mb-3">
                  <div class="card">
                     <div class="card-body">
                        <div class="d-flex flex-column align-items-center text-center">
                           <img src="images/avatar.jpg"  class="rounded-circle" width="100">
                           <div class="mt-3">
                              <h4>${customer.firstName} ${customer.lastName}</h4>
                           </div>
                        </div>
                     </div>
                  </div>
               </div>
               <div class="col-md-5">
                  <div class="card mb-3">
                     <div class="card-body">
                        <div class="row">
                           <div class="col-sm-3">
                              <h6 class="mb-0 text-secondary">
                                 <fmt:message bundle="${loc}" key="language.fName"/>
                              </h6>
                           </div>
                           <div class="col-sm-9 text-dark">
                                 ${customer.firstName}
                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-sm-3">
                              <h6 class="mb-0 text-secondary">
                                 <fmt:message bundle="${loc}" key="language.lName"/>
                              </h6>
                           </div>
                           <div class="col-sm-9 text-dark">
                                 ${customer.lastName}
                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-sm-3">
                              <h6 class="mb-0 text-secondary">
                                 <fmt:message bundle="${loc}" key="language.emailInfo"/>
                              </h6>
                           </div>
                           <div class="col-sm-9 text-dark">
                                 ${customer.email}
                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-sm-3">
                              <h6 class="mb-0 text-secondary">
                                 <fmt:message bundle="${loc}" key="language.phone"/>
                              </h6>
                           </div>
                           <div class="col-sm-9 text-dark">
                                 ${customer.phoneNumber}
                           </div>
                        </div>
                        <hr>
                        <div class="row">
                           <div class="col-sm-3">
                              <h6 class="mb-0 text-secondary">
                                 <fmt:message bundle="${loc}" key="language.balance"/>
                              </h6>
                           </div>
                           <div class="col-sm-9 text-dark">
                                 ${customer.cardBalance} BYN
                           </div>
                        </div>
                        <hr>
                        <div class="col-md-2 p-lg-1 mx-auto my-2">
                           <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop?command=go_to_edit_prof">
                              <fmt:message bundle="${loc}" key="language.edit"/>
                           </a>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      </ul>
      </c:if>
      <c:if test="${sessionScope.role.name == 'admin'}">
      <h3>
         <p style="margin-left: 28px; margin-bottom: 0rem" >
            <fmt:message bundle="${loc}" key="language.manag"/>
         </p>
      </h3>
      <h5>
         <ul class="nav justify-content-left" style="margin-left: 11px">
            <li class="nav-item">
               <a href="${pageContext.request.contextPath}/shop?command=show_customers&page=1" class="nav-link text-warning">
                  <fmt:message bundle="${loc}" key="language.customers"/>
               </a>
            </li>
            <li class="nav-item">
               <a href="${pageContext.request.contextPath}/shop?command=go_to_add_product" class="nav-link text-warning">
                  <fmt:message bundle="${loc}" key="language.addProduct"/>
               </a>
            </li>
            <li class="nav-item">
               <a href="${pageContext.request.contextPath}/shop?command=show_products&page=1" class="nav-link text-warning">
                  <fmt:message bundle="${loc}" key="language.editProduct"/>
               </a>
            </li>
            <li class="nav-item">
               <a href="${pageContext.request.contextPath}/shop?command=order_history&page=1" class="nav-link text-warning">
                  <fmt:message bundle="${loc}" key="language.orders"/>
               </a>
            </li>
            <li class="nav-item">
               <a href="${pageContext.request.contextPath}/shop?command=go_to_stat" class="nav-link text-warning">
                  <fmt:message bundle="${loc}" key="language.stat"/>
               </a>
            </li>
         </ul>
         <div class="position-relative text-center bg-light">
            <p><img src="images/klaviatura_telefon_rabochij_stol_179668_3840x216.jpg" height="77.5%" width="100%"></p>
         </div>
         </c:if>
</div>
</body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
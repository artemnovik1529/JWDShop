
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
   <jsp:include page ="blocks/header.jsp"></jsp:include>
   <title>Add customer</title>
   <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
   <style>
      table {
         padding: 0;
         margin-left: 450px;
      }
      p {
         padding: 0;
         margin-left: 350px;
      }
   </style>
</head>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<div class= "bg-white">
   <div class="container" >
      <c:if test="${error}">
         <h5>
            <p>
               <font color = "red">
                  <fmt:message bundle="${loc}" key="language.invalidData"/>
               </ font>
            <p>
         </h5>
      </c:if>
      <h3>
         <p>
            <font color = black">
               <fmt:message bundle="${loc}" key="language.addInfo"/>
            </ font>
         </p>
      </h3>
      <form name="editProfile" method="POST" action="shop">
         <input type="hidden" name="command" value="add_customer"/>
         <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
            <div class="card h-60">
               <div class="card-body">
                  <div class="row gutters">
                     <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                        <h6 class="mb-2 text-black">
                           <fmt:message bundle="${loc}" key="language.personalInfo"/>
                        </h6>
                     </div>
                     <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                           <label for="firstName" style="color: gray">
                              <fmt:message bundle="${loc}" key="language.fName"/>
                           </label>
                           <input type="text" class="form-control" name="first_name" required placeholder="
                                 <fmt:message bundle="${loc}" key="language.enterFName"/>
                                 ">
                        </div>
                     </div>
                     <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                           <label for="lastName" style="color: gray">
                              <fmt:message bundle="${loc}" key="language.lName"/>
                           </label>
                           <input type="text" class="form-control" name="last_name" required placeholder="
                                 <fmt:message bundle="${loc}" key="language.enterLName"/>
                                 ">
                        </div>
                     </div>
                     <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                           <label for="balance" style="color: gray">
                              <fmt:message bundle="${loc}" key="language.balance"/>
                           </label>
                           <input type="text" class="form-control" name="card_balance" required placeholder="
                                 <fmt:message bundle="${loc}" key="language.enterBalance"/>
                                 ">
                        </div>
                     </div>
                     <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                           <label for="eMail" style="color: gray">
                              <fmt:message bundle="${loc}" key="language.emailInfo"/>
                           </label>
                           <input type="text" class="form-control" name="email" required placeholder="
                                 <fmt:message bundle="${loc}" key="language.enterEmail"/>
                                 ">
                        </div>
                     </div>
                     <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
                        <div class="form-group">
                           <label for="phone" style="color: gray">
                              <fmt:message bundle="${loc}" key="language.phone"/>
                           </label>
                           <input type="text" class="form-control" name="phone_number" required placeholder="
                           <fmt:message bundle="${loc}" key="language.enterPhone"/>
                                 ">
                        </div>
                     </div>
                  </div>
               </div>
            </div>
            <div class="col-md-1 p-lg-2 mx-auto my-3">
               <input class="btn btn-warning" type="submit" value="
                     <fmt:message bundle="${loc}" key="language.save"/>
                     ">
            </div>
         </div>
   </div>
   </form>
   <div class="col-md-10 p-lg-2 mx-auto my-0">
      <a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop?command=go_to_profile">
         <fmt:message bundle="${loc}" key="language.addLater"/>
      </a>
   </div>
</div>
<body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
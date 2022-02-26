<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<div th:fragment = "header">
   <header class="bg-dark" style="padding: 8px">
      <div class="header-panel">
         <div class="d-flex align-items-center">
            <ul class="nav col-lg-auto me-lg-auto justify-content-center mb-md-0">
               <li><a href="shop" class="d-flex bg-dark align-items-center mb-3 mb-md-0 me-md-auto text-light text-decoration-none">
                  <svg xmlns="http://www.w3.org/2000/svg" width="28" height="28" fill="currentColor" class="bi bi-cart3" viewBox="0 0 18 18" style="margin-left: 20px">
                     <path d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .49.598l-1 5a.5.5 0 0 1-.465.401l-9.397.472L4.415 11H13a.5.5 0 0 1 0 1H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l.84 4.479 9.144-.459L13.89 4H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 1 0 2 1 1 0 0 1 0-2zm7 0a1 1 0 1 1 0 2 1 1 0 0 1 0-2z"/>
                  </svg>
                  <use xlink:href="#bootstrap"></use>
                  </svg>
                  <span class="fs-4"> JWD Shop </span>
               </a></li>

               <li><a href="${pageContext.request.contextPath}/shop?command=show_products&page=1" class="nav-link px-2 text-white" style="margin-left: 5px">
                  <fmt:message bundle="${loc}" key="language.catalog"/>
                  <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-shop" viewBox="0 1 17 17">
                     <path d="M2.97 1.35A1 1 0 0 1 3.73 1h8.54a1 1 0 0 1 .76.35l2.609 3.044A1.5 1.5 0 0 1 16 5.37v.255a2.375 2.375 0 0 1-4.25 1.458A2.371 2.371 0 0 1 9.875 8 2.37 2.37 0 0 1 8 7.083 2.37 2.37 0 0 1 6.125 8a2.37 2.37 0 0 1-1.875-.917A2.375 2.375 0 0 1 0 5.625V5.37a1.5 1.5 0 0 1 .361-.976l2.61-3.045zm1.78 4.275a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0 1.375 1.375 0 1 0 2.75 0V5.37a.5.5 0 0 0-.12-.325L12.27 2H3.73L1.12 5.045A.5.5 0 0 0 1 5.37v.255a1.375 1.375 0 0 0 2.75 0 .5.5 0 0 1 1 0zM1.5 8.5A.5.5 0 0 1 2 9v6h1v-5a1 1 0 0 1 1-1h3a1 1 0 0 1 1 1v5h6V9a.5.5 0 0 1 1 0v6h.5a.5.5 0 0 1 0 1H.5a.5.5 0 0 1 0-1H1V9a.5.5 0 0 1 .5-.5zM4 15h3v-5H4v5zm5-5a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-2a1 1 0 0 1-1-1v-3zm3 0h-2v3h2v-3z"/>
                  </svg>
               </a></li>
               <li><a href="shop?command=about" class="nav-link px-2 text-white" style="margin-left: 5px">
                  <fmt:message bundle="${loc}" key="language.about"/>
                  <svg xmlns="http://www.w3.org/2000/svg" width="17" height="17" fill="currentColor" class="bi bi-question-octagon" viewBox="0 0.2 17 17">
                     <path d="M4.54.146A.5.5 0 0 1 4.893 0h6.214a.5.5 0 0 1 .353.146l4.394 4.394a.5.5 0 0 1 .146.353v6.214a.5.5 0 0 1-.146.353l-4.394 4.394a.5.5 0 0 1-.353.146H4.893a.5.5 0 0 1-.353-.146L.146 11.46A.5.5 0 0 1 0 11.107V4.893a.5.5 0 0 1 .146-.353L4.54.146zM5.1 1 1 5.1v5.8L5.1 15h5.8l4.1-4.1V5.1L10.9 1H5.1z"/>
                     <path d="M5.255 5.786a.237.237 0 0 0 .241.247h.825c.138 0 .248-.113.266-.25.09-.656.54-1.134 1.342-1.134.686 0 1.314.343 1.314 1.168 0 .635-.374.927-.965 1.371-.673.489-1.206 1.06-1.168 1.987l.003.217a.25.25 0 0 0 .25.246h.811a.25.25 0 0 0 .25-.25v-.105c0-.718.273-.927 1.01-1.486.609-.463 1.244-.977 1.244-2.056 0-1.511-1.276-2.241-2.673-2.241-1.267 0-2.655.59-2.75 2.286zm1.557 5.763c0 .533.425.927 1.01.927.609 0 1.028-.394 1.028-.927 0-.552-.42-.94-1.029-.94-.584 0-1.009.388-1.009.94z"/>
                  </svg>
               </a></li>
               <li>
                  <c:if test="${sessionScope.role.name != 'unknown'}">
                  <a href="shop?command=go_to_profile" class="nav-link px-2 text-white">
                     <fmt:message bundle="${loc}" key="language.account"/>
                     <svg xmlns="http://www.w3.org/2000/svg" width="17" height="18" fill="currentColor" class="bi bi-person" viewBox="0 1 15 16">
                        <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
                     </svg>
                  </a></li>
               </c:if>
            </ul>

            <div class="text-end">
               <button type="button" class="btn btn-warning" style="padding: 0px"><c:if test="${sessionScope.role.name == 'unknown'}">
                  <a href="shop?command=go_to_login" class="nav-link px-2 text-black">
                     <fmt:message bundle="${loc}" key="language.logIn"/>
                  </a>
               </c:if>
                  <c:if test="${sessionScope.role.name != 'unknown'}">
                     <a href="shop?command=logout" class="nav-link px-2 text-black">
                        <fmt:message bundle="${loc}" key="language.logout"/>
                     </a>
                  </c:if>
               </button>
               <button type="button" class="btn btn-outline-light me-2" style="padding: 0px">
                  <c:if test="${(sessionScope.language == 'ru') && (sessionScope.language != null)}">
                     <a href="${pageContext.request.contextPath}/shop?${pageContext.request.queryString}&locale=en" class="nav-link px-2 text-white">EN</a>
                  </c:if>
                  <c:if test="${sessionScope.language == 'en' && (sessionScope.language != null)}">
                     <a href="${pageContext.request.contextPath}/shop?${pageContext.request.queryString}&locale=ru" class="nav-link px-2 text-white">RU</a>
                  </c:if>
               </button>
            </div>
         </div>
      </div>
   </header>
</div>
</body>
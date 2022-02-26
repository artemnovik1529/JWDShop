<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page ="blocks/header.jsp"></jsp:include>
<head>
	<title>Edit product</title>
	<link rel="stylesheet"  href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">

</head>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<div class= "bg-white">

	<div class="container">


		<c:if test="${error_edit}">
			<h5><p><font color = "red"> <fmt:message bundle="${loc}" key="language.invalidData"/></ font><p></h5>
		</c:if>


		<c:if test="${edit_product}">
			<h5><p><font color = "red"> <fmt:message bundle="${loc}" key="language.updatedProduct"/></ font><p></h5>
		</c:if>


		<c:if test="${remove_product}">
			<h5><p><font color = "red"> <fmt:message bundle="${loc}" key="language.removeMessage"/></ font><p></h5>
		</c:if>


		<h3> <p><font color = "black" ><fmt:message bundle="${loc}" key="language.editProduct"/></ font> </p></h3>
		<form name="editProfile" method="POST" action="shop">
			<input type="hidden" name="command" value="edit_product"/>
			<input type="hidden" name="id" value="${product.id}"/>
			<div class="col-xl-7 col-lg-9">
				<div class="card">
					<div class="card-body">
						<div class="row gutters">
							<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
								<h6 class="mb-2 text-primary text-black"><fmt:message bundle="${loc}" key="language.prodInfo"/></h6>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="title" style="color: black"><fmt:message bundle="${loc}" key="language.title"/></label>
									<input type="text" class="form-control" name="name" required value="${product.name}">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="description" style="color: black"><fmt:message bundle="${loc}" key="language.description"/></label>
									<input type="text" class="form-control" name="description" required value="${product.description}">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="price" style="color: black"><fmt:message bundle="${loc}" key="language.price"/></label>
									<input type="text" class="form-control" name="price" required value="${product.price}">
								</div>
							</div>
							<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
								<div class="form-group">
									<label for="specification" style="color: black"><fmt:message bundle="${loc}" key="language.specification"/></label>
									<input type="text" class="form-control" name="specification" required value="${product.specification}">
								</div>
							</div>

						</div>
					</div>
					<c:if test="${(remove_product == null) && (edit_product == null)}">
				</div>
				<div class="col-md-2 p-lg-1 mx-auto my-3 ">
					<input class="btn btn-warning" type="submit" value="<fmt:message bundle="${loc}" key="language.update"/>">
				</div>
			</div>
			</c:if>
	</div>
	</form>
	<c:if test="${(remove_product == null) && (edit_product == null) && (error_edit ==null) }">
		<form name="editProfile" method="POST" action="shop">
			<input type="hidden" name="command" value="delete_product"/>
			<input type="hidden" name="id" value="${product.id}"/>
			<div class="col-md-5 p-lg-1 mx-auto my-3">
				<input class="btn btn-danger" type="submit" value="<fmt:message bundle="${loc}" key="language.delete"/>">
			</div>
		</form>
	</c:if>
	<div class="col-md-10 p-lg-0 mx-auto my-0">
		<a class="btn btn-outline-secondary" href="${pageContext.request.contextPath}/shop?command=go_to_profile"> <fmt:message bundle="${loc}" key="language.cancel"/> </a>
	</div>
</div>
<body>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</html>
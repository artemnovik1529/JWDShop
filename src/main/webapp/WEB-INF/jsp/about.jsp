
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<jsp:include page="blocks/header.jsp"></jsp:include>
<head>
    <title>About</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.2/dist/css/bootstrap.min.css">
</head>
<body>
<fmt:setLocale value="${sessionScope.language}"/>
<fmt:setBundle basename="language" var="loc"/>
<div class="b-page" style="text-align: center">
    <p style="font-size: 22px;margin-right: 5px; margin-left: 5px"><fmt:message bundle="${loc}" key="language.aboutUs"/></p><style>
    .b-advantages {overflow: hidden; margin-top: 20px;}
    .advantages__content{overflow: hidden; color: #4D4D4D; padding-right: 48px; font-size: 20px; text-align: left}
    .advantages__header{margin-bottom: 8px; font-size: 25px; text-align: left}
    .advantages__img {float: left; margin-right: 12px; max-width: 30px; height: 30px; width: 60px !important;}
    .advantages__item {width: 50%; margin-bottom: 36px; float: left; margin-top: 29px}
    .cr-advantages__first {clear:both;}
</style>
    <h2 class="content__header"><fmt:message bundle="${loc}" key="language.tagline"/></h2>

    <ul class="b-advantages" style="list-style-type: none">


        <li class="advantages__item cr-advantages__first">
            <img src="images/choice.ico" class="advantages__img" />
            <h3 class="advantages__header"><fmt:message bundle="${loc}" key="language.choice"/></h3>
            <div class="advantages__content">
                <fmt:message bundle="${loc}" key="language.choiceSecond"/>
            </div>
        </li>

        <li class="advantages__item">
            <img src="images/cost.ico" class="advantages__img" />
            <h3 class="advantages__header"><fmt:message bundle="${loc}" key="language.fairPrices"/></h3>
            <div class="advantages__content">
                <fmt:message bundle="${loc}" key="language.fairPricesSecond"/>
            </div>
        </li>

        <li class="advantages__item cr-advantages__first">
            <img src="images/support.ico" class="advantages__img" />
            <h3 class="advantages__header"> <fmt:message bundle="${loc}" key="language.easyToOrder"/></h3>
            <div class="advantages__content">
                <fmt:message bundle="${loc}" key="language.easyToOrderSecond"/>
            </div>
        </li>

        <li class="advantages__item">
            <img src="images/easyToPay.ico" class="advantages__img" />
            <h3 class="advantages__header"><fmt:message bundle="${loc}" key="language.easyToPay"/></h3>
            <div class="advantages__content">
                <fmt:message bundle="${loc}" key="language.easyToPaySecond"/>
            </div>
        </li>

        <li class="advantages__item cr-advantages__first">
            <img src="images/canRely.ico" class="advantages__img"/>
            <h3 class="advantages__header"><fmt:message bundle="${loc}" key="language.canRely"/></h3>
            <div class="advantages__content">
                <fmt:message bundle="${loc}" key="language.canRelySecond"/>
            </div>
        </li>

        <li class="advantages__item">
            <img src="images/security.ico" class="advantages__img" />
            <h3 class="advantages__header"><fmt:message bundle="${loc}" key="language.productQuality"/></h3>
            <div class="advantages__content">
                <fmt:message bundle="${loc}" key="language.productQualitySecond"/>
            </div>
        </li>


    </ul>
</div>
</div>
<jsp:include page="blocks/footer.jsp"></jsp:include>
</body>
</html>

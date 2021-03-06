package com.epam.jwd.controller.command;


import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.controller.context.ResponseContext;
import com.epam.jwd.dao.Role;
import com.epam.jwd.service.api.OrderService;
import com.epam.jwd.service.dto.OrderDto;
import com.epam.jwd.service.impl.OrderServiceImpl;

import javax.servlet.http.HttpSession;
import static java.util.Objects.nonNull;

public class LogOutCommand implements Command{
    private static final Command INSTANCE = new LogOutCommand();
    private static final String JSP = "WEB-INF/jsp/main.jsp";
    private static final String ID_ATTRIBUTE = "id";
    private static final String CUSTOMER_ATTRIBUTE = "customer";
    private static final String ROLE_ATTRIBUTE = "role";
    private static final String ID_ORDER_ATTRIBUTE = "id_order";
    private static final String LANG_ATTRIBUTE = "language";
    private static final String DEFAULT_LANG = "en";
    private final OrderService orderService = new OrderServiceImpl();
    private static final ResponseContext CONTEXT = new ResponseContext() {
        @Override
        public String getPage() {
            return JSP;
        }

        @Override
        public boolean isRedirect() {
            return false;
        }
    };

    private LogOutCommand(){}

    public static Command getInstance() {
        return INSTANCE;
    }

    @Override
    public ResponseContext execute(RequestContext context) {
        final HttpSession session = context.getSession();
        if(nonNull((session.getAttribute(ID_ORDER_ATTRIBUTE)))){
            long orderId = (long) session.getAttribute(ID_ORDER_ATTRIBUTE);
            OrderDto order = orderService.getById(orderId);
            orderService.delete(order);
        }
        session.removeAttribute(ID_ATTRIBUTE);
        session.removeAttribute(CUSTOMER_ATTRIBUTE);
        session.removeAttribute(LANG_ATTRIBUTE);
        session.invalidate();
        context.getSession().setAttribute(ROLE_ATTRIBUTE, Role.UNKNOWN);
        context.getSession().setAttribute(LANG_ATTRIBUTE, DEFAULT_LANG);
        return CONTEXT;
    }
}

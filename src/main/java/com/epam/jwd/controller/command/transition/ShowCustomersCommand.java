package com.epam.jwd.controller.command.transition;


import com.epam.jwd.controller.command.Command;
import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.controller.context.ResponseContext;
import com.epam.jwd.service.api.CustomerService;
import com.epam.jwd.service.dto.CustomerDto;
import com.epam.jwd.service.impl.CustomerServiceImpl;

import java.util.List;

public class ShowCustomersCommand implements Command {
    private static final Command INSTANCE = new ShowCustomersCommand();
    private static final String JSP = "WEB-INF/jsp/customers.jsp";
    private static final String CUSTOMERS_ATTRIBUTE = "customers";
    private static final String PAGE_PARAMETER= "page";
    private final CustomerService service = new CustomerServiceImpl();
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

    private ShowCustomersCommand(){}

    public static Command getInstance() {
        return INSTANCE;
    }

    @Override
    public ResponseContext execute(RequestContext context) {
        int page = Integer.parseInt(context.getParameter(PAGE_PARAMETER));
        List<CustomerDto> list = service.getRowsForPage(page);
        context.addAttribute(CUSTOMERS_ATTRIBUTE, list);
        context.addAttribute(PAGE_PARAMETER,page);
        return CONTEXT;
    }
}

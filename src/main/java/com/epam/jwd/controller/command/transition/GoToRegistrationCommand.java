package com.epam.jwd.controller.command.transition;


import com.epam.jwd.controller.command.Command;
import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.controller.context.ResponseContext;

public class GoToRegistrationCommand implements Command {
    private static final Command INSTANCE = new GoToRegistrationCommand();
    private static final String JSP = "WEB-INF/jsp/registration.jsp";
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

    private GoToRegistrationCommand(){}

    public static Command getInstance() {
        return INSTANCE;
    }

    @Override
    public ResponseContext execute(RequestContext context) {
        return CONTEXT;

    }
}

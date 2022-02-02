package com.epam.jwd.controller.command.transition;


import com.epam.jwd.controller.command.Command;
import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.controller.context.ResponseContext;
import com.epam.jwd.service.dto.ProductDto;



public class GoToEditProductCommand implements Command {
    private static final Command INSTANCE = new GoToEditProductCommand();
    private static final String JSP = "WEB-INF/jsp/edit_product.jsp";
    private static final String ID_PARAMETER = "id";
    private static final String NAME_PARAMETER = "name";
    private static final String DESCRIPTION_PARAMETER = "description";
    private static final String PRICE_PARAMETER = "price";
    private static final String SPECIFICATION_PARAMETER = "specification";
    private static final String PRODUCT_ATTRIBUTE = "product";
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

    private GoToEditProductCommand(){}

    public static Command getInstance() {
        return INSTANCE;
    }

    @Override
    public ResponseContext execute(RequestContext context) {
        ProductDto product = parseContext(context);
        context.addAttribute(PRODUCT_ATTRIBUTE,product);
        return CONTEXT;
    }

    /**
     * Method to get parameters from request
     *
     * @param context contains request parameters
     * @return ProductDto with filled fields from request
     */
    private ProductDto parseContext(RequestContext context){
        long id = Long.parseLong(context.getParameter(ID_PARAMETER));
        String name = context.getParameter(NAME_PARAMETER);
        String description = context.getParameter(DESCRIPTION_PARAMETER);
        double price = Double.parseDouble(context.getParameter(PRICE_PARAMETER));
        String specification = context.getParameter(SPECIFICATION_PARAMETER);
        return new ProductDto(id,name,description,price,specification);
    }
}

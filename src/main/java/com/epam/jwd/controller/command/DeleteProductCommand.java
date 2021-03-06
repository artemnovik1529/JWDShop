package com.epam.jwd.controller.command;


import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.controller.context.ResponseContext;
import com.epam.jwd.service.api.ProductService;
import com.epam.jwd.service.dto.ProductDto;
import com.epam.jwd.service.impl.ProductServiceImpl;

public class DeleteProductCommand implements Command{
    private static final Command INSTANCE = new DeleteProductCommand();
    private static final String JSP = "WEB-INF/jsp/edit_product.jsp";
    private static final String ID_PARAMETER = "id";
    private static final String ATTRIBUTE = "remove_product";
    private final ProductService service = new ProductServiceImpl();
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

    private DeleteProductCommand(){}

    public static Command getInstance() {
        return INSTANCE;
    }

    @Override
    public ResponseContext execute(RequestContext context) {
        long id = Long.parseLong(context.getParameter(ID_PARAMETER));
        ProductDto product = service.getById(id);
        service.delete(product);
        context.addAttribute(ATTRIBUTE,true);
        return CONTEXT;
    }
}

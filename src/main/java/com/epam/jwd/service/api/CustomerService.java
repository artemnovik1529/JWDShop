package com.epam.jwd.service.api;


import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.service.dto.CustomerDto;

import java.util.List;

public interface CustomerService extends Service<CustomerDto,Long>{

    /**
     * Method for customer validation
     *
     * @param customer contains fields for validation
     * @return result of validation
     */
    boolean isValid(CustomerDto customer);

    /**
     * Method for context validation
     *
     * @param context contains parameters for validation
     * @return result of validation
     */
    boolean isValid(RequestContext context);

    /**
     * Method for getting customers on page
     *
     * @param pageNumber number of page on website
     * @return customer list
     */
    List<CustomerDto> getRowsForPage(int pageNumber);

    /**
     * Method to check for customer information existence
     *
     * @param id key for searching customer
     * @return result of checking
     */
    boolean isInfoExist(long id);
}

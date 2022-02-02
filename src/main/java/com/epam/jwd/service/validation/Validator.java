package com.epam.jwd.service.validation;


import com.epam.jwd.controller.context.RequestContext;

public interface Validator<T> {

    /**
     * Method for context validation
     *
     * @param context contains parameters for validation
     * @return result of validation
     */
    boolean isValid(RequestContext context);

    /**
     * Method for dto validation
     *
     * @param t contains fields for validation
     * @return result of validation
     */
    boolean isValid(T t);
}

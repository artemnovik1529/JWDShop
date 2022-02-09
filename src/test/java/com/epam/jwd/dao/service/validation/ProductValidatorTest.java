package com.epam.jwd.dao.service.validation;


import com.epam.jwd.service.dto.ProductDto;
import com.epam.jwd.service.validation.ProductValidator;
import com.epam.jwd.service.validation.Validator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class ProductValidatorTest {
    private static Validator<ProductDto> validator;
    private static ProductDto product;
    private static final String NAME = "name";
    private static final String DESCRIPTION = "description description description";
    private static final double PRICE = 100.25;

    @BeforeAll
    static void setUp(){
        validator = new ProductValidator();
        product = new ProductDto(NAME,DESCRIPTION,PRICE);
    }

    @Test
    void shouldValidateCustomerFieldsPositive(){
        boolean result = validator.isValid(product);
        Assertions.assertTrue(result);
    }
    @Test
    void shouldValidateCustomerFieldsNegative(){
        product.setPrice(123.12313);
        boolean result = validator.isValid(product);
        Assertions.assertFalse(result);
    }
}


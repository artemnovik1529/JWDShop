package com.epam.jwd.dao.service.validation;


import com.epam.jwd.service.dto.UserDto;
import com.epam.jwd.service.validation.UserValidator;
import com.epam.jwd.service.validation.Validator;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class UserValidatorTest {
    private static Validator<UserDto> validator;
    private static UserDto user;
    private static final String LOGIN_TEST= "testProfile";
    private static final String PASSWORD_TEST = "newPass1800";

    @BeforeAll
    static void setUp(){
        validator = new UserValidator();
        user = new UserDto(LOGIN_TEST,PASSWORD_TEST);
    }

    @Test
    void shouldValidatePasswordAndLoginPositive(){
        boolean result = validator.isValid(user);
        Assertions.assertTrue(result);
    }
    @Test
    void shouldValidatePasswordAndLoginNegative(){
        user.setPassword("t");
        user.setLogin("n");
        boolean result = validator.isValid(user);
        Assertions.assertFalse(result);
    }
}
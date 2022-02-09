package com.epam.jwd.dao.service.impl;


import com.epam.jwd.dao.Role;
import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.exception.ConnectionException;
import com.epam.jwd.service.api.UserService;
import com.epam.jwd.service.dto.UserDto;
import com.epam.jwd.service.impl.UserServiceImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class UserServiceImplTest {
    private static UserDto user;
    private static UserService service;
    private static final String LOGIN_TEST= "testProfile2";
    private static final String PASSWORD_TEST = "b627724c5264acc803c03731faf947cd";

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        service = new UserServiceImpl();
        user = new UserDto(LOGIN_TEST,PASSWORD_TEST);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldReturnRoleByPassword(){
        Role expected = Role.CUSTOMER;
        Role actual = service.getRoleByLogin(user);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldCheckUserExistence(){
        boolean actual = service.isExist(user);
        Assertions.assertTrue(actual);
    }

    @Test
    void shouldCheckUniquenessOfPassword(){
        boolean actual = service.isUniqueLogin(user);
        Assertions.assertFalse(actual);
    }

    @Test
    void shouldReturnUserByLogin(){
        UserDto expected = user;
        user.setId(16);
        user.setRole(Role.CUSTOMER);
        UserDto actual = service.getByLogin(LOGIN_TEST);
        Assertions.assertEquals(expected,actual);
    }
}
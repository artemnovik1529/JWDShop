package com.epam.jwd.dao.impl;


import com.epam.jwd.dao.Role;
import com.epam.jwd.dao.api.UserDao;
import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.entity.User;
import com.epam.jwd.dao.exception.ConnectionException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class UserDaoImplTest {

    private static UserDao dao;
    private static User user;
    private static final int ROLE_ID = 2;
    private static final int ID = 14;
    private static final String LOGIN = "testProfile";
    private static final String PASSWORD = "testProfile";

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        dao = new UserDaoImpl();
        user = new User(ID,ROLE_ID,LOGIN,PASSWORD);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldSaveAndReturnUser(){
        User savedUser = dao.save(user);
        Assertions.assertNotNull(savedUser);
        Assertions.assertEquals(user,savedUser);
    }


    @Test
    void shouldUpdateFieldsInDBForUser(){
        String newPassword = "newPass1800";
        User expected = new User(ID,ROLE_ID,LOGIN,newPassword);
        User actual = dao.update(expected);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldDeleteUserFromDB(){
        boolean actual = dao.delete(user);
        Assertions.assertTrue(actual);
    }

    @Test
    void shouldReturnListOfUsers(){
        int expectedSize = 0;
        int actualSize = dao.findAll().size();
        Assertions.assertNotEquals(expectedSize,actualSize);
    }


    @Test
    void shouldReturnUserRole(){
        Role expected = Role.CUSTOMER;
        Role actual = dao.getRoleByLogin(user);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldCheckUniquenessOfLogin_BeforeSavingNewUser(){
        boolean actual = dao.isUniqueLogin(user);
        Assertions.assertFalse(actual);
    }
}
package com.epam.jwd.dao.impl;

import com.epam.jwd.dao.api.CustomerDao;
import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.entity.Customer;
import com.epam.jwd.dao.exception.ConnectionException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;


class CustomerDaoImplTest {

    private static CustomerDao dao;
    private static Customer customer;
    private static final long ID = 87 ;
    private static final String FIRST_NAME = "NameTest";
    private static final String LAST_NAME = "SurnameTst";
    private static final String EMAIL = "test@email";
    private static final long PHONE_NUMBER = 375446377;
    private static final double CARD_BALANCE = 1000.5;
    private static final boolean STATUS = false;
    private static final int ROWS_ON_PAGE = 10;

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        dao = new CustomerDaoImpl();
        customer = new Customer(ID,FIRST_NAME,LAST_NAME,EMAIL,PHONE_NUMBER,CARD_BALANCE);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldSaveAndReturnCustomer(){
        Customer saved = dao.save(customer);
        Assertions.assertNotNull(saved);
        Assertions.assertEquals(customer,saved);
    }

    @Test
    void shouldReturnCustomerFromDBById(){
        Customer actual = dao.findById(ID);
        Assertions.assertEquals(customer,actual);
    }

    @Test
    void shouldUpdateFieldsInDBForCustomer(){
        Customer expected =
                new Customer(ID,"newFirstName","newLastName","new@email",PHONE_NUMBER,CARD_BALANCE);
        Customer actual = dao.update(expected);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldDeleteCustomerFromDB(){
        boolean actual = dao.delete(customer);
        Assertions.assertTrue(actual);
    }

    @Test
    void shouldReturnListOfCustomers(){
        int expectedSize = 0;
        int actualSize = dao.findAll().size();
        Assertions.assertNotEquals(expectedSize,actualSize);
    }

    @Test
    void shouldCheckExistenceOfCustomerInTable(){
        boolean actual = dao.findInfo(ID);
        Assertions.assertTrue(actual);
    }

    @Test
    void shouldReturnListOfCustomersForPageOnWebsite(){
        int actual = dao.findRowsForPage(1).size();
        Assertions.assertTrue(actual <= ROWS_ON_PAGE);
    }
}
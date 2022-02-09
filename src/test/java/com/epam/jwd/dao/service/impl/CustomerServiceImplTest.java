package com.epam.jwd.dao.service.impl;


import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.exception.ConnectionException;
import com.epam.jwd.service.api.CustomerService;
import com.epam.jwd.service.dto.CustomerDto;
import com.epam.jwd.service.impl.CustomerServiceImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class CustomerServiceImplTest {
    private static CustomerDto customer;
    private static CustomerService service;
    private static final long ID = 14;
    private static final String FIRST_NAME= "NameTest";
    private static final String LAST_NAME = "SurnameTst";
    private static final String EMAIL_PARAMETER = "test@email";
    private static final long PHONE_NUMBER = 375446377;
    private static final double CARD_BALANCE = 1000.5;
    private static final int ROWS_ON_PAGE = 10;
    private static final boolean STATUS = false;

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        service = new CustomerServiceImpl();
        customer = new CustomerDto(FIRST_NAME,LAST_NAME,EMAIL_PARAMETER,PHONE_NUMBER,CARD_BALANCE,STATUS);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldCheckExistenceOfCustomerInTable(){
        boolean actual = service.isInfoExist(ID);
        Assertions.assertTrue(actual);
    }

    @Test
    void shouldReturnListOfCustomersForPageOnWebsite(){
        int actual = service.getRowsForPage(1).size();
        Assertions.assertTrue(actual <= ROWS_ON_PAGE);
    }

    @Test
    void shouldReturnCustomerFromDBById(){
        CustomerDto actual = service.getById(ID);
        Assertions.assertEquals(customer,actual);
    }
    @Test
    void shouldUpdateFieldsInDBForCustomer(){
        CustomerDto actual = service.update(customer);
        Assertions.assertEquals(customer,actual);
    }

    @Test
    void shouldValidateCustomer(){
        boolean actual = service.isValid(customer);
        Assertions.assertTrue(actual);
    }
}
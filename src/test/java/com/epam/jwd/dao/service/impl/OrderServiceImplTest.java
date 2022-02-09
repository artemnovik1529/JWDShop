package com.epam.jwd.dao.service.impl;


import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.exception.ConnectionException;
import com.epam.jwd.service.api.OrderService;
import com.epam.jwd.service.dto.OrderDto;
import com.epam.jwd.service.dto.ProductDto;
import com.epam.jwd.service.impl.OrderServiceImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.sql.Date;
import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;

class OrderServiceImplTest {
    private static OrderDto order;
    private static OrderService service;
    private static final long ID = 73;
    private static final long CUSTOMER_ID = 13;
    private static final Date DATE = Date.valueOf(LocalDate.now());
    private static double PRICE = 500;
    private static final boolean STATUS = true;
    private static final int ROWS_ON_PAGE = 10;

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        service = new OrderServiceImpl();
        order = new OrderDto(ID, CUSTOMER_ID, DATE, PRICE, STATUS);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldReturnOrderByID(){
        OrderDto expected= service.getById(ID);
        Assertions.assertNotNull(expected);
    }

    @Test
    void shouldReturnOrderListForPageOnWebsite(){
        int actual = service.getRowsForPage(1).size();
        Assertions.assertTrue(actual <= ROWS_ON_PAGE);
    }

    @Test
    void shouldUpdateFieldsInDBForOrder(){
        double newPrice = 500;
        order.setPrice(newPrice);
        OrderDto actual = service.update(order);
        Assertions.assertEquals(order,actual);
    }

    @Test
    void shouldReturnListOfProductsForOrder() {
        int expectedSize = 0;
        int actualSize = service.getProducts(ID).size();
        Assertions.assertNotEquals(expectedSize, actualSize);
    }

    @Test
    void shouldCalculateOrderCost(){
        List<ProductDto> products = Arrays.asList(
                new ProductDto(1,"name","description",500),
                new ProductDto(2,"name","description",1300),
                new ProductDto(3,"name","description",500));
        double expected = 2300;
        double actual = service.getOrderPrice(products);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldReturnCustomerOrderListOnPage() {
        List<OrderDto> orders = service.getForCustomer(CUSTOMER_ID, 1);
        int expected = 10;
        int actual = orders.size();
        Assertions.assertEquals(expected,actual);
    }
}
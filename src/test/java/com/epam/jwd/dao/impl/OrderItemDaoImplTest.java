package com.epam.jwd.dao.impl;

import com.epam.jwd.dao.api.OrderItemDao;
import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.entity.OrderItem;
import com.epam.jwd.dao.exception.ConnectionException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;


class OrderItemDaoImplTest {

    private static OrderItemDao dao;
    private static OrderItem item;
    private static final long ID = 78;
    private static final long ORDER_ID = 73;
    private static final long PRODUCT_ID = 13;
    private static final int QUANTITY = 0;

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        dao = new OrderItemDaoImpl();
        item = new OrderItem(ID,ORDER_ID,PRODUCT_ID,QUANTITY);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }


    @Test
    void shouldUpdateFieldsInDBForOrderItem() {
        OrderItem expected = new OrderItem(ID,ORDER_ID,PRODUCT_ID,2);
        OrderItem actual = dao.update(expected);
        Assertions.assertEquals(expected, actual);
    }


    @Test
    void shouldReturnListOfOrderItems() {
        int expectedSize = 0;
        int actualSize = dao.findAll().size();
        Assertions.assertNotEquals(expectedSize, actualSize);
    }

    @Test
    void shouldReturnListOfItemsForOrder() {
        List<OrderItem> orderItems = dao.findFromOrder(ORDER_ID);
        Assertions.assertNotNull(orderItems);
    }
}
package com.epam.jwd.dao.service.impl;

import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.exception.ConnectionException;
import com.epam.jwd.service.api.OrderItemService;
import com.epam.jwd.service.dto.OrderItemDto;
import com.epam.jwd.service.impl.OrderItemServiceImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;


class OrderItemServiceImplTest {
    private static OrderItemDto item;
    private static OrderItemService service;
    private static final long ID = 106;
    private static final long ORDER_ID = 73;
    private static final long PRODUCT_ID = 13;
    private static final int QUANTITY = 0;


    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        service = new OrderItemServiceImpl();
        item = new OrderItemDto(ID,ORDER_ID,PRODUCT_ID,QUANTITY);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldReturnItemsFromOrder(){
        List<OrderItemDto> orderItems = service.findFromOrder(ORDER_ID);
        int expected = 1;
        int actual = orderItems.size();
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldReturnListOfQuantityForEachProduct(){
        int expected = 7;
        List<OrderItemDto> items = service.getQuantity();
        int actual = items.get(0).getQuantity();
        Assertions.assertEquals(expected,actual);
    }

}
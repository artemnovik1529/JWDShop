package com.epam.jwd.dao.service.impl;


import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.exception.ConnectionException;
import com.epam.jwd.service.api.ProductService;
import com.epam.jwd.service.dto.ProductDto;
import com.epam.jwd.service.impl.ProductServiceImpl;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

import java.util.List;

class ProductServiceImplTest {
    private static ProductDto product;
    private static ProductService service;
    private static final long ID = 12;
    private static final String NAME = "MacBook";
    private static final String DESCRIPTION = "Air M1";
    private static final String SPECIFICATION = "13.3\" 2560 x 1600 IPS, 60 Hz, non-touch, Apple M1 3200 MHz, 8 GB, SSD 256 GB, Mac OS,gray";
    private static final double PRICE = 1300;

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        service = new ProductServiceImpl();
        product = new ProductDto(ID,NAME,DESCRIPTION,PRICE,SPECIFICATION);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldValidateProductPositive(){
        boolean actual = service.isValid(product);
        Assertions.assertTrue(actual);
    }

    @Test
    void shouldValidateProductNegative(){
        product.setName("");
        product.setPrice(123.123435);
        boolean actual = service.isValid(product);
        Assertions.assertFalse(actual);
    }

    @Test
    void shouldReturnTopSalesProductList(){
        int expectedProduct1Id = 12;
        int expectedProduct2Id = 13;
        List<ProductDto> topSales = service.getTopSales();
        int actualProduct1Id = (int) topSales.get(0).getId();
        int actualProduct2Id = (int) topSales.get(1).getId();
        Assertions.assertEquals(expectedProduct1Id,actualProduct1Id);
        Assertions.assertEquals(expectedProduct2Id,actualProduct2Id);
    }

}
package com.epam.jwd.dao.impl;


import com.epam.jwd.dao.api.ProductDao;
import com.epam.jwd.dao.connection.ConnectionPool;
import com.epam.jwd.dao.entity.Product;
import com.epam.jwd.dao.exception.ConnectionException;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class ProductDaoImplTest {

    private static ProductDao dao;
    private static Product product;
    private static final long ID = 12;
    private static final String NAME = "MacBook";
    private static final String DESCRIPTION = "Air M1";
    private static final String SPECIFICATION = "13.3\" 2560 x 1600 IPS, 60 Hz, non-touch, Apple M1 3200 MHz, 8 GB, SSD 256 GB, Mac OS,gray";
    private static final double PRICE = 1300;
    private static final int ROWS_ON_PAGE = 10;

    @BeforeAll
    static void setUp() throws ConnectionException {
        ConnectionPool.getInstance().initialize();
        dao = new ProductDaoImpl();
        product = new Product(ID,NAME,DESCRIPTION,PRICE,SPECIFICATION);
    }

    @AfterAll
    static void shutDownPool() throws ConnectionException {
        ConnectionPool.getInstance().shutDown();
    }

    @Test
    void shouldSaveAndReturnProduct(){
        Product saved = dao.save(product);
        Assertions.assertNotNull(saved);
        Assertions.assertEquals(product,saved);
    }

    @Test
    void shouldReturnProductFromDBById(){
        Product actual = dao.findById(ID);
        Assertions.assertEquals(product,actual);
    }

    @Test
    void shouldUpdateFieldPriceInDBForProduct(){
        Product expected = new Product(ID,NAME,DESCRIPTION,1300,SPECIFICATION);
        Product actual = dao.update(expected);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldReturnListOfProducts(){
        int expectedSize = 0;
        int actualSize = dao.findAll().size();
        Assertions.assertNotEquals(expectedSize,actualSize);
    }

    @Test
    void shouldReturnListOfProductsForPageOnWebsite(){
        int actual = dao.findRowsForPage(1).size();
        Assertions.assertTrue(actual <= ROWS_ON_PAGE);
    }
}
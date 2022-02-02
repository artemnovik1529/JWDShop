package com.epam.jwd.dao;


import com.epam.jwd.dao.api.*;
import com.epam.jwd.dao.impl.*;

public class DaoFactory {
    private final UserDao userDao;
    private final CustomerDao customerDao;
    private final ProductDao productDao;
    private final OrderDao orderDao;
    private final OrderItemDao orderItemDao;


    private DaoFactory() {
        userDao = new UserDaoImpl();
        customerDao = new CustomerDaoImpl();
        productDao = new ProductDaoImpl();
        orderDao = new OrderDaoImpl();
        orderItemDao = new OrderItemDaoImpl();

    }



    public OrderDao getOrderDao() {
        return orderDao;
    }

    public OrderItemDao getOrderItemDao() {
        return orderItemDao;
    }

    public UserDao getUserDao() {
        return userDao;
    }

    public CustomerDao getCustomerDao() {
        return customerDao;
    }

    public ProductDao getProductDao() {
        return productDao;
    }

    public static DaoFactory getInstance() {
        return Singleton.INSTANCE;
    }

    private static class Singleton{
        private static final DaoFactory INSTANCE = new DaoFactory();
    }

}
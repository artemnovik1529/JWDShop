package com.epam.jwd.service.impl;



import com.epam.jwd.controller.context.RequestContext;
import com.epam.jwd.dao.DaoFactory;
import com.epam.jwd.dao.api.OrderItemDao;
import com.epam.jwd.dao.api.ProductDao;
import com.epam.jwd.dao.entity.OrderItem;
import com.epam.jwd.dao.entity.Product;
import com.epam.jwd.service.api.ProductService;
import com.epam.jwd.service.converter.Converter;
import com.epam.jwd.service.converter.ProductConverter;
import com.epam.jwd.service.dto.ProductDto;
import com.epam.jwd.service.validation.ProductValidator;
import com.epam.jwd.service.validation.Validator;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

public class ProductServiceImpl implements ProductService {
    private final Converter<ProductDto, Product> converter;
    private final ProductDao productDao;
    private final OrderItemDao orderItemDao;
    private final Validator<ProductDto> validator;

    public ProductServiceImpl() {
        converter = new ProductConverter();
        productDao = DaoFactory.getInstance().getProductDao();
        orderItemDao = DaoFactory.getInstance().getOrderItemDao();
        validator = new ProductValidator();
    }

    @Override
    public ProductDto create(ProductDto productDto) {
        Product product = productDao.save(converter.convert(productDto));
        return converter.convert(product);

    }

    @Override
    public ProductDto update(ProductDto productDto) {
        Product product = productDao.update(converter.convert(productDto));
        return converter.convert(product);
    }

    @Override
    public boolean delete(ProductDto productDto) {
        return productDao.delete(converter.convert(productDto));
    }

    @Override
    public ProductDto getById(Long id) {
        return converter.convert(productDao.findById(id));
    }

    @Override
    public List<ProductDto> getAll() {
        return productDao.findAll().stream()
                .map(converter::convert).collect(Collectors.toList());
    }

    @Override
    public boolean isValid(ProductDto product) {
        return validator.isValid(product);
    }

    @Override
    public boolean isValid(RequestContext context) {
        return validator.isValid(context);
    }

    @Override
    public List<ProductDto> getTopSales() {
        List<OrderItem> all = orderItemDao.getQuantity();
        List<ProductDto> products = new LinkedList<>();
        for (OrderItem item: all){
            long productId = item.getProductId();
            Product product = productDao.findById(productId);
            products.add(converter.convert(product));
        }
        return products;
    }
    @Override
    public List<ProductDto> getRowsForPage(int pageNumber){
        return productDao.findRowsForPage(pageNumber).stream()
                .map(converter::convert).collect(Collectors.toList());
    }

}

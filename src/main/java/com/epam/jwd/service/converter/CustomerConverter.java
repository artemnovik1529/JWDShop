package com.epam.jwd.service.converter;


import com.epam.jwd.dao.entity.Customer;
import com.epam.jwd.service.dto.CustomerDto;

public class CustomerConverter implements Converter<CustomerDto, Customer>{

    /**
     * Method to convert from Customer to CustomerDto
     *
     * @param customer entity for converting
     * @return dto
     */
    @Override
    public CustomerDto convert(Customer customer) {
        CustomerDto customerDto = new CustomerDto();
        customerDto.setId(customer.getId());
        customerDto.setFirstName(customer.getFirstName());
        customerDto.setLastName(customer.getLastName());
        customerDto.setEmail(customer.getEmail());
        customerDto.setPhoneNumber(customer.getPhoneNumber());
        customerDto.setCardBalance(customer.getCardBalance());
        return customerDto;
    }

    /**
     * Method to convert from CustomerDto to Customer
     *
     * @param customerDto dto for converting
     * @return entity
     */
    @Override
    public Customer convert(CustomerDto customerDto) {
        Customer customer = new Customer();
        customer.setId(customerDto.getId());
        customer.setFirstName(customerDto.getFirstName());
        customer.setLastName(customerDto.getLastName());
        customer.setEmail(customerDto.getEmail());
        customer.setPhoneNumber(customerDto.getPhoneNumber());
        customer.setCardBalance(customerDto.getCardBalance());
        return customer;
    }
}

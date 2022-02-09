package com.epam.jwd.dao.service.converter;



import com.epam.jwd.dao.Role;
import com.epam.jwd.dao.entity.User;
import com.epam.jwd.service.converter.Converter;
import com.epam.jwd.service.converter.UserConverter;
import com.epam.jwd.service.dto.UserDto;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

class UserConverterTest {
    private static User user;
    private static UserDto userDto;
    private static Converter<UserDto, User> converter;
    private static final int ROLE_ID = 2;
    private static final String LOGIN = "artemCustomer";
    private static final String PASSWORD= "rewers0337";

    @BeforeAll
    static void setUp()  {
        converter =new UserConverter();
        user = new User(ROLE_ID,LOGIN,PASSWORD);
        userDto = new UserDto(LOGIN,PASSWORD,Role.CUSTOMER);
    }

    @Test
    void shouldCovertFromUserToUserDto(){
        UserDto actual = converter.convert(user);
        Assertions.assertEquals(userDto,actual);
    }

    @Test
    void shouldCovertFromUserDtoToUser(){
        User actual = converter.convert(userDto);
        Assertions.assertEquals(user,actual);
    }

    @Test
    void shouldCovertRole(){
        int expected = user.getRoleId();
        int actual = userDto.getRole().getIdRole();
        Assertions.assertEquals(expected,actual);
    }
}
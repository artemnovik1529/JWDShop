package com.epam.jwd.service.converter;


import com.epam.jwd.dao.Role;
import com.epam.jwd.dao.entity.User;
import com.epam.jwd.service.dto.UserDto;

public class UserConverter implements Converter<UserDto, User>{

    /**
     * Method to convert from User to UserDto
     *
     * @param user entity for converting
     * @return dto
     */
    @Override
    public UserDto convert(User user) {
        UserDto userDto = new UserDto();
        userDto.setId(user.getId());
        userDto.setLogin(user.getLogin());
        userDto.setPassword(user.getPassword());
        userDto.setRole(Role.getRole(user.getRoleId()));
        return userDto;
    }

    /**
     * Method to convert from UserDto to User
     *
     * @param userDto dto for converting
     * @return entity
     */
    @Override
    public User convert(UserDto userDto) {
        User user = new User();
        user.setId(userDto.getId());
        user.setLogin(userDto.getLogin());
        user.setPassword(userDto.getPassword());
        return user;
    }
}

package com.epam.jwd.controller.command;

import com.epam.jwd.dao.Role;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;


class CommandTest {

    @Test
    void shouldReturnCommandByNamePositive(){
        String commandName = "default";
        Command expected = DefaultCommand.getInstance();
        Command actual = CommandType.getCommand(commandName);
        Assertions.assertEquals(expected,actual);
    }

    @Test
    void shouldReturnCommandByNameNegative(){
        String commandName = "about";
        Command expected = DefaultCommand.getInstance();
        Command actual = CommandType.getCommand(commandName);
        Assertions.assertNotEquals(expected,actual);
    }

    @Test
    void shouldCheckEqualityOfUserRole_AndCommandAccessLevel_Positive(){
        Role role = Role.CUSTOMER;
        String commandName = "about";
        boolean equalAccess = CommandType.isEqualAccess(role, commandName);
        Assertions.assertTrue(equalAccess);
    }

    @Test
    void shouldCheckEqualityOfUserRole_AndCommandAccessLevel_Negative(){
        Role role = Role.CUSTOMER;
        String commandName = "add_new_product";
        boolean equalAccess = CommandType.isEqualAccess(role, commandName);
        Assertions.assertFalse(equalAccess);
    }

}
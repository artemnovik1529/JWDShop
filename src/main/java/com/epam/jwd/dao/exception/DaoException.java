package com.epam.jwd.dao.exception;

public class DaoException extends RuntimeException{

    public DaoException() {
    }

    public DaoException(String message, Throwable cause) {
        super(message, cause);
    }

}

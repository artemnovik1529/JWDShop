package com.epam.jwd.service.converter;


import com.epam.jwd.dao.entity.Entity;

public interface Converter <D, E extends Entity>{

    /**
     * Method to convert from entity to dto
     *
     * @param e entity for converting
     * @return dto
     */
    D convert(E e);

    /**
     * Method to convert from dto to entity
     *
     * @param d dto for converting
     * @return entity
     */
    E convert(D d);
}

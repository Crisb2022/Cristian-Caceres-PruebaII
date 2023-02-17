package com.distribuida.servicios;

import com.distribuida.db.Book;
import com.distribuida.dtos.BookDto;

import java.util.List;
import java.util.Optional;

public interface BookRepository {
    List<Book> findAll( );

    Book findById(Integer id);

    void insert(Book book);

    void update( Book book, Integer id);

    void delete( Integer id );
}

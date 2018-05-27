/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import java.io.*;
import java.util.ArrayList;
import uts.wsd.*;

/* Example URL parameters for filters:
 * http://localhost:8080/wsd_assignment3-3/rest/bookApp/books
 * http://localhost:8080/wsd_assignment3-3/rest/bookApp/books?username=kevin
 * http://localhost:8080/wsd_assignment3-3/rest/bookApp/books?username=kevin&availability=Available
 * http://localhost:8080/wsd_assignment3-3/rest/bookApp/books?username=kevin&availability=Available&condition=New
 */
@Path("/bookApp")
public class BookService {

    @Context
    private ServletContext application;

    private BookApplication getBookApp() throws JAXBException, IOException {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manipulating it.
        synchronized (application) {
            BookApplication bookApp = (BookApplication) application.getAttribute("bookApp");
            if (bookApp == null) {
                bookApp = new BookApplication();
                bookApp.setFilePath(application.getRealPath("WEB-INF/books.xml"));
                application.setAttribute("bookApp", bookApp);
            }
            return bookApp;
        }
    }

    // Get books based on the URL parameters given (filters).
    @GET
    @Path("books")
    @Produces(MediaType.APPLICATION_XML)
    public Books fetchBooks(
            @QueryParam("username") String username,
            @QueryParam("availability") String availability,
            @QueryParam("condition") String condition) throws JAXBException, IOException {

        Books books = new Books();
        ArrayList<Book> resultList = new ArrayList<Book>();

        if (username != null && availability != null && condition != null) {
            // filter by all parameters
            for (Book book : getBookApp().getBooks().getBooks()) {
                if (username.equalsIgnoreCase(book.getUsername())
                        && availability.equalsIgnoreCase(book.getAvailability())
                        && condition.equalsIgnoreCase(book.getCondition())) {
                    resultList.add(book);
                }
            }
        } else if (username != null && availability != null) {
            // filters by username & availability parameters
            for (Book book : getBookApp().getBooks().getBooks()) {
                if (username.equalsIgnoreCase(book.getUsername())
                        && availability.equalsIgnoreCase(book.getAvailability())) {
                    resultList.add(book);
                }
            }
        } else if (username != null && condition != null) {
            // filters by username & condition parameters
            for (Book book : getBookApp().getBooks().getBooks()) {
                if (username.equalsIgnoreCase(book.getUsername())
                        && condition.equalsIgnoreCase(book.getCondition())) {
                    resultList.add(book);
                }
            }
        } else if (availability != null && condition != null) {
            // filters by availability & condition parameters
            for (Book book : getBookApp().getBooks().getBooks()) {
                if (availability.equalsIgnoreCase(book.getAvailability())
                        && condition.equalsIgnoreCase(book.getCondition())) {
                    resultList.add(book);
                }
            }
        } else if (username != null) {
            //return books with matching username
            return getBookApp().getBooks().getBooklistByUsername(username);
        } else if (availability != null) {
            //return books with specified availability
            return getBookApp().getBooks().getAvailability(availability);
        } else if (condition != null) {
            //return a list of books with specific condition
            return getBookApp().getBooks().getCondition(condition);
        } else {
            //return a list of all the books
            return getBookApp().getBooks();
        }

        //set the list of books with the matching filters
        books.setBooks(resultList);
        return books;
    }

    /* 
     * // Alternative ways using path parameters (PathParam), only for single filter.
 
    // Get all books.
    @GET
    @Path("books")
    @Produces(MediaType.APPLICATION_XML)
    public Books fetchBooks() throws JAXBException, IOException {
        return getBookApp().getBooks();
    }

    // Get all books filtered by its username.
    @GET
    @Path("books/username/{username}")
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooksByUserName(@PathParam("username") String username) throws Exception {
        return getBookApp().getBooks().getBooklistByUsername(username);
    }

    // Get all books filtered by its status.
    @GET
    @Path("books/availability/{availability}")
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooksByAvailability(@PathParam("availability") String availability) throws Exception {
        return getBookApp().getBooks().getAvailability(availability);
    }

    // Get all books filtered by its condition.
    @GET
    @Path("books/condition/{condition}")
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooksByCondition(@PathParam("condition") String condition) throws Exception {
        return getBookApp().getBooks().getCondition(condition);
    }

    // Get all books filtered by its title.
    @GET
    @Path("books/title/{title}")
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooksByTitle(@PathParam("title") String title) throws JAXBException, IOException {
        return getBookApp().getBooks().getBooklistByTitle(title);
    }
     */
}

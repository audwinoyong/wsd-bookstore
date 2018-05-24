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
        // we're manpulating it.
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
        return getBookApp().getBooks().getAvailablity(availability);
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

}

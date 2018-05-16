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
import uts.wsd.*;

@Path("/bookApp")
public class BookService {

    @Context
    private ServletContext application;

    private BookApplication getUserApp() throws JAXBException, IOException {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            BookApplication userApp = (BookApplication) application.getAttribute("userApp");
            if (userApp == null ) {
                userApp = new BookApplication();
                userApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("userApp", userApp);
            }
            return userApp;
        }
    }
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
            if (bookApp == null ) {
                bookApp = new BookApplication();
                bookApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("bookApp", bookApp);
            }
            return bookApp;
        }
    }

    
    /**
     * YOUR METHODS WILL BE INSERTED HERE *
     */
    @GET
    @Path("users")
    @Produces(MediaType.APPLICATION_XML)
    public Users getUsers() throws JAXBException, IOException {
        return getBookApp().getUsers();
    }

    @GET
    @Path("users/{email}")
    @Produces(MediaType.APPLICATION_XML)
    public User getUser(@PathParam("email") String email) throws JAXBException, IOException {
        return getBookApp().getUsers().getUser(email);
    }

    @POST
    @Path("users")
    @Consumes(MediaType.APPLICATION_XML)
    public void addUser(User user) throws JAXBException, IOException {
        getBookApp().getUsers().addUser(user);
        getBookApp().saveUsers();
    }
}

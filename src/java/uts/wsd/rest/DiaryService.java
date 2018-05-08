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

@Path("/diaryApp")
public class DiaryService {

    @Context
    private ServletContext application;

    private DiaryApplication getDiaryApp() throws JAXBException, IOException {
        // The web server can handle requests from different clients in parallel.
        // These are called "threads".
        //
        // We do NOT want other threads to manipulate the application object at the same
        // time that we are manipulating it, otherwise bad things could happen.
        //
        // The "synchronized" keyword is used to lock the application object while
        // we're manpulating it.
        synchronized (application) {
            DiaryApplication diaryApp = (DiaryApplication) application.getAttribute("diaryApp");
            if (diaryApp == null) {
                diaryApp = new DiaryApplication();
                diaryApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("diaryApp", diaryApp);
            }
            return diaryApp;
        }
    }

    /**
     * YOUR METHODS WILL BE INSERTED HERE *
     */
    @GET
    @Path("users")
    @Produces(MediaType.APPLICATION_XML)
    public Users getUsers() throws JAXBException, IOException {
        return getDiaryApp().getUsers();
    }

    @GET
    @Path("users/{email}")
    @Produces(MediaType.APPLICATION_XML)
    public User getUser(@PathParam("email") String email) throws JAXBException, IOException {
        return getDiaryApp().getUsers().getUser(email);
    }

    @POST
    @Path("users")
    @Consumes(MediaType.APPLICATION_XML)
    public void addUser(User user) throws JAXBException, IOException {
        getDiaryApp().getUsers().addUser(user);
        getDiaryApp().saveUsers();
    }
}

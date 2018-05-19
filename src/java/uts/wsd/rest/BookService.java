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
            if (bookApp == null ) {
                bookApp = new BookApplication();
                bookApp.setFilePath(application.getRealPath("WEB-INF/books.xml"));
                application.setAttribute("bookApp", bookApp);
            }
            return bookApp;
        }
    }
    @GET
    @Path("bookstore")
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooksList() throws JAXBException, IOException {
        Books newBooks = new Books();
        ArrayList<Book> storedBooks = getBookApp().getBooks().getBooks();
        ArrayList<Book> booklist = newBooks.getBooks();        
        int size;
        boolean match;
            for (Book storedBook : storedBooks) {
                        String storedBooktitle = storedBook.getBooktitle();
                        if(booklist.isEmpty()) {
                            newBooks.addBook(storedBook);
                        }
                        else {
                            size = booklist.size();
                            for(int i = 0; i < size; i++) { 
                                match = booklist.get(i).getBooktitle().equals(storedBooktitle);
                                if(match) {
                                    break;
                                }
                                else if(!match && i == size - 1) {
                                    booklist.add(storedBook);
                                }
                            }
                    }
                }            
            return newBooks;
        }
//    @GET
//    @Path("bookstore")
//    @Produces(MediaType.APPLICATION_XML)
//    public ArrayList<Books> getBooksList() throws JAXBException, IOException {
//        ArrayList<Books> booklist = new ArrayList<Books>();
//        ArrayList<Book> storedBooks = getBookApp().getBooks().getBooks();
//        int size;
//        boolean match;
//            for (Book storedBook : storedBooks) {
//                        String storedBooktitle = storedBook.getBooktitle();
//                        if(booklist.isEmpty()) {
//                            Books newBooks = new Books();
//                            newBooks.addBook(storedBook);
//                            booklist.add(newBooks);
//                        }
//                        else {
//                            size = booklist.size();
//                            for(int i = 0; i < size; i++) { 
//                                match = (booklist.get(i).getBookByTitle(storedBooktitle) != null);
//                                
//                                if(match) {
//                                    booklist.get(i).addBook(storedBook);
//                                    break;
//                                }
//                                else if(!match && i == size - 1) {
//                                    Books newBooks = new Books();
//                                    newBooks.addBook(storedBook);
//                                    booklist.add(newBooks);
//                                }
//                            }
//                    }
//                }            
//            return booklist;
//        }
 
//    @GET
//    @Path("bookstore")
//    @Produces(MediaType.APPLICATION_XML)
//    public Bookstore getBookstore() throws JAXBException, IOException {
//        return getBookApp().getBookstore();
//    }

    @GET
    @Path("bookstore/{title}")
    @Produces(MediaType.APPLICATION_XML)
    public Books getBooks(@PathParam("title") String title) throws JAXBException, IOException {
        Books books = getBookApp().getBooks();
        Books selectedBooks = new Books();
        for (Book book : books.getBooks()) {
            if(book.getBooktitle().equals(title)) selectedBooks.addBook(book);
        }
        return selectedBooks;
    }
//
//    @GET
//    @Path("{username}")
//    @Produces(MediaType.APPLICATION_XML)
//    public Books getUserbooks(@PathParam("username") String username) throws JAXBException, IOException {
//        return getBookApp().getBookstore().getUserbooks(username);
//    }    
//    @GET
//    @Path("bookstore/{title}/{bookId}")
//    @Produces(MediaType.APPLICATION_XML)
//    public Book getReservedbook(@PathParam("title") String title, @PathParam("bookId") String bookId) throws JAXBException, IOException {
//        Books books = getBookApp().getBookstore().getUserbooks(title);
//        for (Book book : books.getBooks()) {
//            if (book.getUsername().equals(username)) {
//                return book; //the email is not registered yet.
//            }
//        }        
//        return null;
//    }     
//
//    @POST
//    @Path("bookstore/addBook")
//    @Consumes(MediaType.APPLICATION_XML)
//    public void addBook(Book book) throws JAXBException, IOException {
//        String title = book.getBooktitle();
//        String author = book.getAuthor();
//        String category = book.getCategory();
//        
//        Books books = getBookApp().getBookstore().getBookslist(title);
//        if(books != null) getBookApp().getBookstore().getBookslist().add(books);            
//        else {
//            Books newBooks = new Books(title, author, category, book);
//            getBookApp().getBookstore().getBookslist().add(newBooks);            
//        }
//        getBookApp().saveBooks();
//    }
    
    /**
     * USER METHODS WILL BE INSERTED HERE *
     */
//    @GET
//    @Path("users")
//    @Produces(MediaType.APPLICATION_XML)
//    public Users getUsers() throws JAXBException, IOException {
//        return getBookApp().getUsers();
//    }
//
//    @GET
//    @Path("users/{email}")
//    @Produces(MediaType.APPLICATION_XML)
//    public User getUser(@PathParam("email") String email) throws JAXBException, IOException {
//        return getBookApp().getUsers().getUser(email);
//    }
//
//    @POST
//    @Path("users")
//    @Consumes(MediaType.APPLICATION_XML)
//    public void addUser(User user) throws JAXBException, IOException {
//        getBookApp().getUsers().addUser(user);
//        getBookApp().saveUsers();
//    }
    
    /**
     * BOOK METHODS WILL BE INSERTED HERE *
     */
    
}

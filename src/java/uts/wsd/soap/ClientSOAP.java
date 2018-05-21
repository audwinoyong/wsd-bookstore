/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap;

import javax.annotation.Resource;
import javax.jws.WebService;
import javax.jws.WebMethod;
import javax.jws.WebParam;
import javax.servlet.ServletContext;
import javax.xml.ws.WebServiceContext;
import javax.xml.ws.handler.MessageContext;
import uts.wsd.Book;
import uts.wsd.BookApplication;
import uts.wsd.Books;
import uts.wsd.User;
import uts.wsd.Users;

import java.util.*;

@WebService(serviceName = "ClientSOAP")
public class ClientSOAP {
    private ArrayList<Book> list = new ArrayList<Book>();

    @Resource
    private WebServiceContext context;
    
    @WebMethod
    public Books fetchTextBooks() throws Exception
    {
        return getBookApp().getBooks(); 
    }
    
    @WebMethod
    public void listTextBook(Book book)
    {
         list.add(book);
    }
    
    @WebMethod
    public List<Book> viewTextBook(String username) throws Exception
    {
        List<Book> bookList = new ArrayList<>();
        for (Book book : list) {
            if (book.getCondition().equals(username)) {
                bookList.add(book);
            }
            return bookList;
        }
        return null;
    }
    
    @WebMethod
    public void removeBook(Book book) {
        list.remove(book);
    }
    
    private BookApplication getBookApp() throws Exception {
        ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
        
        BookApplication bookApp = (BookApplication) application.getAttribute("bookApp");
            if (bookApp == null) {
                bookApp = new BookApplication();
                bookApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                application.setAttribute("bookApp", bookApp);
            }
            return bookApp;
    }
}


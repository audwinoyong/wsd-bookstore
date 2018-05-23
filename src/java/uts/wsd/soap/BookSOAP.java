/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap;

import java.util.ArrayList;
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
import uts.wsd.DiaryApplication;
import uts.wsd.User;

/**
 *
 * @author sungrinrhee
 */
@WebService(serviceName = "bookApp")
public class BookSOAP {

    //fetch all ressources
    @Resource
    private WebServiceContext context;
    //book handler

    private BookApplication getBookApp() {
        try {
            ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
            synchronized (application) {
                BookApplication bookApp = (BookApplication) application.getAttribute("bookApp");
                if (bookApp == null) {
                    bookApp = new BookApplication();
                    bookApp.setFilePath(application.getRealPath("WEB-INF/books.xml"));
                    application.setAttribute("bookApp", bookApp);
                }
                return bookApp;
            }
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }

    //user handler
    public DiaryApplication getDiaryApp() {
        // This needs to be local variable in your "getDiaryApp" method
        // It will not work if declared as a field (since field initializers
        // are executed before dependency injection takes place).
        try {
            ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
            synchronized (application) {
                DiaryApplication diaryApp = (DiaryApplication) application.getAttribute("diaryApp");
                if (diaryApp == null) {
                    diaryApp = new DiaryApplication();
                    diaryApp.setFilePath(application.getRealPath("WEB-INF/users.xml"));
                    application.setAttribute("diaryApp", diaryApp);
                }
                return diaryApp;
            }
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }

    @WebMethod()
    public User userLogin(String email, String password) {
        try {
            ArrayList<User> users = getDiaryApp().getUsers().getList();

            for (User user : users) {
                if (user.getEmail().equals(email) && user.getPassword().equals(password)) {
                    return user;
                }
            }
            return null;
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }

    @WebMethod()
    public Books fetchBooks() {
        try {
            return getBookApp().getBooks();
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }

    @WebMethod()
    public ArrayList<Book> getBooksByUser(String username) {
        try {
            ArrayList<Book> booklist = getBookApp().getBooks().getBooksByUsername(username);
            return booklist;
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }

    @WebMethod()
    public void addBook(String booktitle, String author, String category, String condition, String isbn, int publishYear, String publisher, String username, String abst) {
        try {
            Book book = new Book(booktitle, author, category, condition, isbn, publishYear, publisher, username, abst);
            Books books = getBookApp().getBooks();
            books.addBook(book);
            getBookApp().updateXML(books, "WEB-INF/books.xml");
            getBookApp().saveBooks();
        } catch (Exception e) {
            System.out.println("error");
        }
    }

    @WebMethod()
    public void deleteBook(String booktitle) {
        try {
            Books books = getBookApp().getBooks();
            Book book = books.getBookByTitle(booktitle);
            books.removeBook(book);
            getBookApp().updateXML(books, "WEB-INF/books.xml");
            getBookApp().saveBooks();
        } catch (Exception e) {
            System.out.println("error");
        }
    }

}

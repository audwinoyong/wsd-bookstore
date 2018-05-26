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
import uts.wsd.Reservation;
import uts.wsd.ReservationApplication;
import uts.wsd.Reservations;
import uts.wsd.User;

/**
 *
 * @author sungrinrhee
 */
@WebService(serviceName = "bookApp")
public class BookSOAP {

    // Fetch all resources
    @Resource
    private WebServiceContext context;

    // Book controller
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

    // User controller
    public DiaryApplication getDiaryApp() {
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
    // Reservation controller
    public ReservationApplication getReservationApp() {
        try {
            ServletContext application = (ServletContext) context.getMessageContext().get(MessageContext.SERVLET_CONTEXT);
            synchronized (application) {
                ReservationApplication reservationApp = (ReservationApplication) application.getAttribute("reservationApp");
                if (reservationApp == null) {
                    reservationApp = new ReservationApplication();
                    reservationApp.setFilePath(application.getRealPath("WEB-INF/reservation.xml"));
                    application.setAttribute("reservationApp", reservationApp);
                }
                return reservationApp;
            }
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }    

    // Login function checks if there is a lister with email and password provided by a user.
    @WebMethod()
    public User userLogin(String email, String password) {
        try {
            ArrayList<User> users = getDiaryApp().getUsers().getList(); // get a list of user from the xml file using controller.

            for (User user : users) {
                if (user.getEmail().equals(email) && user.getPassword().equals(password)) { // if details are matching, return a lister to login. 
                    return user;
                }
            }
            return null;
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }

    // Get all books stored.
    @WebMethod()
    public Books fetchBooks() {
        try {
            return getBookApp().getBooks();
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }
    

    // Get all books listed by specific user.
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
    // Get a book with specific title.
    @WebMethod()
    public Book getBookByBookId(int bookId) {
        try {
            Book book = getBookApp().getBooks().getBookByBookId(bookId);
            return book;
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }
    // List a new book with details filled.
    @WebMethod()
    public void addBook(String booktitle, String author, String category, String condition, String isbn, int publishYear, String publisher, String username, String abst) {
        try {
            //create a book with details provided by a lister.
            Book book = new Book(booktitle, author, category, condition, isbn, publishYear, publisher, username, abst);
            Books books = getBookApp().getBooks();
            books.addBook(book);

            String filepath = getBookApp().getFilePath();
            getBookApp().updateXML(books, filepath);

        } catch (Exception e) {
            System.out.println("error");
        }
    }

    // Delete a book from the list by its book ID.
    @WebMethod()
    public void deleteBook(String bookId) {
        try {
            Books books = getBookApp().getBooks();
            Book book = books.getBookByTitle(bookId);
            books.removeBook(book);

            String filepath = getBookApp().getFilePath();
            getBookApp().updateXML(books, filepath);

        } catch (Exception e) {
            System.out.println("error");
        }
    }
    // Get all reservation booked by a specific user.
    @WebMethod()
    public ArrayList<Reservation> getReservationsByUser(String username) {
        try {
            ArrayList<Reservation> reservationlist = getReservationApp().getReservations().getReservationsByUsername(username);
            return reservationlist;
        } catch (Exception e) {
            System.out.println("error");
            return null;
        }
    }
    // List a new book with details filled.
    @WebMethod()
    public void addReservation(int bookId, String booktitle, String username, String email) {
        try {
            Reservation reservation = new Reservation(bookId, booktitle, username, email);
            Reservations reservations = getReservationApp().getReservations();
            reservations.addReservation(reservation);

            String filepath = getReservationApp().getFilePath();
            getReservationApp().updateXML(reservations, filepath);

        } catch (Exception e) {
            System.out.println("error");
        }
    } 
}
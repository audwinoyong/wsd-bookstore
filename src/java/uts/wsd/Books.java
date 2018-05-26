/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "books")
public class Books implements Serializable {

    @XmlElement(name = "book")
    private ArrayList<Book> list = new ArrayList<Book>();

    public Books() {
    }

    public ArrayList<Book> getBooks() {
        return list;
    }

    public void addBook(Book book) {
        list.add(book);
    }

    public void removeBook(Book book) {
        list.remove(book);
    }

    // function to get book with matching username
    public Book getBook(String username) {
        for (Book book : list) {
            if (book.getUsername().equals(username)) {  //return a book with matching username
                return book;
            }
        }
        return null;
    }

    public Book getBookByBookId(int bookId) {
        for (Book book : list) {
            if (book.getBookId() == bookId) { //return a book with matching book ID
                return book;
            }
        }
        return null;
    }
    // function to get book with maching title

    public Book getBookByTitle(String title) {
        for (Book book : list) {
            if (book.getBooktitle().equals(title)) { //return a book with matching book title
                return book;
            }
        }
        return null;
    }

    //return a list of book with matching title    
    public Books getBooklistByTitle(String title) {
        Books books = new Books();
        for (Book book : list) {
            if (book.getBooktitle().equals(title)) {
                books.addBook(book);
            }
        }
        return books;
    }

    //return an array of book with matching title    
    public ArrayList<Book> getBooksByTitle(String booktitle) {
        ArrayList<Book> bookList = new ArrayList<>();
        for (Book book : list) {
            if (book.getBooktitle().equals(booktitle)) {
                bookList.add(book);
            }
        }
        return bookList;
    }

    //return books that are available   
    public Books getAvailability(String availability) {
        Books books = new Books();
        for (Book book : list) {
            if (book.getAvailability().equals(availability)) {
                books.addBook(book);
            }
        }
        return books;
    }

    //return a list of book with specific condition    
    public Books getCondition(String condition) {
        Books books = new Books();
        for (Book book : list) {
            if (book.getCondition().equals(condition)) {
                books.addBook(book);
            }
        }
        return books;
    }

    //Add all books inside the arraylist to Books
    public void addAll(ArrayList<Book> books) {
        list.removeAll(list);
        for (Book book : books) {
            list.add(book);
        }

    }

    public Books getBooklistByUsername(String username) {
        Books books = new Books();
        for (Book book : list) {
            if (book.getUsername().equals(username)) {
                books.addBook(book);
            }
        }
        return books;
    }

    public ArrayList<Book> getBooksByUsername(String username) {
        ArrayList<Book> bookList = new ArrayList<>();
        for (Book book : list) {
            if (book.getUsername().equals(username)) {
                bookList.add(book);
            }
        }
        return bookList;
    }

    public ArrayList<Book> getBooksByStatus(String status) {
        ArrayList<Book> bookList = new ArrayList<>();
        for (Book book : list) {
            if (book.getAvailability().equals(status)) {
                bookList.add(book);
            }
        }
        return bookList;
    }

    // Get a list of books organised by titles
    public Books getBooksList(Books books) {
        Books newBooks = new Books();
        ArrayList<Book> storedBooks = books.getBooks();
        ArrayList<Book> booklist = newBooks.getBooks();
        int size;
        boolean match;
        for (Book storedBook : storedBooks) {
            String storedBooktitle = storedBook.getBooktitle();
            if (booklist.isEmpty()) {
                // store the first book with a title.
                newBooks.addBook(storedBook);
            } else {
                size = booklist.size();
                // if there is a book with the same title, skip.                          
                for (int i = 0; i < size; i++) {
                    match = booklist.get(i).getBooktitle().equals(storedBooktitle);
                    if (match) {
                        break;
                    } // if there is no book with the same title, add.
                    else if (!match && i == size - 1) {
                        booklist.add(storedBook);
                    }
                }
            }
        }
        //return books sorted by titles.
        return newBooks;
    }

//    public int getBooksListCount(Books books) {
//        Books newBooks = new Books();
//        ArrayList<Book> storedBooks = books.getBooks();
//        ArrayList<Book> booklist = newBooks.getBooks();
//        int size;
//        boolean match;
//        int count = 0;
//        for (Book storedBook : storedBooks) {
//            String storedBooktitle = storedBook.getBooktitle();
//            if (booklist.isEmpty()) {
//                // store the first book with a title.
//                newBooks.addBook(storedBook);
//            } else {
//                size = booklist.size();
//                // if there is a book with the same title, skip.                          
//                for (int i = 0; i < size; i++) {
//                    match = booklist.get(i).getBooktitle().equals(storedBooktitle);
//                    if (match) {
//                        count++;
//                        break;
//                    } // if there is no book with the same title, add.
//                    else if (!match && i == size - 1) {
//                        booklist.add(storedBook);
//                    }
//                }
//            }
//        }
//        //return books sorted by titles.
//        return count;
//    }
}

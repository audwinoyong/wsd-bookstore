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
@XmlRootElement(name="books")
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
            if (book.getUsername().equals(username)) {
                return book; 
            }
        }
        return null;
    }
    public Book getBookByBookId(int bookId) {
        for (Book book : list) {
            if (book.getBookId()==bookId) {
                return book; 
            }
        }
        return null;
    }    
        // function to get book with maching title
    public Book getBookByTitle(String title) {
        for (Book book : list) {
            if (book.getBooktitle().equals(title)) {
                return book; //the email is not registered yet.
            }
        }
        return null;
    }
    public void addAll(ArrayList<Book> books) {
        list.removeAll(list);
        for (Book book : books) {
            list.add(book);
            }
             
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
    public ArrayList<Book> getBooksByTitle(String booktitle) {
        ArrayList<Book> bookList = new ArrayList<>();
        for (Book book : list) {
            if (book.getBooktitle().equals(booktitle)) {
                bookList.add(book);
            }
        }
        return bookList;
    }      
    public Books getBooksList(Books books){
        Books newBooks = new Books();
        ArrayList<Book> storedBooks = books.getBooks();
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
    
}
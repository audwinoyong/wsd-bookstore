/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import java.util.concurrent.atomic.AtomicInteger;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 *
 * @author sungrinrhee
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Book implements Serializable {

    private static AtomicInteger count = new AtomicInteger(6);
    @XmlElement(name = "bookId")
    private int bookId;
    @XmlElement(name = "booktitle")
    private String booktitle;
    @XmlElement(name = "author")
    private String author;
    @XmlElement(name = "category")
    private String category;
    @XmlElement(name = "condition")
    private String condition;
    @XmlElement(name = "isbn")
    private String isbn;
    @XmlElement(name = "publishYear")
    private int publishYear;
    @XmlElement(name = "publisher")
    private String publisher;
    @XmlElement(name = "username")
    private String username;
    @XmlElement(name = "abstract")
    private String abst;
    @XmlElement(name = "availablilty")
    private String availablilty;


    public Book() {
    }

    public Book(String booktitle, String author, String category, String condition, String isbn, int publishYear, String publisher, String username, String abst) {
        this.bookId = count.getAndIncrement();
        this.booktitle = booktitle;
        this.author = author;
        this.category = category;
        this.condition = condition;
        this.isbn = isbn;
        this.publishYear = publishYear;
        this.publisher = publisher;
        this.username = username;
        this.abst = abst;
        this.availablilty = "Available";
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getBooktitle() {
        return booktitle;
    }

    public void setBooktitle(String booktitle) {
        this.booktitle = booktitle;
    }

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public String getIsbn() {
        return isbn;
    }

    public void setIsbn(String isbn) {
        this.isbn = isbn;
    }

    public int getPublishYear() {
        return publishYear;
    }

    public void setPublishYear(int publishYear) {
        this.publishYear = publishYear;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getAbst() {
        return abst;
    }

    public void setAbst(String abst) {
        this.abst = abst;
    }

    public String getAvailablilty() {
        return availablilty;
    }

    public void setAvailablilty(String availablilty) {
        this.availablilty = availablilty;
    }


}

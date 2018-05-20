/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;

/**
 *
 * @author sungrinrhee
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Reservation implements Serializable {

    @XmlElement(name = "bookId")
    private int bookId;    
    @XmlElement(name = "booktitle")
    private String booktitle;
    @XmlElement(name = "username")
    private String username;    
    @XmlElement(name = "email")
    private String email;
        
    
    public Reservation() {
    }

    public Reservation(int bookId, String booktitle, String username, String email) {
        this.bookId = bookId;
        this.booktitle = booktitle;
        this.username = username;
        this.email = email;
    }

    public int getBookId() {
        return bookId;
    }

    public void setBookId(int bookId) {
        this.bookId = bookId;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getBooktitle() {
        return booktitle;
    }

    public void setBooktitle(String booktitle) {
        this.booktitle = booktitle;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }



}

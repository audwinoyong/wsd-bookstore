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
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sungrinrhee
 */
@XmlAccessorType(XmlAccessType.FIELD)
public class Reservation implements Serializable {

    @XmlElement(name = "booktitle")
    private String booktitle;
    @XmlElement(name = "username")
    private String username;
    @XmlElement(name = "userEmail")
    private String userEmail;
    
    public Reservation() {
    }

    public Reservation(String booktitle, String username, String userEmail) {
        this.booktitle = booktitle;
        this.username = username;
        this.userEmail = userEmail;
    }

    public String getBooktitle() {
        return booktitle;
    }

    public void setBooktitle(String booktitle) {
        this.booktitle = booktitle;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }


}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.JAXBContext;
import javax.xml.bind.JAXBException;
import javax.xml.bind.Marshaller;
import javax.xml.bind.Unmarshaller;
import javax.xml.bind.annotation.XmlAccessType;
import javax.xml.bind.annotation.XmlAccessorType;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author sungrinrhee
 */

@XmlRootElement
@XmlAccessorType(XmlAccessType.PROPERTY)
public class BookApplication {
    
    private String filePath;
    private Users users;

    public BookApplication() {
    }

    public BookApplication(String filePath, Users users) {
        this.filePath = filePath;
        this.users = users;
    }
    @XmlElement
    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws FileNotFoundException, JAXBException, IOException {
    // Create the unmarshaller
    JAXBContext jc = JAXBContext.newInstance(Users.class);
    Unmarshaller u = jc.createUnmarshaller();

    this.filePath = filePath;
    // Now unmarshal the object from the file
    FileInputStream fin = new FileInputStream(filePath);
    users = (Users)u.unmarshal(fin); // This loads the "shop" object
    fin.close();
    }
    
    @XmlElement
    public Users getUsers() {
        return users;
    }

    public void setUsers(Users users) {
        this.users = users;
    }
    
    public void saveUsers() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT,true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(users, fout);
        fout.close();
    }
    
    
    
}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class BookApplication implements Serializable {

    private String filePath;
    private Books books;

    public BookApplication() {
    }

    public BookApplication(String filePath, Books books) {
        super();
        this.filePath = filePath;
        this.books = books;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, IOException {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        books = (Books) u.unmarshal(fin); // This loads the "bookstore" object
        fin.close();
    }

    // save "books" object (Java) to books.xml file
    public void updateXML(Books books, String filePath) throws JAXBException, IOException {
        this.books = books;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(books, fout);
        fout.close();
    }

    public void saveBooks() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Books.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(books, fout);
        fout.close();
    }

    public Books getBooks() {
        return books;
    }



    public void setBookstore(Books books) {
        this.books = books;
    }

}

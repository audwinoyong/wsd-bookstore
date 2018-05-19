/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.*;
import javax.xml.bind.*;

public class ReservationApplication implements Serializable {

    private String filePath;
    private Reservations reservations;

    public ReservationApplication() {
    }

    public ReservationApplication(String filePath, Reservations reservations) {
        super();
        this.filePath = filePath;
        this.reservations = reservations;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) throws JAXBException, IOException {
        // Create the unmarshaller
        JAXBContext jc = JAXBContext.newInstance(Reservations.class);
        Unmarshaller u = jc.createUnmarshaller();
        this.filePath = filePath;
        // Now unmarshal the object from the file
        FileInputStream fin = new FileInputStream(filePath);
        reservations = (Reservations) u.unmarshal(fin); // This loads the "bookstore" object
        fin.close();
    }

    // save "books" object (Java) to books.xml file
    public void updateXML(Reservations reservations, String filePath) throws JAXBException, IOException {
        this.reservations = reservations;
        this.filePath = filePath;
        JAXBContext jc = JAXBContext.newInstance(Reservations.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(reservations, fout);
        fout.close();
    }

    public void saveReservations() throws JAXBException, IOException {
        JAXBContext jc = JAXBContext.newInstance(Reservations.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        FileOutputStream fout = new FileOutputStream(filePath);
        m.marshal(reservations, fout);
        fout.close();
    }

    public Reservations getReservations() {
        return reservations;
    }
    
    

    public void setReservation(Reservations reservations) {
        this.reservations = reservations;
    }

}

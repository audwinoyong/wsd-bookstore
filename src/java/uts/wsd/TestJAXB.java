package uts.wsd;

import java.util.*;
import java.io.*;
import javax.xml.bind.*;

public class TestJAXB implements Serializable {

    public static void main(String[] args) throws Exception {
        Users users = new Users();
        users.addUser(new User("Ryan Heise", "ryan@ryanheise.com", "blahblah", "12/12/1990"));
        users.addUser(new User("Joe Bloggs", "joe@bloggs.com", "foobar", "05/08/1991"));
        // Boilerplate code to convert objects to XML...
        JAXBContext jc = JAXBContext.newInstance(Users.class);
        Marshaller m = jc.createMarshaller();
        m.setProperty(Marshaller.JAXB_FORMATTED_OUTPUT, true);
        m.marshal(users, System.out);
    }
}

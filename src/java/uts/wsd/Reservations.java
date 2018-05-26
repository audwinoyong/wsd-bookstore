package uts.wsd;

import java.util.*;
import java.io.Serializable;
import javax.xml.bind.annotation.*;

@XmlAccessorType(XmlAccessType.FIELD)
@XmlRootElement(name = "reservations")
public class Reservations implements Serializable {

    @XmlElement(name = "reservation")
    private ArrayList<Reservation> list = new ArrayList<Reservation>();

    public Reservations() {
    }

    public ArrayList<Reservation> getList() {
        return list;
    }

    public void setList(ArrayList<Reservation> list) {
        this.list = list;
    }

    public void removeReservation(Reservation reservation) {
        list.remove(reservation);
    }

    // this function returns a Reservation that has specific book ID.
    public Reservation getReservationByBookId(int bookId) {
        for (Reservation reservation : list) {
            if (reservation.getBookId() == bookId) {
                return reservation;
            }
        }
        return null;
    }

    // this function returns an arraylist of reservation that has matching book ID.
    public ArrayList<Reservation> getReservationsByBookId(int bookId) {
        ArrayList<Reservation> reservationList = new ArrayList<>();
        for (Reservation reservation : list) {
            if (reservation.getBookId() == bookId) {
                reservationList.add(reservation);
            }
        }
        return reservationList;
    }

    // this function returns an arraylist of reservation that has been reserved by a certain user.    
    public ArrayList<Reservation> getReservationsByUsername(String username) {
        ArrayList<Reservation> reservationList = new ArrayList<>();
        for (Reservation reservation : list) {
            if (reservation.getUsername().equals(username)) {
                reservationList.add(reservation);
            }
        }
        return reservationList;
    }

    public void addReservation(Reservation reservation) {
        list.add(reservation);
    }

    public void addAll(ArrayList<Reservation> reservations) {
        list.removeAll(list);
        for (Reservation reservation : reservations) {
            list.add(reservation);
        }

    }
}

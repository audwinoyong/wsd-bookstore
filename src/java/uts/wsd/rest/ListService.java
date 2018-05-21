/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.rest;

import java.io.IOException;
import java.util.ArrayList;
import javax.servlet.ServletContext;
import javax.ws.rs.*;
import javax.ws.rs.core.*;
import javax.xml.bind.JAXBException;
import uts.wsd.*;

@Path("/reservationApp")
public class ListService {
    @Context
    private ServletContext application;
    
    private ReservationApplication getReservationApp() throws JAXBException, IOException
    {
        synchronized(application)
        {
            ReservationApplication reservationApp = (ReservationApplication) application.getAttribute("reservationApp");
                    
            if(reservationApp == null)
            {
                reservationApp = new ReservationApplication();
                reservationApp.setFilePath(application.getRealPath("WEB-INF/reservation.xml"));
                application.setAttribute("reservationApp",reservationApp);
            }
            return reservationApp;
        }
    }
    
    @GET
    @Path("reservations")
    @Produces(MediaType.APPLICATION_XML)
    public ArrayList<Reservation> getReservationsList() throws JAXBException, IOException
    {
        return getReservationApp().getReservations().getList();
    }
    
}

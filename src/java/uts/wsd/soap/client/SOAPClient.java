/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd.soap.client;

/**
 *
 * @author sungrinrhee
 */
public class SOAPClient {
    public static void main(String[] args) {
     ClientSOAP_Service locator = new ClientSOAP_Service();
     ClientSOAP clientSOAP = locator.getClientSOAPPort();

     /** Insert your code here **/
     
   }    
}

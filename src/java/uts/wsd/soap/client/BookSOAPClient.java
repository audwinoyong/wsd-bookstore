package uts.wsd.soap.client;

import java.util.List;
import java.util.Scanner;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author sungrinrhee
 */
public class BookSOAPClient {

    public static void main(String[] args) {
        BookApp locator = new BookApp();
        BookSOAP bookSOAP = locator.getBookSOAPPort();
        Scanner scanner = new Scanner(System.in);
        String select;
        User user = null;
        String username = "";
        String email;
        do { // Main system's salutation and menu.
            System.out.println("===========================");
            System.out.println("Welcome to Bookstore");
            System.out.println("Select an option from below");
            System.out.println("===========================");

            if (user != null) { // display menu for logged in users(listers).
                System.out.println("v. View Books");
                System.out.println("l. List a Book");
                System.out.println("d. Delete a Book");
                System.out.println("r. View Reservations");
                System.out.println("b. Reserve a Book");
                System.out.println("o. Logout");
                System.out.println("x. Exit");
                System.out.println("");
                System.out.print("Your choice: ");
                select = scanner.nextLine();
            } else { // display menu for non logged in users.
                System.out.println("v. View Books");
                System.out.println("i. Login");
                System.out.println("x. Exit");
                System.out.println("");
                System.out.print("Your choice: ");
                select = scanner.nextLine();
            }
            switch (select) {
                case "v": // Display all the books stored.
                    List<Book> books = bookSOAP.fetchBooks().getBook();
                    System.out.println("List of books:");
                    for (Book book : books) {
                        System.out.println("Book ID: " + book.getBookId());
                        System.out.println("Book Title: " + book.getBooktitle());
                        System.out.println("Book Author: " + book.getAuthor());
                        System.out.println("Book Category: " + book.getCategory());
                        System.out.println("Book Availability: " + book.getAvailability() + "\n");
                    }
                    break;

                case "l": // Ask Lister for book information and add the book to the list.
                    if (user != null) {
                        System.out.println("Enter the details of your book:");
                        System.out.print("Book title: ");
                        String title = scanner.nextLine();

                        System.out.print("Book author: ");
                        String author = scanner.nextLine();

                        System.out.print("Book category: ");
                        String category = scanner.nextLine();

                        System.out.print("Book condition: ");
                        String condition = scanner.nextLine();

                        System.out.print("Book isbn: ");
                        String isbn = scanner.nextLine();

                        System.out.print("Book publishYear: ");
                        int publishYear = scanner.nextInt();
                        scanner.nextLine();

                        System.out.print("Book publisher: ");
                        String publisher = scanner.nextLine();

                        System.out.print("Book abstract: ");
                        String abst = scanner.nextLine();

                        System.out.println("Book is listed successfully");
                        bookSOAP.addBook(title, author, category, condition, isbn, publishYear, publisher, user.getName(), abst);
                    }
                    break;

                case "r": // Display all the reservation made by user.
                    List<Reservation> reservations = bookSOAP.getReservationsByUser(username);
                    if (reservations.isEmpty()) { // Display a error message if the lister did not have any reservation.
                        System.out.println("You have not reserved a book yet.");

                    } else { // Display details of reservations if there is at least one.
                        System.out.println("List of Reservations:");
                        for (Reservation reservation : reservations) { //List reservations with details.
                            System.out.println("Book Id: " + reservation.getBookId());
                            System.out.println("Book Title: " + reservation.getBooktitle());
                            System.out.println("Booked by : " + reservation.getUsername());
                            System.out.println("Email: " + reservation.getEmail() + "\n");
                        }
                    }
                    break;

                case "b": // Ask Lister for book to reserve and add the reservation
                    if (user != null) {
                        System.out.println("Enter the Book ID you wish to reserve");
                        int bookId = scanner.nextInt();
                        scanner.nextLine();
                        String booktitle = bookSOAP.getBookByBookId(bookId).getBooktitle();

                        username = user.getName();
                        email = user.getEmail();

                        bookSOAP.addReservation(bookId, booktitle, username, email);
                        System.out.println("Book has been reserved successfully");
                    }
                    break;

                case "d": // Delete a book by its book ID.
                    if (user != null) {
                        System.out.println("Enter the book ID you want to delete:");
                        int bookId = scanner.nextInt();
                        scanner.nextLine();
                        bookSOAP.deleteBook(bookId);
                        System.out.println("Book is deleted successfully");
                    }
                    break;

                case "i": // Authentication(Login) asking user's email address and password.
                    System.out.print("Enter email address: ");
                    email = scanner.nextLine();
                    System.out.print("Enter password: ");
                    String password = scanner.nextLine();   // password only stored temporarily.
                    user = bookSOAP.userLogin(email, password);
                    if (user != null) {
                        username = user.getName();
                        System.out.println("Hi, " + username);
                        break;
                    } else {
                        System.out.println("Error: Invalid email or password!");
                        break;
                    }
                case "o": // Logout procedure.
                    System.out.println("Logged out successfully.");
                    user = null;
                    break;

                case "x": // Exit the program.
                    break;

                default: // If user's input is not valied, prompt user to type the valid input.
                    System.out.println("Invalid input, please try again. \n");
                    break;
            }
        } while (!select.equals("x"));
        System.out.println("Goodbye."); //End of the program

    }
}

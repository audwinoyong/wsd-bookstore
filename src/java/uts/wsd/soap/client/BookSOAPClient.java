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
        String username;
        String email;
        do {
            System.out.println("===========================");
            System.out.println("Welcome to Bookstore");
            System.out.println("Select an option from below");
            System.out.println("===========================");

            if (user != null) {
                System.out.println("v. View Books");
                System.out.println("l. List a Book");
                System.out.println("d. Delete a Book");
                System.out.println("o. Logout");
                System.out.println("x. Exit");
                System.out.println("");
                System.out.print("Your choice: ");
                select = scanner.nextLine();
            } else {
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
                        System.out.println("Book Title: " + book.getBooktitle());
                        System.out.println("Book Author: " + book.getAuthor());
                        System.out.println("Book Category: " + book.getCategory() + "\n");
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

                        System.out.println("Book listed successfully");
                        bookSOAP.addBook(title, author, category, condition, isbn, publishYear, publisher, user.getName(), abst);
                    }
                    break;
                case "d": // Delete a book by its title.
                    if (user != null) {
                        System.out.println("Enter the booktitle you want to delete:");
                        String title = scanner.nextLine();
                        bookSOAP.deleteBook(title);
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

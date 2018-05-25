/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.wsd;

import java.io.Serializable;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * This class provides validation of the inputs within the login and register forms.
 * Regular expressions from the XML Schema's are used for validating the inputs
 * before being saved into the XMLs.
 * 
 * @author Audwin
 */
public class Validator implements Serializable {

    // Name is 1 or more words separated by a space.
    // Each word must consist only of letters. The first letter of each word must be an uppercase character.
    private String namePattern = "[A-Z][a-zA-Z]*(\\s[A-Z][a-zA-Z]*)*";

    // Email address begins with a username followed by a @ followed by a domain name.
    // The username must consist of 1 or more characters which can be only uppercase, lowercase or dot "." or underscore.
    // The domain name is 2 or more components separated by a dot ".".
    // Each component should be a word consisting of 1 or more characters, which must be either lowercase or hyphens.
    private String emailPattern = "[a-zA-Z\\._]+@[a-z\\-]+(\\.[a-z\\-]+)+";

    // Password is minimum 8 characters, alphanumeric
    private String passwordPattern = "[a-zA-Z0-9]{8,}";

    // Date of Birth is in "yyyy-mm-dd" format
    private String dobPattern = "\\d{4}-\\d{2}-\\d{2}";

    public Validator() {
    }

    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }

    public boolean isEmpty(String name, String email, String password) {
        return name.isEmpty() || email.isEmpty() || password.isEmpty();
    }

    public boolean isEmpty(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }

    public boolean validName(String name) {
        return validate(namePattern, name);
    }

    public boolean validEmail(String email) {
        return validate(emailPattern, email);
    }

    public boolean validPassword(String password) {
        return validate(passwordPattern, password);
    }

    public boolean validDob(String dob) {
        return validate(dobPattern, dob);
    }
}

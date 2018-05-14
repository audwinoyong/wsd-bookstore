/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package uts.controller;

import java.io.Serializable;
import java.util.*;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 *
 * @author Surf
 */
public class Validator implements Serializable {
    // 
    private String emailPattern = "[a-zA-Z\\._]+@[a-z\\-]+(\\.[a-z\\-]+)+";
    private String namePattern = "[A-Z][a-zA-Z]*(\\s[A-Z][a-zA-Z]*)*";
    private String passwordPattern = "[a-z]{6,}[0-9]+";
    private HashMap<String, String> errors;
    
    public Validator() {
        errors = new HashMap();
    }
    
    public void add(String key, String err) {
        errors.put(key, err);
    }
    
    public boolean validate(String pattern, String input) {
        Pattern regEx = Pattern.compile(pattern);
        Matcher match = regEx.matcher(input);
        return match.matches();
    }
    
    public boolean checkEmpty(String email, String password) {
        return email.isEmpty() || password.isEmpty();
    }
    
    public boolean validateEmail(String email) {
        return validate(emailPattern, email);
    }
    
    public boolean validatePassword(String password) {
        return validate(passwordPattern, password);
    }
}

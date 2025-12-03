package com.asapmu.parumu.exception;

import org.springframework.http.HttpStatus;
import org.springframework.security.core.AuthenticationException; // <-- IMPORT BARU
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestControllerAdvice;

import java.util.HashMap;
import java.util.Map;

@RestControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(MethodArgumentNotValidException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, String> handleValidationExceptions(MethodArgumentNotValidException ex) {
        Map<String, String> errors = new HashMap<>();
        FieldError fieldError = ex.getBindingResult().getFieldError();
        if (fieldError != null) {
            String errorMessage = fieldError.getDefaultMessage();
            errors.put("error", errorMessage);
        }
        return errors;
    }

    @ExceptionHandler(RuntimeException.class)
    @ResponseStatus(HttpStatus.BAD_REQUEST)
    public Map<String, String> handleRuntimeException(RuntimeException ex) {
        Map<String, String> errorMap = new HashMap<>();
        String errorMessage = ex.getMessage();
        errorMap.put("error", errorMessage);
        return errorMap;
    }

    @ExceptionHandler(AuthenticationException.class)
    @ResponseStatus(HttpStatus.UNAUTHORIZED) // Status 401 Unauthorized
    public Map<String, String> handleAuthenticationException(AuthenticationException ex) {
        Map<String, String> errorMap = new HashMap<>();
        String errorMessage = "Username atau password salah!";
        errorMap.put("error", errorMessage);
        return errorMap;
    }
}


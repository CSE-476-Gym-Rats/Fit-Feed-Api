package com.example.fitfeed.api.controllers.common;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.mvc.method.annotation.ResponseEntityExceptionHandler;

@ControllerAdvice
public class FitFeedResponseEntityExceptionHandler extends ResponseEntityExceptionHandler {

    @ExceptionHandler(value = { Exception.class })
    protected ResponseEntity<Object> handleGenericException(Exception ex, WebRequest request) {
        logger.error("Handling exception: ", ex);
        return this.handleExceptionInternal(ex, "Internal Server Error", new HttpHeaders(), HttpStatus.INTERNAL_SERVER_ERROR, request);
    }

    @ExceptionHandler(value = { HttpClientErrorException.Unauthorized.class })
    protected ResponseEntity<Object> handleUnauthorizedException(Exception ex, WebRequest request) {
        logger.error("Handling unauthorized exception: ", ex);
        return this.handleExceptionInternal(ex, "Unauthorized", new HttpHeaders(), HttpStatus.UNAUTHORIZED, request);
    }

    @ExceptionHandler(value = { HttpClientErrorException.NotFound.class })
    protected ResponseEntity<Object> handleNotFoundException(Exception ex, WebRequest request)
    {
        logger.error("Handling not found exception: ", ex);
        return this.handleExceptionInternal(ex, "Not Found", new HttpHeaders(), HttpStatus.NOT_FOUND, request);
    }

}

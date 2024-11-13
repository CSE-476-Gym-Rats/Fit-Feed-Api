package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Token;
import com.example.fitfeed.api.models.User;
import com.example.fitfeed.api.models.dto.KeycloakUserRequest;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.apache.coyote.BadRequestException;
import org.springframework.http.*;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.HttpClientErrorException;
import org.springframework.web.client.RestTemplate;

import java.util.Objects;

@Service
public class KeycloakServiceImpl implements KeycloakService {

    private final ObjectMapper objectMapper = new ObjectMapper();

    @Override
    public Token login(String username, String password) {
        return loginHelper(username, password, "fitfeed-rest-api", "ETcdqAuoZD3JJe0vhzw9AhmuLhDg6vIV");
    }

    @Override
    public String register(KeycloakUserRequest keycloakUserRequest) {
        Token adminToken = loginHelper("fitfeed-admin", "joshiscool", "admin-cli", "");
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.setBearerAuth(adminToken.getAccess_token());
        String jsonString = "";
        try {
            jsonString = objectMapper.writeValueAsString(keycloakUserRequest);
        } catch (JsonProcessingException e) {
            throw new HttpClientErrorException(HttpStatus.BAD_REQUEST, e.getMessage());
        }
        HttpEntity<String> request = new HttpEntity<>(jsonString, headers);
        return restTemplate.postForObject("http://localhost:8080/admin/realms/fitfeed-realm/users", request, String.class);
    }

    private Token loginHelper(String username, String password, String clientId, String clientSecret) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("grant_type", "password");
        map.add("username", username);
        map.add("password", password);
        map.add("client_id", clientId);
        if (!Objects.equals(clientSecret, "")) { map.add("client_secret", clientSecret); }
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
        return restTemplate.postForObject("http://localhost:8080/realms/fitfeed-realm/protocol/openid-connect/token", request, Token.class);
    }

}

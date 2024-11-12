package com.example.fitfeed.api.service;

import com.example.fitfeed.api.models.Token;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

@Service
public class KeycloakServiceImpl implements KeycloakService {

    @Override
    public Token login(String username, String password) {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_FORM_URLENCODED);
        MultiValueMap<String, String> map = new LinkedMultiValueMap<>();
        map.add("grant_type", "password");
        map.add("username", username);
        map.add("password", password);
        map.add("client_id", "fitfeed-rest-api");
        map.add("client_secret", "ETcdqAuoZD3JJe0vhzw9AhmuLhDg6vIV");
        HttpEntity<MultiValueMap<String, String>> request = new HttpEntity<>(map, headers);
        return restTemplate.postForObject("http://localhost:8080/realms/fitfeed-realm/protocol/openid-connect/token", request, Token.class);
    }
}

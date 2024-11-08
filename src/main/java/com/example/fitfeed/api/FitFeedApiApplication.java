package com.example.fitfeed.api;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@SpringBootApplication
@EnableTransactionManagement
public class FitFeedApiApplication {

	public static void main(String[] args) {
		SpringApplication.run(FitFeedApiApplication.class, args);
	}

}

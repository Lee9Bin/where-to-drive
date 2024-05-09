package com.gyub.WhereToDrive;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

@SpringBootApplication
@ServletComponentScan
public class WhereToDriveApplication {

	public static void main(String[] args) {
		SpringApplication.run(WhereToDriveApplication.class, args);
	}

}

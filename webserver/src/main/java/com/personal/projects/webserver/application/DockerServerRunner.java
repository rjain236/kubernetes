package com.personal.projects.webserver.application;

import com.personal.projects.webserver.controller.DockerRestController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

@SpringBootApplication
@Import(value = {DockerRestController.class})
public class DockerServerRunner {

    public static void main(String[] args) {
        SpringApplication.run(DockerServerRunner.class, args);
    }
}

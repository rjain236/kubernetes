package com.personal.projects.webserver.application;

import com.personal.projects.webserver.controller.DockerRestController;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Import;

import java.util.Collections;

@SpringBootApplication
@Import(value = {DockerRestController.class})
public class DockerServerRunner {

    public static void main(String[] args) {
        SpringApplication app = new SpringApplication(DockerServerRunner.class);
        app.setDefaultProperties(Collections
                .singletonMap("server.port", "8083"));
        app.run(args);
    }
}

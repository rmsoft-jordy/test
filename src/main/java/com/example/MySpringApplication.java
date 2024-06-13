package com.example;

import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

public class MySpringApplication {
    public static void main(String[] args) {
        ApplicationContext context = new AnnotationConfigApplicationContext(AppConfig.class);
        MyService myService = context.getBean(MyService.class);
        myService.doSomething();
    }
}

@Configuration
class AppConfig {
    @Bean
    public MyService myService() {
        return new MyService();
    }
}

class MyService {
    public void doSomething() {
        System.out.println("Hello, Spring Framework!");
    }
}

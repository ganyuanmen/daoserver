package com.dao.daoserver;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
@MapperScan("com.dao.daoserver.mapper")
@SpringBootApplication
public class DaoserverApplication {

    public static void main(String[] args) {
        SpringApplication.run(DaoserverApplication.class, args);
        System.out.println("start......");
    }

}

package team.flint.flint;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

import java.util.*;

@SpringBootApplication
@MapperScan("team.flint.flint.core.mapper")
public class FlintApplication {

    public static void main(String[] args) {
        SpringApplication.run(FlintApplication.class, args);
    }

}

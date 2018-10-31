package pers.liuqing.cloudsys.admin.ui;


import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.feign.EnableFeignClients;

/**
 * Created by liuqinga on 2017/5/27.
 */
@SpringBootApplication
@EnableEurekaClient
@EnableFeignClients
@EnableCircuitBreaker
public class UIBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(UIBootstrap.class).web(true).run(args);    }
}

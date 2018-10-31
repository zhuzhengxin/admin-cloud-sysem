package pers.liuqing.cloudsys.admin.service;

import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-05-25 12:44
 */
//@EnableDiscoveryClient  //激活eureka中的DiscoveryClient实现
@EnableEurekaClient
@EnableHystrix
@SpringBootApplication
@ServletComponentScan("pers.liuqing.cloudsys.admin.service.config.druid")
//@EnableRedisHttpSession
public class AdminBootstrap {
    public static void main(String[] args) {
        new SpringApplicationBuilder(AdminBootstrap.class).web(true).run(args);    }
}

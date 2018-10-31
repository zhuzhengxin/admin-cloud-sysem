package pers.liuqing.cloudsys.admin.center;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.netflix.eureka.server.EnableEurekaServer;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-05-25 12:44
 */
@EnableEurekaServer  //启动一个服务注册中心提供给其他应用进行对话
@SpringBootApplication
@EnableZuulProxy
public class CenterBootstrap {
    public static void main(String[] args) {
        SpringApplication.run(CenterBootstrap.class, args);
    }
}
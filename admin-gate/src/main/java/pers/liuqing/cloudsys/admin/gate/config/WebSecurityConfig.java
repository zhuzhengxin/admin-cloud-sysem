package pers.liuqing.cloudsys.admin.gate.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import pers.liuqing.cloudsys.admin.gate.jwt.JwtAuthenticationTokenFilter;
import pers.liuqing.cloudsys.admin.gate.service.GateUserDetailsService;

/**
 * ${DESCRIPTION}
 *
 * @author liuqinga
 * @create 2017-06-02 12:02
 */
@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

  @Autowired
  private GateUserDetailsService detailsService;

  @Override
  protected void configure(HttpSecurity http) throws Exception {

    http.formLogin().loginPage("/login").defaultSuccessUrl("/admin/index").permitAll().and()
        .logout().logoutSuccessUrl("/login").invalidateHttpSession(true).and().authorizeRequests()
        .antMatchers("/**/*.css", "/img/**", "/**/*.js","/api/**") // 放开"/api/**",通过oauth2.0来鉴权
        .permitAll().and().authorizeRequests().antMatchers("/**").authenticated();
    http.csrf().disable();
    http.headers().frameOptions().disable();
    http.httpBasic();
    // 添加JWT filter
    http .addFilterBefore(authenticationTokenFilterBean(), UsernamePasswordAuthenticationFilter.class);

    // 禁用缓存
    http.headers().cacheControl();
  }

  @Override
  public void configure(AuthenticationManagerBuilder auth) throws Exception {
    auth.userDetailsService(detailsService).passwordEncoder(new BCryptPasswordEncoder());
  }
  @Bean
  public JwtAuthenticationTokenFilter authenticationTokenFilterBean() throws Exception {
    return new JwtAuthenticationTokenFilter();
  }
}

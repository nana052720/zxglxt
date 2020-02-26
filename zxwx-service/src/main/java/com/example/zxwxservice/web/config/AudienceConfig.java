package com.example.zxwxservice.web.config;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 11:22
 */
@PropertySource("classpath:config/audience.properties")
@ConfigurationProperties(prefix = "web")
@Component
@Data
public class AudienceConfig {

    private Integer expiresSecond;
    private String issuer;
    private String base64Secret;
}

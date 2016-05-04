package com.boidea.framework.core.datasource;

import java.util.Properties;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanInitializationException;
import org.springframework.beans.factory.config.ConfigurableListableBeanFactory;
import org.springframework.beans.factory.config.PropertyPlaceholderConfigurer;
import com.boidea.framework.util.DesUtil;

public class EncryptablePropertyPlaceholderConfigurer extends PropertyPlaceholderConfigurer {
	public static final String key = "1234432109877890";

	protected void processProperties(ConfigurableListableBeanFactory beanFactory, Properties props)
		throws BeansException {
			try {
				DesUtil des = new DesUtil();
				String username = props.getProperty("jdbc.username");
				if (username != null) {
					props.setProperty("jdbc.username", des.Decrypt(username, des.hex2byte(key)));
				}
				
				String password = props.getProperty("jdbc.password");
				if (password != null) {
					props.setProperty("jdbc.password", des.Decrypt(password, des.hex2byte(key)));
				}
				
				String url = props.getProperty("jdbc.url");
				if (url != null) {
					props.setProperty("jdbc.url", des.Decrypt(url, des.hex2byte(key)));
				}
				
				super.processProperties(beanFactory, props);
			} catch (Exception e) {
				e.printStackTrace();
				throw new BeanInitializationException(e.getMessage());
			}
		}
	}

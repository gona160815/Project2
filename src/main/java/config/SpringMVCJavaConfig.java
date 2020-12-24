package main.java.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.oxm.jaxb.Jaxb2Marshaller;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.DefaultServletHandlerConfigurer;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.ContentNegotiatingViewResolver;
import org.springframework.web.servlet.view.InternalResourceViewResolver;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

import com.fasterxml.jackson.annotation.JsonAutoDetect.Visibility;
import com.fasterxml.jackson.annotation.PropertyAccessor;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
@EnableWebMvc
@ComponentScan(basePackages = "main.java")
@EnableAspectJAutoProxy
public class SpringMVCJavaConfig implements WebMvcConfigurer {

	@Override
	public void configureDefaultServletHandling(DefaultServletHandlerConfigurer configurer) {
		configurer.enable();
	}

	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver myViewResolver = new InternalResourceViewResolver();
		myViewResolver.setPrefix("/WEB-INF/pages/");
		myViewResolver.setSuffix(".jsp");
		myViewResolver.setOrder(2);
		return myViewResolver;
	}

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		registry.addResourceHandler("/image/**").addResourceLocations("/WEB-INF/pages/image/");
		registry.addResourceHandler("/css/**").addResourceLocations("/WEB-INF/pages/assets/css/");
		registry.addResourceHandler("/js/**").addResourceLocations("/WEB-INF/pages/assets/js/");
		registry.addResourceHandler("/img/**").addResourceLocations("/WEB-INF/pages/assets/img/");
		registry.addResourceHandler("/fonts/**").addResourceLocations("/WEB-INF/pages/assets/fonts/");
		registry.addResourceHandler("/jsp/**").addResourceLocations("/WEB-INF/pages/");
//		registry.addResourceHandler("/**").addResourceLocations("/WEB-INF/pages/");

	}
	
	@Bean
	public CommonsMultipartResolver multipartResolver() {
		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver();
		multipartResolver.setDefaultEncoding("UTF-8");
		return multipartResolver;
	}
	
	@Bean
	public ObjectMapper jsonMapper() {
		ObjectMapper jsonMapper = new ObjectMapper();
		jsonMapper.setVisibility(PropertyAccessor.FIELD,Visibility.ANY);
		return jsonMapper;
	}
	
//	@Bean
//	public MappingJackson2JsonView jsonView() {
//		MappingJackson2JsonView jsonView = new MappingJackson2JsonView();
//		jsonView.setPrettyPrint(true);
//		return jsonView;
//	}
//	
//	@Bean
//	public Jaxb2Marshaller jaxbMarshaller() {
//		Jaxb2Marshaller jaxbMarshaller = new Jaxb2Marshaller();
//		jaxbMarshaller.setClassesToBeBound(tw.jackeyhsu.model.House.class);
//		return jaxbMarshaller;
//	}
//	
//	public ContentNegotiatingViewResolver cnViewResolver() {
//		ContentNegotiatingViewResolver cnViewResolver = new ContentNegotiatingViewResolver();
//		cnViewResolver.setDefaultViews(jsonView());
//		
//		
//		
//	}
	
	
}

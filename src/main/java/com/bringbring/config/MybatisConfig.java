package com.bringbring.config;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
public class MybatisConfig {

    // 리턴하는 객체를 빈으로 등록
    @Bean
    public SqlSessionFactory sqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean sessionFactory = new SqlSessionFactoryBean();
        sessionFactory.setDataSource(dataSource);

        //매퍼등록 자동화
        Resource[] res = new PathMatchingResourcePatternResolver().getResources("classpath:mybatis/mappers/*Mapper.xml");
        sessionFactory.setMapperLocations(res);
        sessionFactory.setTypeAliasesPackage("com.bringbring");

        // resultMap 대신 자동으로 매핑 
        org.apache.ibatis.session.Configuration configuration = new org.apache.ibatis.session.Configuration();
        configuration.setMapUnderscoreToCamelCase(true);
        configuration.setCallSettersOnNulls(false);
        configuration.setJdbcTypeForNull(null);
        sessionFactory.setConfiguration(configuration);

        return sessionFactory.getObject();
    }
}

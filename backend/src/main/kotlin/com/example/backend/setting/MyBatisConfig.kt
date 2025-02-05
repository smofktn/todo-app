package com.example.backend.setting

import org.mybatis.spring.SqlSessionFactoryBean
import org.mybatis.spring.annotation.MapperScan
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.core.io.DefaultResourceLoader
import org.springframework.core.io.support.ResourcePatternUtils
import java.io.IOException
import javax.sql.DataSource

@Configuration
@MapperScan("com.example.backend.mapper")
class MyBatisConfig {
    @Bean
    @Throws(IOException::class)
    fun sqlSessionFactoryBean(dataSource: DataSource?): SqlSessionFactoryBean {
        val factory = SqlSessionFactoryBean()
        factory.setDataSource(dataSource)

        val resolver = ResourcePatternUtils.getResourcePatternResolver(DefaultResourceLoader())

        // MyBatis のコンフィグレーションファイル
        factory.setConfigLocation(resolver.getResource("classpath:mybatis-config.xml"))

        return factory
    }
}

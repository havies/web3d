<?xml version="1.0" encoding="UTF-8"?>
<!-- 业务系统 -->
<beans xmlns="http://www.springframework.org/schema/beans"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xmlns:aop="http://www.springframework.org/schema/aop"
	xmlns:tx="http://www.springframework.org/schema/tx"
	xsi:schemaLocation="
	http://www.springframework.org/schema/beans http://www.springframework.org/schema/beans/spring-beans-2.5.xsd
	http://www.springframework.org/schema/aop http://www.springframework.org/schema/aop/spring-aop-2.5.xsd
	http://www.springframework.org/schema/tx http://www.springframework.org/schema/tx/spring-tx-2.5.xsd">
	
	<!-- ${zTable.comment}-->
	<bean id="${zTable.className?lower_case}Service" parent="baseTransactionProxyBF">
		<property name="target">
			<bean class="${packageName}.service.impl.${zTable.className}ServiceImpl">
			    <property name="bfDao" ref="bfDao" />
			</bean>
		</property>
	</bean>
	
	
</beans>

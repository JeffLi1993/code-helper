<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${daoPackage}.${className_Java}DAO">
	<resultMap id="BaseResultMap" type="${pojoPackage}.${className_Java}DO">
	<#list tableCarrays as tableCarray>
		<result column="${tableCarray.carrayName_x}" property="${tableCarray.carrayName}" />
	</#list>
	</resultMap>
	
	<parameterMap id="${className_Java}DO" type="${pojoPackage}.${className_Java}DO"/>
	
	<sql id="Base_Column_List">
		id, ${stringCarrayNames3}
	</sql>
	
	<sql id="whereCondition">
		<trim prefix="WHERE" prefixOverrides="AND|OR">
			<#list tableCarrays as tableCarray>
			<if test="${tableCarray.carrayName}!=null">
				and ${tableCarray.carrayName_x} = ${prefix}${tableCarray.carrayName}}
			</if>
			</#list>
		</trim>
	</sql>
	
	<insert id="insert" parameterMap="${className_Java}DO" useGeneratedKeys="true" keyProperty="id">
		insert into ${className_x} (
			${stringCarrayNames3}
		)
		values (
			${stringCarrayNames4}
		)
	</insert>
	
	<delete id="deleteById" parameterType="java.lang.Long">
		delete from ${className_x} where id = ${prefix}id}
	</delete>
	
	<update id="updateById" parameterMap="${className_Java}DO">
        update ${className_x} set 
        <#list tableCarrays as tableCarray>
        	<#if tableCarray.carrayName!="id"&&tableCarray.carrayName!="createTime"&&tableCarray.carrayName!="updateTime">
	        	<if test="${tableCarray.carrayName}!=null">
					${tableCarray.carrayName_x} = ${prefix}${tableCarray.carrayName}},
				</if>
			</#if>
		</#list>
		update_time = now()
        where id = ${prefix}id}        		
	</update>
	
	<select id="findById" resultMap="BaseResultMap" parameterType="java.lang.Long">
		select
		<include refid="Base_Column_List" />
		from ${className_x}
		where id = ${prefix}id}
	</select>
	
	<select id="findByCondition" resultMap="BaseResultMap" parameterMap="${className_Java}DO">
		select
		<include refid="Base_Column_List" />
		from ${className_x}
		<include refid="whereCondition" />
	</select>
</mapper>
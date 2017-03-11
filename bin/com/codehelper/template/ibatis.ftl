<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE sqlMap PUBLIC "-//iBATIS.com//DTD SQL Map 2.0//EN"
"http://www.ibatis.com/dtd/sql-map-2.dtd">

<sqlMap namespace="${className_d}">
	<typeAlias alias="${className_x}" type="${pojoPackage}.${className_d}" />	
	
	<insert id="insert" parameterClass="${className_x}">
		<![CDATA[
		INSERT INTO ${className} (
			${stringCarrayNames3}
		) VALUES (
			${stringCarrayNames4}
		)
		]]>
	</insert>
	
	<select id="getAll" parameterClass="java.util.Map" resultClass="${className_x}">
	<![CDATA[
		SELECT
		${stringCarrayNames3}
		FROM ${className}
	]]>
	</select>
	
	<select id="countAll" parameterClass="java.util.Map" resultClass="java.lang.Integer">
	<![CDATA[
		SELECT
		COUNT(*) 
		FROM ${className}
		WHERE
		1
	]]>
	</select>
	
	<#list tableIndexs as tableIndex>
	<#if tableIndex.unique>
	<#if tableIndex.indexName=="PRIMARY">
	<select id="getByKey" parameterClass="java.util.Map" resultClass="${className_x}">
	<![CDATA[
		SELECT
		${stringCarrayNames3}
		FROM ${className}
		WHERE
		${tableIndex.stringCarrayNames5}
	]]>
	</select>
	
	<update id="update" parameterClass="${className_x}">
		<![CDATA[
		UPDATE ${className} 
		SET
		${stringCarrayNames5}
		WHERE
		${tableIndex.stringCarrayNames5}
		]]>
	</update>
	
	<delete id="delete" parameterClass="${className_x}">
		<![CDATA[
		DELETE ${className} 
		WHERE
		${tableIndex.stringCarrayNames5}
		]]>
	</delete>
	
	<#else>
	<select id="getBy${tableIndex.stringCarrayNames1}" parameterClass="java.util.Map" resultClass="${className_x}">
	<![CDATA[
		SELECT
		${stringCarrayNames3}
		FROM ${className}
		WHERE
		${tableIndex.stringCarrayNames5}
	]]>
	</select>
	</#if>
	
	<#else>
	<select id="getBy${tableIndex.stringCarrayNames1}" parameterClass="java.util.Map" resultClass="${className_x}">
	<![CDATA[
		SELECT
		${stringCarrayNames3}
		FROM ${className}
		WHERE
		${tableIndex.stringCarrayNames5}
	]]>
	</select>
	
	<select id="countBy${tableIndex.stringCarrayNames1}" parameterClass="java.util.Map" resultClass="java.lang.Integer">
	<![CDATA[
		SELECT
		COUNT(*) 
		FROM ${className}
		WHERE
		${tableIndex.stringCarrayNames5}
	]]>
	</select>
	</#if>
	</#list>
</sqlMap>

package ${pojoPackage};

/**
 * 类${className_Java}Param.java的实现描述：${tableComment}
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
public class ${className_Java}Param {
    <#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName!="createTime"&&tableCarray.carrayName!="updateTime">
    /**
     * ${tableCarray.comment}
     */
    <#if tableCarray.carrayName=="id">
    private ${tableCarray.carrayType} ${className}Id;
    <#else>
    private ${tableCarray.carrayType} ${tableCarray.carrayName};
    </#if>
    </#if>
    </#list>

    public ${className_Java}Param() {
    }

    <#list tableCarrays as tableCarray>
    <#if tableCarray.carrayName!="createTime"&&tableCarray.carrayName!="updateTime">
    <#if tableCarray.carrayName=="id">
    public ${tableCarray.carrayType} get${className_Java}Id(){
        return ${className}Id;
    }

    public void set${className_Java}Id(${tableCarray.carrayType} ${className}Id){
        this.${className}Id = ${className}Id;
    }
    <#else>
    public ${tableCarray.carrayType} get${tableCarray.carrayName_Java}(){
        return ${tableCarray.carrayName};
    }

    public void set${tableCarray.carrayName_Java}(${tableCarray.carrayType} ${tableCarray.carrayName}){
        this.${tableCarray.carrayName} = ${tableCarray.carrayName};
    }
    </#if>
    </#if>
    </#list>
}
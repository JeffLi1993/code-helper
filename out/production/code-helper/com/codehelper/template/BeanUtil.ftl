package ${pojoPackage};

/**
 * 类${className_Java}BeanUtil.java的实现描述：${tableComment}工具类
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
public class ${className_Java}BeanUtil {

    private ${className_Java}BeanUtil(){
    }

    public static ${className_Java}Model ${className}ParamToModel(${className_Java}Param srcObj) {
        if (srcObj == null) {
            return null;
        }
        ${className_Java}Model targetObj = new ${className_Java}Model();
        <#list tableCarrays as tableCarray>
        <#if tableCarray.carrayName!="createTime"&&tableCarray.carrayName!="updateTime">
        <#if tableCarray.carrayName=="id">
        targetObj.set${tableCarray.carrayName_Java}(srcObj.get${className_Java}Id());//${tableCarray.comment}
        <#else>
        targetObj.set${tableCarray.carrayName_Java}(srcObj.get${tableCarray.carrayName_Java}());//${tableCarray.comment}
        </#if>
        </#if>
        </#list>
        return targetObj;
    }

    public static ${className_Java}Param ${className}ModelToParam(${className_Java}Model srcObj) {
        if (srcObj == null) {
            return null;
        }
        ${className_Java}Param targetObj = new ${className_Java}Param();
        <#list tableCarrays as tableCarray>
        <#if tableCarray.carrayName!="createTime"&&tableCarray.carrayName!="updateTime">
        <#if tableCarray.carrayName=="id">
        targetObj.set${className_Java}Id(srcObj.get${tableCarray.carrayName_Java}());//${tableCarray.comment}
        <#else>
        targetObj.set${tableCarray.carrayName_Java}(srcObj.get${tableCarray.carrayName_Java}());//${tableCarray.comment}
        </#if>
        </#if>
        </#list>
        return targetObj;
    }
}
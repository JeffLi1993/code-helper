package ${pojoPackage};

/**
 * 类${className_Java}DO.java的实现描述：${tableComment}
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
public class ${className_Java}DO {
    <#list tableCarrays as tableCarray>
    /**
     * ${tableCarray.comment}
     */
    private ${tableCarray.carrayType} ${tableCarray.carrayName};
    </#list>

    public ${className_Java}DO() {
    }

    <#list tableCarrays as tableCarray>
    public ${tableCarray.carrayType} get${tableCarray.carrayName_Java}(){
        return ${tableCarray.carrayName};
    }

    public void set${tableCarray.carrayName_Java}(${tableCarray.carrayType} ${tableCarray.carrayName}){
        this.${tableCarray.carrayName} = ${tableCarray.carrayName};
    }
    </#list>
}
package ${daoPackage};

import org.springframework.stereotype.Repository;

import com.xunkai.athena.common.base.AbstractBaseDAO;
import com.xunkai.athena.beauty.dal.dao.${className_Java}Dao;
import com.xunkai.athena.beauty.dal.model.${className_Java};
/**
 * ${tableComment} DaoImpl实现类
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
@Repository
public class ${className_Java}DaoImpl extends AbstractBaseDAO<${className_Java}> implements
        ${className_Java}Dao {

    @Override
    protected Class<${className_Java}> getModelClass() {
        return ${className_Java}.class;
    }

    <#list tableIndexs as tableIndex>
        <#if tableIndex.indexName!='PRIMARY'&&tableIndex.unique>
	/**
     * 查询${className_x}数量
     * @param ${className}
     * @return
     */
    @Override
    public Integer countBy${tableIndex.stringCarrayNames1}(${className_Java} ${className}){
        return getSqlSesstion().selectOne("countBy${tableIndex.stringCarrayNames1}", ${className});
    }
        </#if>
    </#list>
}
package ${daoPackage};

import ${pojoPackage}.${className_Java}Model;

/**
 * ${tableComment} DAO接口
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
public interface ${className_Java}Mapper {

    /**
     * 
     * 方法insert的功能描述：新增${tableComment}
     * 
     * @param record
     * @return int
     * <PRE>
     * author ${author} 
     * Date ${createDate}
     * </PRE>
     */
    int insert(${className_Java}Model record);

    /**
     * 
     * 方法deleteById的功能描述：根据Id删除${tableComment}
     * 
     * @param id
     * @return int
     * <PRE>
     * author ${author} 
     * Date ${createDate}
     * </PRE>
     */
    int deleteById(Long id);

    /**
     * 
     * 方法updateById的功能描述：根据Id更新${tableComment}
     * 
     * @param ${className_Java}Model
     * @return int
     * <PRE>
     * author ${author} 
     * Date ${createDate}
     * </PRE>
     */
    int updateById(${className_Java}Model record);

    /**
     * 
     * 方法findById的功能描述：根据Id查询${tableComment}
     * 
     * @param id
     * @return ${className_Java}Model
     * <PRE>
     * author ${author} 
     * Date ${createDate}
     * </PRE>
     */
    ${className_Java}Model findById(Long id);
}
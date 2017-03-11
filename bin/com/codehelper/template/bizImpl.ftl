package ${bizPackage};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ${bizPackage}.${className_Java}Service;
import ${daoPackage}.${className_Java}DAO;
import com.mishi.common.util.log.AppLog;
import com.mishi.common.util.log.AppLogFactory;

/**
 * ${tableComment} ServiceImpl实现类
 * 
 * @Author ${author}
 * @Date ${createDate}
 */
@Service
public class ${className_Java}ServiceImpl implements ${className_Java}Service {

    private static final AppLog       log = AppLogFactory.getLogger(${className_Java}ServiceImpl.class);

    @Autowired
    private ${className_Java}DAO ${className}DAO;
}
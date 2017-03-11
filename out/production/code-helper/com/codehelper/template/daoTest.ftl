package ${daoTestPackage}.dao;

/**
 * 
 * 类${className_Java}MapperTest.java的实现描述：${tableComment}Mapper层单元测试
 * @author ${author}
 * @Date ${createDate}
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:test/test_spring-context.xml" })
@TransactionConfiguration(transactionManager = "mysqlTransactionManager", defaultRollback = true)
public class ${className_Java}MapperTest {

    @Autowired
    ${className_Java}Mapper ${className}Mapper;

    public ${className_Java}Model get${className_Java}Model() {
        ${className_Java}Model entity = new ${className_Java}Model();
        <#list tableCarrays as tableCarray>
		entity.set${tableCarray.carrayName_Java}(1);
		</#list>
        return entity;
    }

    // 测试添加${tableComment}
    @Test
    @Transactional
    @Rollback(true)
    public void testInsert() {
        ${className_Java}Model entity = get${className_Java}Model();
        int res = 0;
        try {
            res = ${className}Mapper.insert(entity);
            Assert.assertTrue(res > 0);
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail();
        }
    }
    
    // 测试根据Id删除${tableComment}
    @Test
    @Transactional
    @Rollback(true)
    public void testDeleteById() {
        ${className_Java}Model entity = get${className_Java}Model();

        try {
            int res = ${className}Mapper.insert(entity);
            Assert.assertTrue(res > 0);
            res = ${className}Mapper.deleteById(entity.getId());
            Assert.assertTrue(res > 0);
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail();
        }
    }
    
    // 测试根据Id更新${tableComment}
    @Test
    @Transactional
    @Rollback(true)
    public void testUpdateById() {
        ${className_Java}Model entity = get${className_Java}Model();

        try {
            int res = ${className}Mapper.insert(entity);
            Assert.assertTrue(res > 0);
            res = ${className}Mapper.updateById(entity);
            Assert.assertTrue(res > 0);
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail();
        }
    }

    // 测试根据Id查询${tableComment}
    @Test
    @Transactional
    @Rollback(true)
    public void testFindById() {
        ${className_Java}Model entity = get${className_Java}Model();

        ${className_Java}Model result = null;
        try {
            int res = ${className}Mapper.insert(entity);
            Assert.assertTrue(res > 0);
            result = ${className}Mapper.findById(entity.getId());
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail();
        }
        Assert.assertNotNull(result);
        Assert.assertEquals(result.getId(), entity.getId());
    }
}
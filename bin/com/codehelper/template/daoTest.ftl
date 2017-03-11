package ${daoTestPackage}.dao;

/**
 * 
 * 类${className_Java}DAOTest.java的实现描述：${tableComment}DAO层单元测试
 * @author ${author}
 * @Date ${createDate}
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = { "classpath*:test/test_spring-context.xml" })
@TransactionConfiguration(transactionManager = "mysqlTransactionManager", defaultRollback = true)
public class ${className_Java}DAOTest {

    @Autowired
    ${className_Java}DAO ${className}DAO;

    public ${className_Java}DO get${className_Java}DO() {
        ${className_Java}DO entity = new ${className_Java}DO();
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
        ${className_Java}DO entity = get${className_Java}DO();
        int res = 0;
        try {
            res = ${className}DAO.insert(entity);
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
        ${className_Java}DO entity = get${className_Java}DO();

        try {
            int res = ${className}DAO.insert(entity);
            Assert.assertTrue(res > 0);
            res = ${className}DAO.deleteById(entity.getId());
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
        ${className_Java}DO entity = get${className_Java}DO();

        try {
            int res = ${className}DAO.insert(entity);
            Assert.assertTrue(res > 0);
            res = ${className}DAO.updateById(entity);
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
        ${className_Java}DO entity = get${className_Java}DO();

        ${className_Java}DO result = null;
        try {
            int res = ${className}DAO.insert(entity);
            Assert.assertTrue(res > 0);
            result = ${className}DAO.findById(entity.getId());
        } catch (Exception e) {
            e.printStackTrace();
            Assert.fail();
        }
        Assert.assertNotNull(result);
        Assert.assertEquals(result.getId(), entity.getId());
    }
}
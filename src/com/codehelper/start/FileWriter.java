package com.codehelper.start;

import java.sql.Connection;
import java.util.List;

import com.codehelper.factory.ConnectionFactory;
import com.codehelper.factory.FileWriterFactory;
import com.codehelper.pojo.DataSourceConfig;
import com.codehelper.pojo.Table;
import com.codehelper.util.ConfigUtils;
import com.codehelper.util.TableUtils;

import freemarker.template.Configuration;

public class FileWriter {

    private DataSourceConfig cfg = new DataSourceConfig(DataSourceConfig.MYSQL);

    public void create() throws Exception {
        Connection conn = ConnectionFactory.getConnection();
        List<Table> tables = TableUtils.getTables(conn);
        Configuration configuration = FileWriterFactory.getConfiguration();
        for (Table table : tables) {
            if (Boolean.valueOf(ConfigUtils.getConfig("create.pojo"))) {
                outPojo(table, configuration);
            }
            if (Boolean.valueOf(ConfigUtils.getConfig("create.dao"))) {
                outDao(table, configuration);
            }
            if (Boolean.valueOf(ConfigUtils.getConfig("create.dao.test"))) {
                outDaoTest(table, configuration);
            }

            if (cfg.getDataSourceType() != 0 && Boolean.valueOf(ConfigUtils.getConfig("create.mapper"))) {
                outXml(table, cfg, configuration);
            }
        }
    }

    /**
     * 生成POJO对象
     * 
     * @param table
     */
    public void outPojo(Table table, Configuration configuration) {
        FileWriterFactory.dataSourceOut(configuration, "pojo.ftl", table, table.getClassName_Java() + "Model.java",
                                        FileWriterFactory.POJO);

        FileWriterFactory.dataSourceOut(configuration, "bo.ftl", table, table.getClassName_Java() + "Param.java",
                                        FileWriterFactory.POJO);

        FileWriterFactory.dataSourceOut(configuration, "BeanUtil.ftl", table, table.getClassName_Java()
                                                                              + "BeanUtil.java", FileWriterFactory.POJO);
    }

    /**
     * 生成DAO接口对象
     * 
     * @param table
     */
    public void outDao(Table table, Configuration configuration) {
        FileWriterFactory.dataSourceOut(configuration, "dao.ftl", table, table.getClassName_Java() + "Mapper.java",
                                        FileWriterFactory.DAO);
    }

    /**
     * 生成DAO单元测试
     * 
     * @param table
     */
    public void outDaoTest(Table table, Configuration configuration) {
        FileWriterFactory.dataSourceOut(configuration, "daoTest.ftl", table,
                                        table.getClassName_Java() + "MapperTest.java", FileWriterFactory.DAOTEST);
    }



    /**
     * 生成xml文件
     * 
     * @param table
     */
    public void outXml(Table table, DataSourceConfig cfg, Configuration configuration) {
        String fileName = "";
        switch (cfg.getDataSourceType()) {
            case DataSourceConfig.MYSQL:
                fileName = "mybatis.ftl";
                break;
            case DataSourceConfig.SQLSERVER:
                fileName = "ibatis_sqlserver.xml";
                break;
        }

        FileWriterFactory.dataSourceOut(configuration, fileName, table, table.getClassName_Java() + "Mapper.xml",
                                        FileWriterFactory.XML);
    }
}

package com.codehelper.factory;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;

import com.codehelper.pojo.Table;
import com.codehelper.util.ConfigUtils;

import freemarker.template.Configuration;
import freemarker.template.DefaultObjectWrapper;
import freemarker.template.Template;
import freemarker.template.TemplateException;

public class FileWriterFactory {

    private static Configuration cfg;
    public static final int      POJO    = 1;
    public static final int      DAO     = 2;
    public static final int      DAOIMPL = 3;
    public static final int      BIZ     = 4;
    public static final int      BIZIMPL = 5;
    public static final int      XML     = 6;
    public static final int      ACTION  = 7;
    public static final int      VIEW    = 8;
    public static final int      DAOTEST    = 9;
    public static final String   url     = FileWriterFactory.class.getResource("/").getPath()
                                           + ConfigUtils.getConfig("templateUrl");

    public static Configuration getConfiguration() {
        if (cfg == null) {
            cfg = new Configuration();
            File file = new File(url);
            try {
                cfg.setDirectoryForTemplateLoading(file);
                cfg.setObjectWrapper(new DefaultObjectWrapper());
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        return cfg;
    }

    /**
     * 
     * @param cfg
     *            解析对象
     * @param templateName
     *            模板名称
     * @param root
     *            数据对象
     * @param packageName
     *            包名称
     * @param fileName
     *            生成文件名称
     */
    public static void dataSourceOut(Configuration cfg, String templateName, Table table,
                                     String fileName, int type) {

        Template temp = null;
        try {
            temp = cfg.getTemplate(templateName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Writer out = null;
        try {
            String packageName = "";
            switch (type) {
                case POJO:
                    packageName = table.getPojoPackage();
                    break;
                case DAO:
                    packageName = table.getDaoPackage();
                    break;
                case BIZ:
                    packageName = table.getBizPackage();
                    break;
                case XML:
                    packageName = table.getXmlPackage();
                    break;
                case DAOTEST:
                    packageName = table.getDaoTestPackage();
                    break;
            }
            packageName = packageName.replace(".", "/");
            String url = "src/" + packageName + "/" + fileName;
            File file = new File(url);
            out = new FileWriter(file);
            temp.process(table, out);
            //temp.process(table, new OutputStreamWriter(System.out));
            out.flush();
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static void dataSourceOut(Configuration cfg, String templateName, Object root,
                                     String fileName) {

        Template temp = null;
        try {
            temp = cfg.getTemplate(templateName);
        } catch (IOException e) {
            e.printStackTrace();
        }
        Writer out = null;
        try {
            if (fileName != null && !"".equals(fileName)) {
                String packageName = "";
                packageName = packageName.replace(".", "/");
                String url = "src/" + packageName + "/" + fileName;
                File file = new File(url);
                out = new FileWriter(file);
                temp.process(root, out);
            }
            //temp.process(root, new OutputStreamWriter(System.out));
            out.flush();
        } catch (TemplateException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                try {
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
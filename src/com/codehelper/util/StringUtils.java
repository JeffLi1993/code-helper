package com.codehelper.util;

public class StringUtils {
    /**
     * 首字母大写
     * @param s
     * @return
     */
    public static final String upperFirst(String s) {
        int len = s.length();
        if (len <= 0)
            return "";

        StringBuffer sb = new StringBuffer();
        sb.append(s.substring(0, 1).toUpperCase());
        sb.append(s.substring(1, len));
        return sb.toString();
    }

    /**
     * 首字母小写
     * @param s
     * @return
     */
    public static final String lowerFirst(String s) {
        int len = s.length();
        if (len <= 0)
            return "";

        StringBuffer sb = new StringBuffer();
        sb.append(s.substring(0, 1).toLowerCase());
        sb.append(s.substring(1, len));
        return sb.toString();
    }

    /**
     * 数据库表名转化为Java属性名
     * @param str
     * @return
     */
    public static String tableFieldName2JavaFieldName(String str) {
        String strTemp = tableName2JavaBeanName(str);
        return lowerFirst(strTemp);
    }

    /**
     * 数据库表名转化为Java类名
     * @param str
     * @return
     */
    public static String tableName2JavaBeanName(String str) {
        String[] strs = str.split("_");
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < strs.length; i++) {
            sb.append(upperFirst(strs[i]));
        }
        return sb.toString();
    }
}

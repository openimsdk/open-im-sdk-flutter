package io.openim.flutter_openim_sdk.util;


import android.text.TextUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;

import java.util.List;
import java.util.Map;

import static com.alibaba.fastjson.JSON.parseObject;

public class JsonUtil {

    public static String toString(Object object) {
        if (object == null) {
            return "";
        }
        try {
            return JSON.toJSONString(object);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return "";
    }


    public static <T> T toObj(String jsonData, Class<T> clazz) {
        T t = null;
        if (TextUtils.isEmpty(jsonData)) {
            return null;
        }
        try {
            t = parseObject(jsonData, clazz);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return t;
    }


    public static <T> List<T> toList(String jsonData, Class<T> clazz) {
        List<T> list = null;
        try {
            list = JSON.parseArray(jsonData, clazz);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }


    /**
     * json转化为Map  fastjson 使用方式
     */
    public static Map toMap(String jsonData) {
        if (TextUtils.isEmpty(jsonData)) {
            return null;
        }
        Map map = null;
        try {
            map = parseObject(jsonData, new TypeReference<Map>() {
            });
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }
}
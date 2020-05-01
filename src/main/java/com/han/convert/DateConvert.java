package com.han.convert;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @ClassName DateConvert
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 22:46
 */
public class DateConvert implements Converter<String, Date> {
    @Override
    public Date convert(String stringDate) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return sdf.parse(stringDate);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}

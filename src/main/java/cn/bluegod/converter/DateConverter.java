package cn.bluegod.converter;

import org.springframework.core.convert.converter.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @description:
 * @author: Mr.Fu
 * @create: 2018-09-27 10:01
 * @Version V1.0
 */
public class DateConverter implements Converter<String, Date> {
    private final String  pattern="yyyy-MM-dd";
    public Date convert(String s) {
        SimpleDateFormat format=new SimpleDateFormat(pattern);
        try {
            return format.parse(s);
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}

package com.example.zxwxservice.web.common;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @Auther: lilun
 * @Date: 2019/3/24 21:43
 */
public class MyDateUtil {
    public final static int Y = Calendar.YEAR;
    public final static int M = Calendar.MONTH;
    public final static int D = Calendar.DATE;
    public final static int HOUR = Calendar.HOUR;
    public final static int MI = Calendar.MINUTE;
    public final static int SECOND = Calendar.SECOND;
    public final static String yyyyMM = "yyyy-MM";
    public final static String yyyyMMdd = "yyyy-MM-dd";
    public final static String yyyyMMddHHmmss = "yyyy-MM-dd HH:mm:ss";

    /**
     * 格式化日期
     * @param formatString
     * @param d
     * @return
     */
    public static Date toFormat( String formatString, Date d){
        String sdate = formatToString(formatString,d);
        return MyDateUtil.stringToDate(sdate);
    }

    public static String formatToString(String formatString, Date d){
        SimpleDateFormat format = new SimpleDateFormat(formatString);
        String sdate = format.format(d);
        return sdate;
    }

    public static Date stringToDate(String str){
        return stringToDate(str,"yyyy-MM-dd");
    }

    public static Date stringToDate(String str,String formatString){
        //str = str.replace("-", "");
        DateFormat format1 = new SimpleDateFormat(formatString);
        Date date = null;
        if(str == null) return date;
        try {
            if(formatString.indexOf("/") >= 0) str = str.replace("-","/");
            date = format1.parse(str);
        }catch(ParseException e) {
            date = null;
        }
        return date;
    }
    /**
     * 日期相加减
     * @param date
     * @param w 类型
     * @param f 数量ֵ
     * @return
     */
    public static Date diff(Date date, int w, float f)
    {
        int n = Double.valueOf(Math.floor(f)).intValue();
        int l = Double.valueOf(Math.floor((f - n) * 60)).intValue();
        Calendar c = Calendar.getInstance();
        c.setTime(date);

        if (Y == w)
            c.add(1, n);
        else if (M == w)
            c.add(M, n);
        else if (D == w)
            c.add(D, n);
        else if (HOUR == w) {
            c.add(HOUR, n);
            c.add(MI, l);
        }
        else if (MI == w){
            c.add(MI,n);
        }else if(SECOND == w)
        {
            c.add(SECOND,n);
        }

        return c.getTime();
    }
    /**
     * 日期比较大小:前者大返回1,小则为-1
     * @param d1
     * @param d2
     * @return
     */
    public static int comp(Date d1, Date d2){
        String s1 = MyDateUtil.getDateString(d1);
        String s2 = MyDateUtil.getDateString(d2);
        return s1.compareTo(s2);
    }
    private static String getDateString(Date d)
    {
        Calendar c = Calendar.getInstance();
        c.setTime(d);

        return String.valueOf(c.get(Calendar.YEAR))+
                enterChar(c.get(Calendar.MONTH) + "",2,"0") +
                enterChar(c.get(Calendar.DATE) + "",2,"0") +
                enterChar(c.get(Calendar.HOUR) + "",2,"0") +
                enterChar(c.get(Calendar.MINUTE) + "",2,"0")+
                enterChar(c.get(Calendar.SECOND) + "",2,"0");
    }
    private static String enterChar(String s, int len, String c){
        int source = s.length();
        for(int i = 0;i < len - source; i++){
            s = c + s;
        }
        return s;
    }
    public static int getDayWeek(Date date){
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        int dayOfWeek = c.get(Calendar.DAY_OF_WEEK) - 1;//星期天为第一天, 所以减一
        dayOfWeek = dayOfWeek==0 ? 7 : dayOfWeek;
        return dayOfWeek;
    }
    /**
     * 得到上周几的日期
     * @param date
     * @param day
     * @return
     */
    public static Date getLastWeek(Date date, int day){
        int currDay = getDayWeek(date);
        int moreDay = 7 - day + currDay;
        return diff(date,D, -moreDay);
    }

    public static long getDatePoorWithDiff(Date endDate, Date nowDate) {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;

        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();

        return diff;
    }

    public static long getDatePoorWithDay(Date endDate, Date nowDate) {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;

        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();
        // 计算差多少天
        long day = diff / nd;
        return day;
    }

    public static long getDatePoorWithHour(Date endDate, Date nowDate) {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;

        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();

        // 计算差多少小时
        long hour = diff % nd / nh;
        return hour;
    }

    public static long getDatePoorWithMin(Date endDate, Date nowDate) {
        long nd = 1000 * 24 * 60 * 60;
        long nh = 1000 * 60 * 60;
        long nm = 1000 * 60;

        // long ns = 1000;
        // 获得两个时间的毫秒时间差异
        long diff = endDate.getTime() - nowDate.getTime();
        // 计算差多少分钟
        long min = diff % nd % nh / nm;
        return min;
    }

    public static long getDatePoorWithSec(Date endDate, Date nowDate) {
        long a = new Date().getTime();
        long b = endDate.getTime();
        int c = (int)((a - b) / 1000);
        return c;
    }
}

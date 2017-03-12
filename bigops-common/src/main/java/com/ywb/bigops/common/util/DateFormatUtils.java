package com.ywb.bigops.common.util;

import java.text.ParseException;
import java.text.ParsePosition;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Locale;

/**
 * DateFormatUtils.
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class DateFormatUtils {
    public static final String YEAR = "year";
    public static final String MONTH = "month";
    public static final String DAY = "day";
    public static final String HOUR = "hour";
    public static final String MINUTE = "minute";
    public static final String SECOND = "second";
    public static final String WEEK = "week";

    public DateFormatUtils() {
    }

    public static String getFormatedDate() {
        Date date = getCurrentDate();
        SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd");
        return dateFormator.format(date);
    }

    public static String getFormatedDateTime() {
        Date date = getCurrentDate();
        SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormator.format(date);
    }

    public static String getFormatedDateTime(Date date) {
        SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        return dateFormator.format(date);
    }

    public static Date getCurrentDate() {
        return new Date(System.currentTimeMillis());
    }

    public static long getCurrentTimeMillis() {
        return System.currentTimeMillis();
    }

    public static String formatDate(String pattern) {
        Date date = new Date();
        SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);
        String str = dateFormator.format(date);
        return str;
    }

    public static String formatDate(Date date, String pattern) {
        if (date == null) {
            return "";
        } else {
            SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);
            String str = dateFormator.format(date);
            return str;
        }
    }

    public static String formatDate(Date date, String pattern, Locale loc) {
        if (pattern != null && date != null) {
            String newDate = "";
            if (loc == null) {
                loc = Locale.getDefault();
            }

            if (date != null) {
                SimpleDateFormat sdf = new SimpleDateFormat(pattern, loc);
                newDate = sdf.format(date);
            }

            return newDate;
        } else {
            return "";
        }
    }

    public static String convertDateFormat(String dateStr, String patternFrom, String patternTo) {
        if (dateStr != null && patternFrom != null && patternTo != null) {
            String newDate = "";

            try {
                Date e = parseStrToDate(dateStr, patternFrom);
                newDate = formatDate(e, patternTo);
            } catch (Exception var5) {
            }

            return newDate;
        } else {
            return "";
        }
    }

    public static Date parseStrToDate(String dateStr) {
        if (null != dateStr && !"".equals(dateStr)) {
            SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd");
            Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
            return tDate;
        } else {
            return null;
        }
    }

    public static Date parseStrToDateByFormat(String dateStr, String formatStr) {
        if (null != dateStr && !"".equals(dateStr)) {
            SimpleDateFormat dateFormator = new SimpleDateFormat(formatStr);
            Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
            return tDate;
        } else {
            return null;
        }
    }

    public static String parseDateStrToDateTimeStr(String dateStr) {
        if (null != dateStr && !"".equals(dateStr)) {
            SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
            return formatDate(tDate, "yyyy-MM-dd HH:mm:ss");
        } else {
            return null;
        }
    }

    public static Calendar parseStrToCalendar(String dateStr) {
        if (null != dateStr && !"".equals(dateStr)) {
            SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd");
            Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
            Locale loc = Locale.getDefault();
            GregorianCalendar cal = new GregorianCalendar(loc);
            cal.setTime(tDate);
            return cal;
        } else {
            return null;
        }
    }

    public static Date parseStrToDateTime(String dateStr) {
        if (null != dateStr && !"".equals(dateStr)) {
            SimpleDateFormat dateFormator = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
            return tDate;
        } else {
            return null;
        }
    }

    public static Date parseStrToDate(String dateStr, String pattern) {
        if (null != dateStr && !"".equals(dateStr)) {
            SimpleDateFormat dateFormator = new SimpleDateFormat(pattern);
            Date tDate = dateFormator.parse(dateStr, new ParsePosition(0));
            return tDate;
        } else {
            return null;
        }
    }

    public static String addDate(String dateStr, String pattern, int step, String type) {
        if (dateStr == null) {
            return dateStr;
        } else {
            Date date1 = parseStrToDate(dateStr, pattern);
            Locale loc = Locale.getDefault();
            GregorianCalendar cal = new GregorianCalendar(loc);
            cal.setTime(date1);
            if ("week".equals(type)) {
                cal.add(4, step);
            } else if ("year".equals(type)) {
                cal.add(1, step);
            } else if ("month".equals(type)) {
                cal.add(2, step);
            } else if ("day".equals(type)) {
                cal.add(5, step);
            } else if ("hour".equals(type)) {
                cal.add(10, step);
            } else if ("minute".equals(type)) {
                cal.add(12, step);
            } else if ("second".equals(type)) {
                cal.add(13, step);
            }

            return formatDate(cal.getTime(), pattern);
        }
    }

    public static String minusDate(String dateStr, String pattern, int step, String type) {
        return addDate(dateStr, pattern, 0 - step, type);
    }

    public static Date addDay(Date date, int days) {
        if (date == null) {
            return date;
        } else {
            Locale loc = Locale.getDefault();
            GregorianCalendar cal = new GregorianCalendar(loc);
            cal.setTime(date);
            cal.add(5, days);
            return cal.getTime();
        }
    }

    public static Date addMinute(Date date, int minute) {
        if (date == null) {
            return date;
        } else {
            Locale loc = Locale.getDefault();
            GregorianCalendar cal = new GregorianCalendar(loc);
            cal.setTime(date);
            cal.add(12, minute);
            return cal.getTime();
        }
    }

    public static int getDays(Date date1, Date date2) {
        return date1 != null && date2 != null ? (int) ((date2.getTime() - date1.getTime()) / 86400000L) : 0;
    }

    public static int compareDate(String dateStr1, String dateStr2, String pattern) {
        Date date1 = parseStrToDate(dateStr1, pattern);
        Date date2 = parseStrToDate(dateStr2, pattern);
        return date1.compareTo(date2);
    }

    public static String getFirstDayInMonth(String dateStr, String pattern) {
        Calendar cal = parseStrToCalendar(dateStr);
        int month = cal.get(2);
        int day = cal.get(5);
        cal.add(5, 1 - day);
        return formatDate(cal.getTime(), pattern);
    }

    public static String getLastDayInMonth(String dateStr, String pattern) {
        Calendar cal = parseStrToCalendar(dateStr);
        int month = cal.get(2);
        int day = cal.get(5);
        int maxDayInMonth = cal.getActualMaximum(5);
        int step = maxDayInMonth - day;
        cal.add(5, step);
        return formatDate(cal.getTime(), pattern);
    }

    public static String getFirstDayInWeek(String dateStr, String pattern) {
        Calendar cal = parseStrToCalendar(dateStr);
        int day = cal.get(7);
        cal.add(5, 1 - day);
        return formatDate(cal.getTime(), pattern);
    }

    public static String getLastDayInWeek(String dateStr, String pattern) {
        Calendar cal = parseStrToCalendar(dateStr);
        int day = cal.get(7);
        cal.add(5, 6 - day);
        return formatDate(cal.getTime(), pattern);
    }

    public static String converGTMToLocal(String dateStr) {
        if (null != dateStr && !"".equals(dateStr)) {
            try {
                Date e = (new SimpleDateFormat("yyyy-MM-dd\'T\'HH:mm:ss.SSSZ")).parse(dateStr.replaceAll("Z$", "+0000"));
                return formatDate(e, "yyyy-MM-dd HH:mm:ss");
            } catch (ParseException var2) {
                var2.printStackTrace();
                return null;
            }
        } else {
            return null;
        }
    }

    public static boolean checkDateFormat(String sourceDate, String format) {
        if (sourceDate == null) {
            return false;
        } else {
            try {
                SimpleDateFormat e = new SimpleDateFormat(format);
                e.setLenient(false);
                e.parse(sourceDate);
                return true;
            } catch (Exception var3) {
                return false;
            }
        }
    }
}

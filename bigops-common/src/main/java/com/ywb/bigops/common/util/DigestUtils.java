package com.ywb.bigops.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Created by chenerlei on 2017/3/18.
 */
public class DigestUtils {

    public static String SALT = "BIGOPS";
    public static String SEPARATOR = "@";

    public static String encodeHex(byte[] bytes) {
        StringBuffer buffer = new StringBuffer(bytes.length * 2);
        for (int i = 0; i < bytes.length; i++) {
            if (((int) bytes[i] & 0xff) < 0x10)
                buffer.append("0");
            buffer.append(Long.toString((int) bytes[i] & 0xff, 16));
        }
        return buffer.toString();
    }

    public static String digest(String source) {
        return encodeMd5(source.getBytes());
    }

    public static String encodeMd5(byte[] source) {
        try {
            return encodeHex(MessageDigest.getInstance("MD5").digest(source));
        } catch (NoSuchAlgorithmException e) {
            throw new IllegalStateException(e.getMessage(), e);
        }
    }

    public static String encodeBase64(String source) {
        return Bytes.bytes2base64(source.getBytes());
    }

    public static String decodeBase64(String source) {
        return new String(Bytes.base642bytes(source));
    }

    public static void main(String[] args) {
        System.out.println(DigestUtils.digest("leader_89@126.com@123456@BIGOPS"));
    }

}

package com.qiujie.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;

/**
 * md5加密
 * @Author : qiujie
 * @Date : 2022/1/28
 */
public class MD5Util {
    public static String MD5(String str) {
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            byte[] bytes = md.digest(str.getBytes(StandardCharsets.UTF_8));
            return toHex(bytes);
        }
        catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    private static String toHex(byte[] bytes) {
        final char[] HEX_DIGITS = "0123456789ABCDEF".toCharArray();
        StringBuilder ret = new StringBuilder(bytes.length * 2);
        for (byte aByte : bytes) {
            ret.append(HEX_DIGITS[(aByte >> 4) & 0x0f]);
            ret.append(HEX_DIGITS[aByte & 0x0f]);
        }
        return ret.toString();
    }

    /**
     * 打乱加密后的密码
     * @param str
     * @return
     */
    public static String MD55(String str){
        // 先利用MD5加密
        String pwd = MD5(str);
        // 破坏密文结构
        return pwd.substring(0,4)+pwd.substring(29)+pwd.substring(20, 29)+pwd.substring(4, 20);
    }
}

package com.core.utils;

import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.Reader;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Blob;
import java.sql.Clob;
import java.sql.SQLException;
import java.text.DecimalFormat;

import sun.misc.BASE64Decoder;

import com.alibaba.druid.filter.config.ConfigTools;

public class Utils {

	public static String BlobToStr(Blob blob) {
		String result = null;
		try {
			ByteArrayInputStream msgContent = (ByteArrayInputStream) blob
					.getBinaryStream();
			byte[] byte_data = new byte[msgContent.available()];
			msgContent.read(byte_data, 0, byte_data.length);
			result = new String(byte_data, "UTF-8");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

	public static String ClobToStr(Clob clob) {
		Reader is = null;
		BufferedReader br = null;
		StringBuffer sb = new StringBuffer();
		try {
			if (clob != null) {
				is = clob.getCharacterStream();
				br = new BufferedReader(is);
				String s = br.readLine();
				while (s != null) {
					sb.append(s);
					s = br.readLine();
				}
			} else {
				return "";
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (br != null) {
					br.close();
				}
				if (is != null) {
					is.close();
				}
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return sb.toString();
	}

	public static String Md5(String inStr) {
		MessageDigest md5 = null;
		try {
			md5 = MessageDigest.getInstance("MD5");
		} catch (Exception e) {
			System.out.println(e.toString());
			e.printStackTrace();
			return "";
		}
		char[] charArray = inStr.toCharArray();
		byte[] byteArray = new byte[charArray.length];

		for (int i = 0; i < charArray.length; i++)
			byteArray[i] = (byte) charArray[i];
		byte[] md5Bytes = md5.digest(byteArray);
		StringBuffer hexValue = new StringBuffer();
		for (int i = 0; i < md5Bytes.length; i++) {
			int val = ((int) md5Bytes[i]) & 0xff;
			if (val < 16)
				hexValue.append("0");
			hexValue.append(Integer.toHexString(val));
		}
		return hexValue.toString();

	}

    public static String myPercent(int y,int z)  
    {  
        String baifenbi="";//接受百分比的值  
         double baiy=y*1.0;  
        double baiz=z*1.0;  
        double fen=baiy/baiz;  
        //NumberFormat nf   =   NumberFormat.getPercentInstance();     注释掉的也是一种方法  
        //nf.setMinimumFractionDigits( 2 );        保留到小数点后几位  
        DecimalFormat df1 = new DecimalFormat("##.00%");    //##.00%   百分比格式，后面不足2位的用0补齐  
        //baifenbi=nf.format(fen);    
        baifenbi= df1.format(fen);   
        return baifenbi;  
    }  
    
	/**
	 * ���ܽ����㷨 ִ��һ�μ��ܣ����ν���
	 */
	public static String convertMD5(String inStr) {
		char[] a = inStr.toCharArray();
		for (int i = 0; i < a.length; i++) {
			a[i] = (char) (a[i] ^ 't');
		}
		String s = new String(a);
		return s;
	}

    public static void main(String args[]) {  
    	System.out.println(Utils.MD5("QWE"));
    	//System.out.println(Utils.Md5("4035bbc636d3f53363b5a1209c3ffe1b"));
    }
    
    /**
     * md5 加密
     * @param sourceStr
     * @return
     */
	public static String MD5(String sourceStr) {
        String result = "";
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(sourceStr.getBytes("UTF-8"));
            byte b[] = md.digest();
            int i;
            StringBuffer buf = new StringBuffer("");
            for (int offset = 0; offset < b.length; offset++) {
                i = b[offset];
                if (i < 0)
                    i += 256;
                if (i < 16)
                    buf.append("0");
                buf.append(Integer.toHexString(i));
            }
            result = buf.toString();
        } catch (Exception e) {
        }
        return result;
    }
    
 // 将 s 进行 BASE64 编码 
    public static String getBASE64(String s) { 
       if (s == null)
    	   return null;
       return (new sun.misc.BASE64Encoder()).encode( s.getBytes() ); 
    } 

    // 将 BASE64 编码的字符串 s 进行解码 
    public static String getFromBASE64(String s) { 
       if (s == null)
    	   return null;
       BASE64Decoder decoder = new BASE64Decoder(); 
       try { 
          byte[] b = decoder.decodeBuffer(s); 
          return new String(b,"UTF-8"); 
       } catch (Exception e) { 
          return null; 
       } 
    }



}

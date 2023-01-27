/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tutorials.util;

import java.io.File;
import java.io.StringReader;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;
import org.w3c.dom.Document;
import org.xml.sax.InputSource;

public class ECMSUtil {

  public static String getFileExtension(String fileName) {
    return fileName.substring(fileName.lastIndexOf(".") + 1);
  }

  public String removeExtension(String s) {

    String separator = System.getProperty("file.separator");
    String filename;

    // Remove the path upto the filename.
    int lastSeparatorIndex = s.lastIndexOf(separator);
    if (lastSeparatorIndex == -1) {
      filename = s;
    } else {
      filename = s.substring(lastSeparatorIndex + 1);
    }

    // Remove the extension.
    int extensionIndex = filename.lastIndexOf(".");
    if (extensionIndex == -1) {
      return filename;
    }

    return filename.substring(0, extensionIndex);
  }

  public static void deleteFiles(File file, String dir) {
    try {
      file.delete();
    } catch (Exception e) {
      e.printStackTrace();
    }

    try {
      File file2 = new File(dir);
      file2.delete();
    } catch (Exception e) {
      e.printStackTrace();
    }
  }

  public static String[] sessionToArray(Object obj) {
    String str = String.valueOf(obj);
    String arr = str.replace("[", "").replace("]", "").replace(" ", "");
    String[] sessionarray = arr.split(",");
    return sessionarray;
  }

  public static Document loadXMLFromString(String xml) throws Exception {
    DocumentBuilderFactory factory = DocumentBuilderFactory.newInstance();
    DocumentBuilder builder = factory.newDocumentBuilder();
    InputSource is = new InputSource(new StringReader(xml));
    return builder.parse(is);
  }

  public static String encodeString(String str) throws UnsupportedEncodingException {
    byte[] parameterByte = str.getBytes("ISO-8859-15");
    String encodeStr = new String(parameterByte, "UTF-8");
    return encodeStr;
  }

  public static String getRandomString(int n) {
    String AlphaNumericString = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789abcdefghijklmnopqrstuvxyz0123456789";

    StringBuilder sb = new StringBuilder(n);
    for (int i = 0; i < n; i++) {
      int index = (int) (AlphaNumericString.length() * Math.random());
      sb.append(AlphaNumericString.charAt(index));
    }
    return sb.toString();
  }

  public static String getMainURL(HttpServletRequest req) {
    String scheme = req.getScheme();             // http
    String serverName = req.getServerName();     // hostname.com
    int serverPort = req.getServerPort();        // 80
    String contextPath = req.getContextPath();   // /mywebapp

    // Reconstruct original requesting URL
    StringBuilder url = new StringBuilder();
    url.append(scheme).append("://").append(serverName);

    if (serverPort != 80 && serverPort != 443) {
      url.append(":").append(serverPort);
    }

    url.append(contextPath);

    return url.toString();
  }
}

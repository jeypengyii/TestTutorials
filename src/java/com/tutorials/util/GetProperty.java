/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tutorials.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Joshua
 */
public class GetProperty {

  public Properties getPropertyValue(String propName) {
    Properties p = new Properties();
    String returnValue;
    try {
      p.load(new FileInputStream(propName));
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }

    return p;
  }

  public static String getSystemConfigProperty(HttpServletRequest request, String property) {
    String return_prop = "";
    ServletContext context = request.getServletContext();
    String fullPath = "C:\\ETRACC-v2\\conf\\systemConfig.properties";
    try (InputStream input = new FileInputStream(fullPath)) {
      Properties prop = new Properties();
      prop.load(input);
      return_prop = prop.getProperty(property);
    } catch (IOException ex) {
      ex.printStackTrace();
    }
    return return_prop;
  }
//
//    public static String getMessageProperty(HttpServletRequest request, String property) {
//        String return_prop = "";
//        ServletContext context = request.getServletContext();
//        String fullPath = context.getRealPath(ECMSConstants.messageProperties);
//        try (
//                InputStream input = new FileInputStream(fullPath)) {
//            Properties prop = new Properties();
//            prop.load(input);
//            return_prop = prop.getProperty(property);
//        } catch (IOException ex) {
//            ex.printStackTrace();
//        }
//        return return_prop;
//    }

}

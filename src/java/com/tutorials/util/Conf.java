/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tutorials.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

/**
 *
 * @author Chrisian Cornejo
 */
public class Conf {

  private static String getPropertyValue(String propName) {
    Properties prop = new Properties();
    String returnValue = "";
    try {
      prop.load(new FileInputStream("C:\\Tutorials\\conf\\config.properties"));
      returnValue = prop.getProperty(propName);
    } catch (FileNotFoundException e) {
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return returnValue;
  }

  public static String getEnv() {
    return getPropertyValue("key.env");
  }

  public static String getDataEnv() {
    return getPropertyValue("data.env");
  }


}

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tutorials.util;

import java.util.regex.Pattern;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author Mark Alamida
 */
public class ECMSConstants {

  public final static String PROPERTY_FILE_NAME = "../systemConfig.properties";

  public static Pattern fileExtnPtrn = Pattern.compile("([^\\s]+(\\.(?i)(png|jpg|pdf))$)");

  public final static String FILE_DIRECTORY = "C:\\opt\\ecommerce\\excel_files";

  public final static int UPLOAD_TYPE_MANUAL_ENTRY = 1;
  public final static int UPLOAD_TYPE_XML = 2;

  public final static int STATUS_REF_NEW = 1;
  public final static int STATUS_REF_MODIFIED = 2;
  public final static int STATUS_REF_ASSIGNED = 3;
  public final static int STATUS_REF_CREATED = 4;
  public final static int STATUS_REF_AUTO_ASSIGNED = 5;
  public final static int STATUS_REF_REVIEWED = 6;
  public final static int STATUS_REF_PRINTED = 7;
  public final static int STATUS_REF_CANCELLED = 8;

  // rdalawangbayan 20200413
  public final static int STATUS_REF_BOOKED = 6;

  public final static int MAWB_HAWB_SHIPPER = 1;
  public final static int MAWB_HAWB_CONSIGNEE = 2;
  public final static String fakeDir = "C:\\fakepath\\";
//    public final static String log4j_configfile = "/config/log4j.properties";
//    public final static String systemConfigProperties = "/config/systemConfig.properties";
//    public final static String messageProperties = "/config/message.properties";

  public static boolean invalidcontact(String s) {
    return Pattern.compile("^[0-9]\\d{2}-\\d{3}-\\d{7}$").matcher(s).find();
  }

  public static boolean validnumber(String s) {
    return Pattern.compile("^[0-9-]+$").matcher(s).find();
  }

  public static boolean containsNumber(String s) {
    return Pattern.compile("[0-9]").matcher(s).find();
  }

  public static boolean isValidEmail(String enteredEmail) {
    String EMAIL_REGIX = "/^(([^<>()\\[\\]\\\\.,;:\\s@\"]+(\\.[^<>()\\[\\]\\\\.,;:\\s@\"]+)*)|(\".+\"))@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\])|(([a-zA-Z\\-0-9]+\\.)+[a-zA-Z]{2,}))$/";
    Pattern pattern = Pattern.compile(EMAIL_REGIX);
    return (pattern.matcher(enteredEmail).matches());
  }

  public static boolean isNumeric(final String str) {
    if (str == null || str.length() == 0) {
      return false;
    }
    for (char c : str.toCharArray()) {
      if (!Character.isDigit(c)) {
        return false;
      }
    }
    return true;
  }

  public static boolean isValidshipp(String enteredBL) {
    String BL_REGIX = "[a-zA-Z0-9 ]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredBL).matches());
  }

  public static boolean isValidBL(String enteredBL) {
    String BL_REGIX = "^[a-zA-Z0-9]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredBL).matches());
  }

  public static boolean isValidCompany(String enteredEntry) {
    String BL_REGIX = "^[a-zA-Z0-9-,.& ]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredEntry).matches());
  }

  public static boolean isValidEntry(String enteredEntry) {
    String BL_REGIX = "^[a-zA-Z0-9- ]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredEntry).matches());
  }

  public static boolean isValidEntryStreet(String enteredEntry) {
    String BL_REGIX = "^[a-zA-Z0-9-,. ]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredEntry).matches());
  }

  public static boolean registryFormat(String enteredEntry) {
    String BL_REGIX = "^[A-Z]{3}\\d{4}-\\d{2}$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredEntry).matches());
  }

  public static boolean validspaceandleters(String enteredEntry) {
    String BL_REGIX = "^[a-zA-Z ]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredEntry).matches());
  }

  public static boolean validsname(String enteredEntry) {
    String BL_REGIX = "^[a-zA-Z. ]+$";
    Pattern pattern = Pattern.compile(BL_REGIX);
    return (pattern.matcher(enteredEntry).matches());
  }

//     public static boolean entryFormat(String enteredEntry) {
//        String BL_REGIX = "^[C|T|W]{1}\\d{6}$";
//        Pattern pattern = Pattern.compile(BL_REGIX);
//        return (pattern.matcher(enteredEntry).matches());
//    }
  public static long checkFileSize(MultipartFile file) {
    long fileSizeInBytes = file.getSize();
    long fileSizeInKB = fileSizeInBytes / 1024;
    long fileSizeInMB = fileSizeInKB / 1024;
    return fileSizeInKB;
  }

  public static String removeScript(String content) {
    if (content == null || content.isEmpty() || "".equals(content)) {
      return content;
    }
    Pattern p1 = Pattern.compile("<script[^>]*>(.*?)</script>", Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
    Pattern p2 = Pattern.compile("<applet[^>]*>(.*?)</applet>", Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
    Pattern p3 = Pattern.compile("<embed[^>]*>(.*?)</embed>", Pattern.DOTALL | Pattern.CASE_INSENSITIVE);
    Pattern p4 = Pattern.compile("<object[^>]*>(.*?)</object>", Pattern.DOTALL | Pattern.CASE_INSENSITIVE);

    content = p1.matcher(content).replaceAll("");
    content = p2.matcher(content).replaceAll("");
    content = p3.matcher(content).replaceAll("");
    content = p4.matcher(content).replaceAll("");

    return content;
  }

  public static int calculatePasswordStrength(String password) {
    //total score of password
    int iPasswordScore = 0;

    if (password == null || password.length() < 8) {
      return 0;
    } else if (password.length() >= 10) {
      iPasswordScore += 2;
    } else {
      iPasswordScore += 1;
    }

    //if it contains one digit, add 2 to total score
    if (password.matches("(?=.*[0-9]).*")) {
      iPasswordScore += 2;
    }

    //if it contains one lower case letter, add 2 to total score
    if (password.matches("(?=.*[a-z]).*")) {
      iPasswordScore += 2;
    }

    //if it contains one upper case letter, add 2 to total score
    if (password.matches("(?=.*[A-Z]).*")) {
      iPasswordScore += 2;
    }

    //if it contains one special character, add 2 to total score
    if (password.matches("(?=.*[~!@#$%^&*()_]).*")) {
      iPasswordScore += 2;
    }

    return iPasswordScore;

  }
}

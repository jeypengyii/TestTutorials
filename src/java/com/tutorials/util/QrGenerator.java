/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tutorials.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.EnumMap;
import java.util.Map;

/**
 *
 * @author ascen
 */
public class QrGenerator {

  public static String printQrCode(String QrCode, String data_val) {
    String fileDir = "C:\\AT3S\\QR-Code\\";
    String filePath = fileDir + QrCode + ".png";

    Path path = Paths.get(fileDir);
    if (!Files.isDirectory(path)) {
      if (!(new File(fileDir)).mkdir()) {
        System.out.println("FAILED TO CREATE ROOT FOLDER");
      }
    }

    int size = 512;
    String crunchifyFileType = "png";
    File crunchifyFile = new File(filePath);
    try {
      Map<EncodeHintType, Object> QrMap = new EnumMap<EncodeHintType, Object>(EncodeHintType.class);
      QrMap.put(EncodeHintType.CHARACTER_SET, "UTF-8");
      QrMap.put(EncodeHintType.MARGIN, 1);
      Object put = QrMap.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.H);
      QRCodeWriter mYQRCodeWriter = new QRCodeWriter();
      BitMatrix crunchifyBitMatrix = mYQRCodeWriter.encode(data_val, BarcodeFormat.QR_CODE, size, size, QrMap);
      int CrunchifyWidth = crunchifyBitMatrix.getWidth();
      BufferedImage crunchifyImage = new BufferedImage(CrunchifyWidth, CrunchifyWidth, BufferedImage.TYPE_INT_RGB);
      crunchifyImage.createGraphics();
      Graphics2D crunchifyGraphics = (Graphics2D) crunchifyImage.getGraphics();
      crunchifyGraphics.setColor(Color.white);
      crunchifyGraphics.fillRect(0, 0, CrunchifyWidth, CrunchifyWidth);
      crunchifyGraphics.setColor(Color.BLACK);
      for (int i = 0; i < CrunchifyWidth; i++) {
        for (int j = 0; j < CrunchifyWidth; j++) {
          if (crunchifyBitMatrix.get(i, j)) {
            crunchifyGraphics.fillRect(i, j, 1, 1);
          }
        }
      }
      ImageIO.write(crunchifyImage, crunchifyFileType, crunchifyFile);
      System.out.println("\nCongratulation.. You have successfully created QR Code.. \n"
              + "Check your code here: " + filePath);
    } catch (WriterException e) {
      System.out.println("\nSorry.. Something went wrong...\n");
      e.printStackTrace();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return QrCode;
  }
}

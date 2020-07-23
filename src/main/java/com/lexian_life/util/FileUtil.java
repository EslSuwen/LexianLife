package com.lexian_life.util;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

/** @author coderWu Created in 下午4:45 17-9-22 */
public class FileUtil {
  public static void save(byte[] bytes, String fileName, String path) throws IOException {
    createDirectory(path);
    FileOutputStream os = new FileOutputStream(path + fileName);
    os.write(bytes);
    os.close();
  }

  private static boolean isExistPath(String path) {
    File file = new File(path);
    if (file.exists()) { // 判断文件目录的存在
      return true;
    } else {
      return false;
    }
  }

  private static void createDirectory(String path) {
    if (!isExistPath(path)) {
      File file = new File(path);
      file.mkdirs();
    }
  }
}

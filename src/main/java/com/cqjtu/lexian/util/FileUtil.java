package com.cqjtu.lexian.util;

import org.apache.commons.io.FileExistsException;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.NoSuchFileException;

/**
 * FileUtil
 *
 * @author suwen
 */
public class FileUtil {
  public static void save(byte[] bytes, String fileName, String path) throws IOException {
    createDirectory(path);
    FileOutputStream os = new FileOutputStream(path + fileName);
    os.write(bytes);
    os.close();
  }

  private static boolean isExistPath(String path) {
    File file = new File(path);
    // 判断文件目录的存在
    return file.exists();
  }

  private static void createDirectory(String path) throws FileExistsException {
    if (!isExistPath(path)) {
      File file = new File(path);
      if(!file.mkdirs()){
        throw new FileExistsException("文件夹创建失败");
      }
    }
  }
}

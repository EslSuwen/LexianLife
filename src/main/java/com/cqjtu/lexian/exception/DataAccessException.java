package com.cqjtu.lexian.exception;

/** Created by xiaoxiaobing on 17-7-21. 数据访问异常 */
public class DataAccessException extends RuntimeException {
  public DataAccessException() {}

  public DataAccessException(String message) {
    super(message);
  }

  public DataAccessException(String message, Throwable cause) {
    super(message, cause);
  }

  public DataAccessException(Throwable cause) {
    super(cause);
  }
}

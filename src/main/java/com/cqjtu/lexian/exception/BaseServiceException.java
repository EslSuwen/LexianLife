package com.cqjtu.lexian.exception;

/**
 * BaseServiceException
 *
 * @author suwen
 */
public class BaseServiceException extends Exception {
  protected int errorCode;

  public BaseServiceException() {}

  public BaseServiceException(String message) {
    super(message);
  }

  public BaseServiceException(String message, Throwable cause) {
    super(message, cause);
  }

  public BaseServiceException(Throwable cause) {
    super(cause);
  }

  public int getErrorCode() {
    return errorCode;
  }

  public void setErrorCode(int errorCode) {
    this.errorCode = errorCode;
  }
}

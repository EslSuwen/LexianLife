package com.cqjtu.lexian.exception;

/**
 * CustomerServiceException 顾客异常
 *
 * @author suwen
 */
public class CustomerServiceException extends BaseServiceException {
  private int errorCode;

  public CustomerServiceException() {}

  public CustomerServiceException(String message) {
    super(message);
  }

  public CustomerServiceException(int errorCode) {
    super();
    this.errorCode = errorCode;
  }

  public CustomerServiceException(String message, Throwable cause) {
    super(message, cause);
  }

  public CustomerServiceException(String message, int errorCode) {
    super(message);
    this.errorCode = errorCode;
  }

  public CustomerServiceException(Throwable cause) {
    super(cause);
  }

  public CustomerServiceException(Throwable cause, int errorCode) {
    super(cause);
    this.errorCode = errorCode;
  }

  @Override
  public int getErrorCode() {
    return errorCode;
  }

  @Override
  public void setErrorCode(int errorCode) {
    this.errorCode = errorCode;
  }
}

package com.ywb.bigops.common.util;

/**
 * BigOpsException.
 *
 * @author Erlei Chen
 * @version 1.0 2017/3/12
 */
public class BigOpsException extends Exception {

    private static final long serialVersionUID = -7199918698925141395L;

    private String code;

    public BigOpsException(String message) {
        super(message);
    }

    public BigOpsException(Throwable cause) {
        super(cause.getMessage());
        if (cause instanceof BigOpsException) {
            BigOpsException exception = (BigOpsException) cause;
            this.code = exception.getCode();
        }
    }

    public BigOpsException(String message, Throwable cause) {
        super(message, cause);
    }

    public BigOpsException(String code, String message) {
        super(message);
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }
}

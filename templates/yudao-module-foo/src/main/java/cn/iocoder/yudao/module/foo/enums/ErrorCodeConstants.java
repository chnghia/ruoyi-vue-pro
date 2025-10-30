package cn.iocoder.yudao.module.foo.enums;

import cn.iocoder.yudao.framework.common.exception.ErrorCode;

/**
 * foo module error codes
 */
public interface ErrorCodeConstants {

    // Reserve a unique range for your module; adjust as needed.
    ErrorCode FOO_NOT_EXISTS = new ErrorCode(1_060_001_000, "Foo not exists");

}


package cn.iocoder.yudao.module.foo.controller.admin.foo.vo;

import cn.iocoder.yudao.framework.common.pojo.PageParam;
import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

@Data
public class FooPageReqVO extends PageParam {

    @Schema(description = "名称，模糊匹配")
    private String name;

    @Schema(description = "状态，精确匹配")
    private Integer status;
}


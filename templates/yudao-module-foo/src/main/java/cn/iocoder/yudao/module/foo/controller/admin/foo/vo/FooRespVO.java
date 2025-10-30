package cn.iocoder.yudao.module.foo.controller.admin.foo.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import lombok.Data;

import java.time.LocalDateTime;

@Data
public class FooRespVO {

    @Schema(description = "编号")
    private Long id;

    @Schema(description = "名称")
    private String name;

    @Schema(description = "状态")
    private Integer status;

    @Schema(description = "创建时间")
    private LocalDateTime createTime;
}


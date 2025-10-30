package cn.iocoder.yudao.module.foo.controller.admin.foo.vo;

import io.swagger.v3.oas.annotations.media.Schema;
import jakarta.validation.constraints.NotNull;
import lombok.Data;

@Data
public class FooUpdateReqVO extends FooSaveReqVO {

    @Schema(description = "编号", requiredMode = Schema.RequiredMode.REQUIRED)
    @NotNull(message = "编号不能为空")
    private Long id;
}


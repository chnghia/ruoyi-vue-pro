package cn.iocoder.yudao.module.foo.controller.admin.foo;

import cn.iocoder.yudao.framework.common.pojo.CommonResult;
import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.*;
import cn.iocoder.yudao.module.foo.convert.FooConvert;
import cn.iocoder.yudao.module.foo.dal.dataobject.foo.FooDO;
import cn.iocoder.yudao.module.foo.service.foo.FooService;
import io.swagger.v3.oas.annotations.Operation;
import io.swagger.v3.oas.annotations.tags.Tag;
import jakarta.annotation.Resource;
import jakarta.validation.Valid;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import static cn.iocoder.yudao.framework.common.pojo.CommonResult.success;

@Tag(name = "管理后台 - Foo")
@RestController
@RequestMapping("/admin/foo/foo")
public class FooController {

    @Resource
    private FooService fooService;

    @PostMapping("/create")
    @Operation(summary = "创建 Foo")
    @PreAuthorize("@ss.hasPermission('foo:foo:create')")
    public CommonResult<Long> createFoo(@Valid @RequestBody FooSaveReqVO createReqVO) {
        return success(fooService.createFoo(createReqVO));
    }

    @PutMapping("/update")
    @Operation(summary = "更新 Foo")
    @PreAuthorize("@ss.hasPermission('foo:foo:update')")
    public CommonResult<Boolean> updateFoo(@Valid @RequestBody FooUpdateReqVO updateReqVO) {
        fooService.updateFoo(updateReqVO);
        return success(true);
    }

    @DeleteMapping("/delete")
    @Operation(summary = "删除 Foo")
    @PreAuthorize("@ss.hasPermission('foo:foo:delete')")
    public CommonResult<Boolean> deleteFoo(@RequestParam("id") Long id) {
        fooService.deleteFoo(id);
        return success(true);
    }

    @GetMapping("/get")
    @Operation(summary = "获得 Foo 详情")
    @PreAuthorize("@ss.hasPermission('foo:foo:query')")
    public CommonResult<FooRespVO> getFoo(@RequestParam("id") Long id) {
        FooDO foo = fooService.getFoo(id);
        return success(FooConvert.INSTANCE.convert(foo));
    }

    @GetMapping("/page")
    @Operation(summary = "获得 Foo 分页")
    @PreAuthorize("@ss.hasPermission('foo:foo:query')")
    public CommonResult<PageResult<FooRespVO>> getFooPage(@Valid FooPageReqVO pageReqVO) {
        PageResult<FooDO> pageResult = fooService.getFooPage(pageReqVO);
        return success(FooConvert.INSTANCE.convertPage(pageResult));
    }
}


package cn.iocoder.yudao.module.foo.service.foo;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooPageReqVO;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooSaveReqVO;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooUpdateReqVO;
import cn.iocoder.yudao.module.foo.dal.dataobject.foo.FooDO;

public interface FooService {

    Long createFoo(FooSaveReqVO createReqVO);

    void updateFoo(FooUpdateReqVO updateReqVO);

    void deleteFoo(Long id);

    FooDO getFoo(Long id);

    PageResult<FooDO> getFooPage(FooPageReqVO pageReqVO);
}


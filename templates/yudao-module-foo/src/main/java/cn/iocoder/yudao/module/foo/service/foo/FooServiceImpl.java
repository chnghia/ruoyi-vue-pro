package cn.iocoder.yudao.module.foo.service.foo;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooPageReqVO;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooSaveReqVO;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooUpdateReqVO;
import cn.iocoder.yudao.module.foo.convert.FooConvert;
import cn.iocoder.yudao.module.foo.dal.dataobject.foo.FooDO;
import cn.iocoder.yudao.module.foo.dal.mysql.foo.FooMapper;
import jakarta.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.validation.annotation.Validated;

import static cn.iocoder.yudao.framework.common.exception.util.ServiceExceptionUtil.exception;
import static cn.iocoder.yudao.module.foo.enums.ErrorCodeConstants.FOO_NOT_EXISTS;

@Service
@Validated
public class FooServiceImpl implements FooService {

    @Resource
    private FooMapper fooMapper;

    @Override
    public Long createFoo(FooSaveReqVO createReqVO) {
        FooDO entity = FooConvert.INSTANCE.convert(createReqVO);
        fooMapper.insert(entity);
        return entity.getId();
    }

    @Override
    public void updateFoo(FooUpdateReqVO updateReqVO) {
        validateExists(updateReqVO.getId());
        FooDO updateObj = FooConvert.INSTANCE.convert(updateReqVO);
        fooMapper.updateById(updateObj);
    }

    @Override
    public void deleteFoo(Long id) {
        validateExists(id);
        fooMapper.deleteById(id);
    }

    @Override
    public FooDO getFoo(Long id) {
        return fooMapper.selectById(id);
    }

    @Override
    public PageResult<FooDO> getFooPage(FooPageReqVO pageReqVO) {
        return fooMapper.selectPage(pageReqVO);
    }

    private void validateExists(Long id) {
        if (fooMapper.selectById(id) == null) {
            throw exception(FOO_NOT_EXISTS);
        }
    }
}


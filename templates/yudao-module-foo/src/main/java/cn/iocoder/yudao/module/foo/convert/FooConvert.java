package cn.iocoder.yudao.module.foo.convert;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.*;
import cn.iocoder.yudao.module.foo.dal.dataobject.foo.FooDO;
import org.mapstruct.Mapper;
import org.mapstruct.factory.Mappers;

import java.util.List;

@Mapper
public interface FooConvert {

    FooConvert INSTANCE = Mappers.getMapper(FooConvert.class);

    FooDO convert(FooSaveReqVO bean);

    FooDO convert(FooUpdateReqVO bean);

    FooRespVO convert(FooDO bean);

    List<FooRespVO> convertList(List<FooDO> list);

    PageResult<FooRespVO> convertPage(PageResult<FooDO> page);
}


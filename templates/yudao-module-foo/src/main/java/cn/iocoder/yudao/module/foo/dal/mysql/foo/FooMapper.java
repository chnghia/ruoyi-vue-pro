package cn.iocoder.yudao.module.foo.dal.mysql.foo;

import cn.iocoder.yudao.framework.common.pojo.PageResult;
import cn.iocoder.yudao.framework.mybatis.core.mapper.BaseMapperX;
import cn.iocoder.yudao.framework.mybatis.core.query.LambdaQueryWrapperX;
import cn.iocoder.yudao.module.foo.controller.admin.foo.vo.FooPageReqVO;
import cn.iocoder.yudao.module.foo.dal.dataobject.foo.FooDO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FooMapper extends BaseMapperX<FooDO> {

    default PageResult<FooDO> selectPage(FooPageReqVO reqVO) {
        return selectPage(reqVO, new LambdaQueryWrapperX<FooDO>()
                .likeIfPresent(FooDO::getName, reqVO.getName())
                .eqIfPresent(FooDO::getStatus, reqVO.getStatus())
                .orderByDesc(FooDO::getId));
    }
}


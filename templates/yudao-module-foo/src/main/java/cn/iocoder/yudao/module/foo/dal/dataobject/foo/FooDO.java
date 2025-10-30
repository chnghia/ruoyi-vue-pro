package cn.iocoder.yudao.module.foo.dal.dataobject.foo;

import cn.iocoder.yudao.framework.mybatis.core.dataobject.BaseDO;
import com.baomidou.mybatisplus.annotation.KeySequence;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

/**
 * Demo entity for the foo module
 */
@Data
@TableName("foo")
@KeySequence("foo_seq") // Used by Oracle/PostgreSQL/Kingbase/DB2/H2; ignored by MySQL
public class FooDO extends BaseDO {

    @TableId
    private Long id;

    private String name;

    private Integer status;
}


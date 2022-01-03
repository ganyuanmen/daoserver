package com.dao.daoserver.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;

@Data
public class Org {
    @TableId(value = "org_id", type = IdType.ASSIGN_ID)
    private int orgId;
    private String orgName;
}

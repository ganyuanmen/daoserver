package com.dao.daoserver.entity;

import lombok.Data;

@Data
public class BasePageQuery {
    private Integer pageNum=1;
    private Integer pageSize=20;
}

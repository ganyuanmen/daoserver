package com.dao.daoserver.entity;

import lombok.Data;

@Data
public class RequstSwap  extends  BasePageQuery{
    private String address;

    private String order;
    private String orderType;
}

package com.dao.daoserver.entity;

import lombok.Data;

import java.math.BigDecimal;

@Data
public class RequestIADD {
    private  long blockNum;
    private BigDecimal fromCost;
    private  BigDecimal toCost;
    private int fromTokenId;
    private int toTokenId;
}

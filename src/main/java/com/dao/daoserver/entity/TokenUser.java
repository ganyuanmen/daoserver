package com.dao.daoserver.entity;

import lombok.Data;

@Data
public class TokenUser {
    private int tokenId;
    private String daoSymbol;
    private double tokenCost;
}

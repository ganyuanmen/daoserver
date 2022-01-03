package com.dao.daoserver.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

import java.io.Serializable;

@Data
@EqualsAndHashCode(callSuper = false)
public class VSwap implements Serializable {

    private static final long serialVersionUID=1L;
    @TableId(value = "block_num", type = IdType.ASSIGN_ID)
    private Long blockNum;
    private String title;
    private double inAmount;
    private double outAmount;
    private String myAddress;
    private String myTime;


}

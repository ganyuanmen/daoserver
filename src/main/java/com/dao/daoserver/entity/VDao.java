package com.dao.daoserver.entity;

import java.util.Date;
import java.io.Serializable;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * VIEW
 * </p>
 *
 * @author gym
 * @since 2021-10-02
 */
@Data
@EqualsAndHashCode(callSuper = false)

public class VDao implements Serializable {

    private static final long serialVersionUID=1L;
    @TableId(value = "dao_id", type = IdType.ASSIGN_ID)
    private Integer daoId;
    private Integer logodaoId;
    private Long blockNum;

    private String daoName;

    private String daoSymbol;


    private String daoDsc;

    private String daoTime;

    private String daoManager;

    private String daoLogo;

    private String osAddress;
    private String orgAddress;
    private Integer orgId;
    private String orgName;
    private Integer tokenId;
    private Integer isToken;
    private Integer daoIndex;
    private double utokenCost;



}

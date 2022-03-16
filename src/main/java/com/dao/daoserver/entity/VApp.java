package com.dao.daoserver.entity;

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
 * @since 2022-03-16
 */
@Data
@EqualsAndHashCode(callSuper = false)

public class VApp implements Serializable {

    private static final long serialVersionUID=1L;

    @TableId(value = "block_num", type = IdType.ASSIGN_ID)
    private Long blockNum;

    private String appName;

    private Integer appIndex;

    private String appVersion;

    private Integer appIndexRec;

    private String appDesc;

    private String appAddress;

    private String appManager;

    private String appTime;


}

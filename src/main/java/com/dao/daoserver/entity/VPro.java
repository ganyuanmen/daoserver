package com.dao.daoserver.entity;

import java.math.BigDecimal;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * VIEW
 * </p>
 *
 * @author gym
 * @since 2022-01-08
 */
@Data
@EqualsAndHashCode(callSuper = false)
public class VPro implements Serializable {

    private static final long serialVersionUID=1L;

    private String proName;
    private Integer daoId;

    private String proDel;

    private Integer proIndex;

    private String proTime;
    private String proApp;

    private Integer totalVote;

    private Integer yVote;

    private Integer excuVote;


}

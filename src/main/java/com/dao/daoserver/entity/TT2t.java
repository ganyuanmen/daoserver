package com.dao.daoserver.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.annotation.IdType;
import java.util.Date;
import com.baomidou.mybatisplus.annotation.TableId;
import java.io.Serializable;
import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * <p>
 * 
 * </p>
 *
 * @author gym
 * @since 2021-11-01
 */
@Data
@EqualsAndHashCode(callSuper = false)

public class TT2t implements Serializable {

    private static final long serialVersionUID=1L;




    private Integer fromTokenId;

    private Integer toTokenId;

    @TableId(value = "block_num")
    private Long blockNum;


    private BigDecimal fromUtokenCost;

    private BigDecimal toUtokenCost;


}

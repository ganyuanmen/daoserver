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
public class TT2u implements Serializable {

    private static final long serialVersionUID=1L;




    private Integer fromTokenId;

    @TableId(value = "block_num")
    private Long blockNum;


    private BigDecimal utokenCost;


}

package com.dao.daoserver.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.dao.daoserver.entity.ADao;
import com.dao.daoserver.entity.RequetDao;


public interface IDataservice  extends IService<ADao> {
    IPage<ADao> getData(RequetDao requetDao);


}

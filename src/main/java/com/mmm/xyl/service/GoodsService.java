package com.mmm.xyl.service;

import com.mmm.xyl.entity.Goods;
import com.baomidou.mybatisplus.extension.service.IService;
import com.mmm.xyl.vo.GoodsVo;

import java.util.List;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author testjava
 * @since 2022-03-19
 */
public interface GoodsService extends IService<Goods> {
    List<GoodsVo> selectGoods(String inGoodsTime, String outGoodsTime,String name);
}

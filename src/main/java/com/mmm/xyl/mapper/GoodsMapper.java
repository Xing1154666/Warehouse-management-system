package com.mmm.xyl.mapper;

import com.mmm.xyl.entity.Goods;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.mmm.xyl.vo.GoodsVo;

import java.util.List;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author testjava
 * @since 2022-03-19
 */
public interface GoodsMapper extends BaseMapper<Goods> {

    List<GoodsVo> selectGoods(String inGoodsTime, String outGoodsTime,String name);

}

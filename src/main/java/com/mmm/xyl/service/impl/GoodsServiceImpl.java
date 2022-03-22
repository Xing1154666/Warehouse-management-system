package com.mmm.xyl.service.impl;

import com.mmm.xyl.entity.Goods;
import com.mmm.xyl.mapper.GoodsMapper;
import com.mmm.xyl.service.GoodsService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.mmm.xyl.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author testjava
 * @since 2022-03-19
 */
@Service
public class GoodsServiceImpl extends ServiceImpl<GoodsMapper, Goods> implements GoodsService {

    @Autowired
    private GoodsMapper goodsMapper;
    @Override
    public List<GoodsVo> selectGoods(String inGoodsTime, String outGoodsTime ,String name) {
        List <GoodsVo>  list = goodsMapper.selectGoods(inGoodsTime,outGoodsTime,name);
        return list;
    }
}

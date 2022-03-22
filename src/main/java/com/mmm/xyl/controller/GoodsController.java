package com.mmm.xyl.controller;


import com.mmm.xyl.entity.Goods;
import com.mmm.xyl.service.GoodsService;
import com.mmm.xyl.utils.r.R;
import com.mmm.xyl.vo.GoodsVo;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author testjava
 * @since 2022-03-18
 */
@RestController
@RequestMapping("/xyl/goods")
public class GoodsController {
    @Autowired
    private GoodsService goodsService;

    @ApiOperation("查看所有商品,带时间条件")
    @GetMapping("/selectGoods")
    public R selectGoods(HttpServletRequest request){
        String inGoodsTime = request.getParameter("inGoodsTime");
        String outGoodsTime = request.getParameter("outGoodsTime");
        String name = request.getParameter("name");
        List<GoodsVo> list = goodsService.selectGoods(inGoodsTime,outGoodsTime,name);
        return R.ok().data("goods",list);
    }

    @ApiOperation("根据商品名称进行入库")
    @GetMapping("/insertGoodByNameNum")
    public R insertGoodByNameNum(
            @RequestParam("name") String name,
            @RequestParam("num") Integer num,
            @RequestParam("unitPrice") double unitPrice,
           HttpServletRequest request
            ){
        String sort = request.getParameter("sort");
        Goods good = new Goods();
        good.setName(name);
        good.setNum(num);
        good.setInoutTime(new Date());
        good.setSort(sort);
        good.setPrice((float) (num*unitPrice));
        good.setUnitPrice(unitPrice);
        good.setTypeId(1);
        goodsService.save(good);
        return R.ok();
    }

    @ApiOperation("进行入库新的商品")
    @GetMapping("/insertGood")
    public R insertGood(
            @RequestParam("name") String name,
            @RequestParam("num") Integer num,
            @RequestParam("unitPrice") double unitPrice,
            HttpServletRequest request
    ){
        String sort = request.getParameter("sort");
        Goods good = new Goods();
        good.setName(name);
        good.setNum(num);
        good.setInoutTime(new Date());
        good.setSort(sort);
        good.setPrice((float) (num*unitPrice));
        good.setUnitPrice(unitPrice);
        good.setTypeId(1);
        goodsService.save(good);
        Goods goods = new Goods();
        goods.setName(name);
        goods.setNum(0);
        goods.setInoutTime(new Date());
        goods.setSort(sort);
        goods.setPrice((float) 0);
        goods.setUnitPrice(unitPrice);
        goods.setTypeId(2);
        goodsService.save(goods);
        return R.ok();
    }

    @ApiOperation("根据商品名称进行出库")
    @GetMapping("/OutGoods")
    public R OutGoods(
            @RequestParam("name") String name,
            @RequestParam("num") Integer num,
            @RequestParam("unitPrice") double unitPrice,
            HttpServletRequest request
    ){
        String sort = request.getParameter("sort");
        Goods good = new Goods();
        good.setName(name);
        good.setNum(num);
        good.setInoutTime(new Date());
        good.setSort(sort);
        good.setPrice((float) (num*unitPrice));
        good.setUnitPrice(unitPrice);
        good.setTypeId(2);
        goodsService.save(good);
        return R.ok();
    }
}
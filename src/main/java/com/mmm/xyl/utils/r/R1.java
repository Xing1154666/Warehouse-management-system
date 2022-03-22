package com.mmm.xyl.utils.r;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Data
public class R1 {
    @ApiModelProperty(value = "返回码")
    private Integer code;
    @ApiModelProperty(value = "返回总页数")
    private int count;
    @ApiModelProperty(value = "返回消息")
    private String msg;
    @ApiModelProperty(value = "返回数据")
    private List data = new ArrayList();
    @ApiModelProperty(value = "返回数据")
    private Map<String, Object> data1 = new HashMap<String, Object>();

    private R1(){}

    public static R1 ok(){
        R1 r = new R1();
        r.setMsg("success");
        r.setCode(0);
        return r;
    }
    public R1 data(List list){
        this.setData(list);
        return this;
    }
    public R1 count(int count){
        this.setCount(count);
        return this;
    }

    public R1 data(String key, Object value){
        this.data1.put(key, value);
        return this;
    }
}

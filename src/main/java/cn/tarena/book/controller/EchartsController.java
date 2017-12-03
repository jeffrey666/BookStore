package cn.tarena.book.controller;

import cn.tarena.book.pojo.Book;
import cn.tarena.book.service.ChartService;
import com.alibaba.fastjson.JSON;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class EchartsController {
    @Autowired
    private ChartService chartService;
    @RequestMapping("/echart")
    public String demo( ){
        return "echarts/demo";
    }
    @RequestMapping("/echart2")
    public String demo2( ){
        return "echarts/demo2";
    }
    @RequestMapping("/echart3")
    public String demo3( ){
        return "echarts/demo3";
    }
    @RequestMapping("data.json")
    @ResponseBody
    public String demo4( ){
        return "";
    }
    @RequestMapping("/GetAllData")
    @ResponseBody
    public String demo5(){
         /*销量*/
        Integer[] salesVolume = {10,100,20,56,35,80};
        /*营业额*/
        double[] bussinessVolume = {10*10,100*8.5,20*9.5,56*9,35*9.5,80*9};
        /*横轴, 月份数据*/
        String[] months = {"1","2","3","4","5","6"};

        Map<String, Object> map = new HashMap<>();
        map.put("salesVolume", salesVolume);
        map.put("bussinessVolume",bussinessVolume);
        map.put("months", months);

        String data = JSON.toJSONString(map);
        System.out.println(data);
        return data;
    }
    @RequestMapping("/GetAllData1")
    @ResponseBody
    public String demo6(){
        List<Book> books = chartService.findAll();

         /*借阅量*/
        List<Integer> borrowVolume = new ArrayList<>();
        /*搜索量*/
        List<Integer> searchVolume = new ArrayList<>();
        /*横轴, 月份数据*/
        List<String> names = new ArrayList<>();
        for (Book book: books) {
            borrowVolume.add(Integer.valueOf(book.getBookInfo().getBorrowCount()));
            searchVolume.add(Integer.valueOf(book.getBookInfo().getSearchVolume()));
            names.add(book.getBookName());
        }

        Map<String, Object> maps = new HashMap<>();
        maps.put("borrowVolume", borrowVolume);
        maps.put("searchVolume",searchVolume);
        maps.put("names", names);

        String data = JSON.toJSONString(maps);
        System.out.println(data);
        return data;
    }
}

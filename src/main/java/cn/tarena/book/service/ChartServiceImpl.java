package cn.tarena.book.service;

import cn.tarena.book.mapper.ChartMapper;
import cn.tarena.book.pojo.Book;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class ChartServiceImpl implements ChartService {
    @Autowired
    private ChartMapper chartMapper;
    @Override
    public List<Book> findAll() {

        return chartMapper.findAll();
    }
}

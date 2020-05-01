package com.han.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.han.entity.Thing;
import com.han.mapper.ThingMapper;
import com.han.mapper.UserMapper;
import com.han.service.ThingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @ClassName ThingServiceImpl
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 23:06
 */
@Service
public class ThingServiceImpl implements ThingService {

    @Autowired
    ThingMapper thingMapper;

    @Override
    public int addThing(Thing thing) {
        return  thingMapper.insert(thing);
    }

    @Override
    public PageInfo<Thing> selectAll(int page, int limit) {
        PageHelper.startPage(page, limit);
        List<Thing> things = thingMapper.selectAll();
        PageInfo<Thing> pageInfo = new PageInfo<>(things);
        return pageInfo;
    }

    @Override
    public int deleteThing(Integer id) {
        return thingMapper.delete(id);
    }

    @Override
    public int updateThing(Thing thing) {
        return thingMapper.update(thing);
    }
}

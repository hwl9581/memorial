package com.han.service;

import com.github.pagehelper.PageInfo;
import com.han.entity.Thing;

import java.util.List;

/**
 * @ClassName ThingService
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 23:05
 */
public interface ThingService {

    int addThing(Thing thing);

    PageInfo<Thing> selectAll(int page, int limit);

    int deleteThing(Integer id);

    int updateThing(Thing thing);
}

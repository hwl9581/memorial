package com.han.mapper;

import com.han.entity.Thing;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @ClassName ThingMapper
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 18:03
 */
@Repository
public interface ThingMapper {

    int insert(Thing thing);

    List<Thing> selectAll();

    int delete(Integer id);

    int update(Thing thing);

}

package com.han.entity;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

/**
 * @ClassName Thing
 * @Description TODO
 * @Author HanWL
 * @Since 2020/4/30 0030 17:57
 */
@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Thing {

    private Long id;

    private String thingName;

    private String thingDetail;

    private Date startTime;

    private Date endTime;

    private Integer state;

    private Long userId;
}

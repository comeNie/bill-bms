package com.yipeng.bill.bms.service;

import org.springframework.stereotype.Service;

/**
 * Created by Administrator on 2017/5/10.
 */

public interface RankingUpdateService
{
    int  updateRanking(int TaskId,int RankLast,int RankFirst);
}

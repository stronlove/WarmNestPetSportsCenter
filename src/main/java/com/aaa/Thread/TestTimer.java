package com.aaa.Thread;

import java.util.Date;
import java.util.Timer;
import java.util.TimerTask;

import com.aaa.Service.FinancialRecordsService;

public class TestTimer extends Thread{

    private Long orderId;
    private FinancialRecordsService userInfoService;
    private Integer paymentstatus;
    
    public TestTimer(Long orderId,FinancialRecordsService yuserInfoService,Integer paymentstatus){
        this.orderId=orderId;
        this.userInfoService=yuserInfoService;
        this.paymentstatus=paymentstatus;
    }

    public void run() {
        this.CountDown();
    }

    /**
     * 倒计时
     *
     * @param min 倒计时间（分钟）
     */
    public  void CountDown() {
        int min=3;
        //开始时间
        long start = System.currentTimeMillis();
        //结束时间
        final long end = start + min * 60 * 1000;

        final Timer timer = new Timer();
        //延迟0毫秒（即立即执行）开始，每隔1000毫秒执行一次
    /*    timer.schedule(new TimerTask() {
            public void run() {
                System.out.println(123);
                timer.cancel();
            }
        }, 0, 1000);*/
        //计时结束时候，停止全部timer计时计划任务
        timer.schedule(new TimerTask() {
            public void run() {
                userInfoService.process(orderId,0);
            
                timer.cancel();
            }

        }, new Date(end));
    }
    
    public static void main(String[] args) {
    }
}

package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	//public static String app_id= "2088122203766702";
	public static String app_id = "2016091600525531";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key = "MIIEvAIBADANBgkqhkiG9w0BAQEFAASCBKYwggSiAgEAAoIBAQCjAkc+h2weQg6m+O8n/8OhwoaVvbSSNdS4/522jB8OwjkF/2YToZv1t7fsQXqFgT+m+uNeq74A+HmqRlSGcreKlJfp4bvMpNfx9xvzxpMV8Fc9KA4CEuXSkY0dYLePgKGIRip7+vAMlMNyarS5NCz9afYG10gdLjuK6teG8vMpLUaJvfarvO3HTwdHcyXioFYkx1s/lDLMMJCI2GgMBQdJRRWP5q+QfSglV539nlqs9Em8P07Pi8Ohh8p2loeF553RNV9pvqhYhIZ9R2FZkqOfqVkugkil9SQq29Wc4SRxL4KwciXCSifqlzmMKI9fEi7yM2NBKUWLOxFs2xMs+3mhAgMBAAECggEABuPHwxrSNQ0xtVj8MsKasDGaoqWcBjoEPbWAIwEVJviKlHhRBi9keiRDv9acqRvnZtVf2taDd2MJMWs7k1sx6seRDC+gUmv9PJrnMYyJFvpLlaglv2yxDg9c2YsG9yfGrA3bKdZXYxC+mg1sig9sf2GFJpDe2Wzk02BNr8SBBpJz9mrIlFYF4pJVqdm9UgZoSkB1qo4W8QZlPH71OmlrMLy7IsPtFAvHVA8DI0kNjREu6UXVfXsJzyt3IvRqc5yOWobJ2twY6cwg2fVcR02QBifwo+mNC/LO3HnFgHK4JFwnaMIDwABirrmGPYcSiWeqehNFD/VK2DljqBuk/fyPaQKBgQDihWEvYAgnobw5Uxh7nteDXzMyZu2ixA3RpNF3HAHN7ypKjDjDBjcOaed2s4iq6tFGrH9RorDmFxqHB3sYeasQQhJtFOHZ1jtqUtfreeQ1skV2OsL79jWgreoqAL3MgVt556jeXDsb4qkgpwYSioYxD44cEHGlDbA3TqRpnaFxkwKBgQC4OPjfxpFDyAZ9t8hZsob99n3NQgfVbXzsF/LRwhz0BgLGn/QtPGDGYq9B4OT/OjabU1Tlw6IvluDCMZj+S1ub4FwGsjW8CO+WtH1NJe8vSxsr+gOZz15mKkNe4c0nmDAa0Gr2/irk7XqrX77arwGPMQpHck1FaQD5ZutU8D94ewKBgEF4h5RnzzOVPY/cApGIYYXo+CUzNq/6tnvHhXtFrwfUfoa5bJaBr1wNJAdc8L1lzUL+DHaN7U8zkklA0kVKtTSnxCefB4AsuVOLyjiXLGyQsB7x8PVePjXIzouBV1pKcSQU3uwWAEeZBYUYgVrOiuaXNl3KKu6nvCzgIAketFDdAoGAKmJBMArZRQTyKV5tI+XlFOzvCJhWgQ4Nnavs28GTM7lmThhi7z1i7oGp3LhHN0lHYvkLIUmfON+3mjYbAvaHfxdhVNEPd9F+fefMpEFEBFd9SuLcjTieeVbj5SKCNsfW2XR2B5l2ePECNgdzO5DkBPO9b66mhH+iD79UCVi04Z0CgYAxFivE7lnXER+FvKYk7kM6Xlv8abCLgon2/3GpX8EK1sksjLZfm2TDLCAIqtfqwjTJMOsNWlsAl4cqhV5IsrlzHY4r5+GAB0NhgkWh0Wf/LoUfONLAxh849gUrQNnql0dd8kZIAciKW2vHhO6uWONmKK6HQmssnekhKhvoyHw2jw==";
	
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAowJHPodsHkIOpvjvJ//DocKGlb20kjXUuP+dtowfDsI5Bf9mE6Gb9be37EF6hYE/pvrjXqu+APh5qkZUhnK3ipSX6eG7zKTX8fcb88aTFfBXPSgOAhLl0pGNHWC3j4ChiEYqe/rwDJTDcmq0uTQs/Wn2BtdIHS47iurXhvLzKS1Gib32q7ztx08HR3Ml4qBWJMdbP5QyzDCQiNhoDAUHSUUVj+avkH0oJVed/Z5arPRJvD9Oz4vDoYfKdpaHheed0TVfab6oWISGfUdhWZKjn6lZLoJIpfUkKtvVnOEkcS+CsHIlwkon6pc5jCiPXxIu8jNjQSlFizsRbNsTLPt5oQIDAQAB";

	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/ReturnToMerchant";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}


package com.xiruisi.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {

//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

    // 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
    public static String app_id = "2021000117683025";

    // 商户私钥，您的PKCS8格式RSA2私钥
    public static String merchant_private_key ="MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQC46ClMwdbkxQmzfBVEsN0BGsJDAAF4YMxGELx4h/0Z5N6fhZdn1KNUdzHWqex/hPGQf/Ik5J1qAUKifySC6swuNOQdewm8gJlVwPSFrga9vbwMS2l5KHsjcIWGyXXCjodI1RWynLxOJawkB7UoBctgcioXrjSWOcsEfg9N4W2/DZY+XGIe15kXqG50w6LOpjwctlVFLG3KxEtpEzVMDw+fr0yhQCtf6JRleG8PdQpmbzasQJ2PZrVmziuYy6oiZIjhm1wCBAyVzeMMb5DihYZqBXl+uFNj5QiLROIdA1DepDnzO/lqQeY29oHa27pmlM1x2a0LlNOt4pR4qg5UNCZ9AgMBAAECggEAEOw+i2XaMwnNf33FvImrUGSQju07NTc2utrhRO69PVdzAIqLdtdBM4PNLeZTXMBgE2eCU9oQhhkjbhfQ0aKHmVsB3ajbFUN3xR9pwapRt5/bzAxC1PHdgzrTHajmfC3rN8E4wSYTHdvYy1thOw58tJD+RTiOW4liiUC4Sdpt3uRJj5Q1dFLBDRree5QrSNfLnqYBzue80ul8VFsnQlmD+A/TAqktC5GLf3Udd+9CURwONxSZXuWgYf9rshkInaFgqm7Pnhepj0izrlnqeD0ffJAvniyArDiT+aY4nu00vxw3OX3WSsMkSyezqQL5t5jn+5yUGfjvDyWyd2Kche8jSQKBgQDlwtD/p5ZrKXN+KezPV15shKeAL4AFcsYlaqC46/NqgWM44f9hGHavyuP6fB5PFScgFhZqoKPg0wjTNrry6Dq1rICk/T+0F5jRxMBCY55Ndv5EMZNhmT6WHbMwZN3iZFQLBnrDr5bOidZ98zbu2w8QU9mggc2IshkGIBgO9wyzXwKBgQDOBgLY1wWJySnGGsCuNHtDqsSiK4uj5gWFmxuwd6KAxbNRsvP6IqD3mMLaSDB6mPg36iBHGXwYoGmuBYCCXCM9Ufqd4jnnWSYsYU9+46XC/iOgPorUkSX4GEjIofWklWrNSI8GwS4T6F3ISri9GCwKmoTiWJDfmE7+NYal94CvowKBgQDBc4KdfvF7UO9ZLtugyCNMo3SUzWmxLK4BGwIwMRpGdqKgZkir6/kikmXZpV+vnlPPBEnjhVX2Gjm3/MDzfOzRwmiegkx8ydF17X8jZtUGzEXSDRvWdTzpECCrgoH/+BF7Jv1+ff0v8YaTjZCXFAJe8Pqv1hrEGZBQQ/19vC0JaQKBgQCPbK/etRIt8dUbDNTGcdK+MMvi+d2kpCWD9Y85Mo/2hatoXORsZl8Y/0fnHgphzsw+YMdHt/4kRshLVZk5J1uA/OkzsKIO5IkmrDfjZienr7Stgdy0TrfYF0/UHKwdf8dyUekAEsw5H7LqFNq3CXTfjOKlkHKKtkWHw0uRjtQPcQKBgFriXrZqO4zhhC6Cu4bdU40iyUFSuJzp+lTfqmynLUb+6tU3ogP0MGtz5M2PrmXvCEkc4AUejW1lNdYI8eZzOw1SCS4sESzx3LV7bVHZf1vbR54O7aOAcoFMaG9fZFp/NkvX44y0a9jdoMxmjhEAy+DQXfYiC1scHk/kXjfoiATI";
    // 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAs2k39jpJS9AQVsYaWpT+ppxojqaFZTV8WBwDm5JO9FV1Cxk30L5wRYcpVeyTAi0sgYcylywRRrbidjGBcChhB3nHaw8s1E8mKfjmH420UyAFGhZ4oFSJtuoaWFoXD6Yr9Gbjhgl5YTE0PYe5cbQ2UUILXClV/iGecTLect9aFr4uxUUi4Mb9RyXyiy6dIdpBx9wN2GDPouG2TszhkeS8bqEDnZnsWWtkTiVtnj+iXYeBoIgCR/hEwClYNC+8iSEO+/PuhG+f/DWIio1VxLx58/3pUusDIqozCpFZ1XwMfGTsO2kGw9xxlxo/wuIN/QnWncVbtPUuKkFBRBLUBK5NxwIDAQAB";
    // 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String notify_url = "http://www.67373upup.xyz:8081/pay/paySuccess";
    //public static String notify_url = "  http://localhost:8081/xiruisi/pay/paySuccess";

    // 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
    public static String return_url = "http://www.67373upup.xyz:8081/pay/paySuccess";
    //public static String return_url = "  http://localhost:8081/xiruisi/pay/paySuccess";

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


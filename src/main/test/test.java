import com.zhenzi.sms.ZhenziSmsClient;

import java.util.HashMap;
import java.util.Map;

public class test {
    public static void main(String[] args) throws Exception {
        ZhenziSmsClient client = new ZhenziSmsClient("https://sms_developer.zhenzikj.com", "105554", "60b64026-9aaa-4459-83f3-0aafd82383d3");
        Map<String, String> params = new HashMap<String, String>();
        params.put("message", "验证码为: 1123");
        params.put("number", "17742879706");
        String result = client.send("17742879706", "验证码: 1123,你正在注册喜瑞斯账号，验证码在5分钟内有效");
        System.out.println(result);
    }
}

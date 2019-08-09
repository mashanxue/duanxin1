package com.duanxin.Controller;

import com.alibaba.fastjson.JSONObject;
import com.zhenzi.sms.ZhenziSmsClient;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.Random;

@Controller
public class DuanXinController {

    @RequestMapping("/sendSms")
    @ResponseBody
    public void sendVerifyCode(HttpServletRequest request, String number){
        /*JSONObject json = null;*/
        //生成验证码
        String verifyCode = String.valueOf(new Random().nextInt(899999)+100000);//程序生成验证码
        ZhenziSmsClient client = new ZhenziSmsClient("https://sms_developer.zhenzikj.com", "102280", "\n" +
                "79c10bcb-e416-43f2-8f2c-2927b5647b51");//和榛子云平台建立连接,三个参数上面都有
        try {
            String result = client.send(number, "验证码为" + verifyCode);//给指定用户发送验证码和信息
            System.out.println(number+"   "+verifyCode+"   "+result);
            request.getSession().setAttribute("verifyCode","verifyCode");//将生成的验证码保存在session中以便后进行验证

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

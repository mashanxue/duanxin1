<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <base href="<%=basePath%>">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>右边进入的消息页面</title>
    <!-- 引入jQUery -->
    <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
</head>
<body>
<form action="" method="post">
    用户名:<input type="text" name="name" ><br>
    密码:<input type="password" name="password" ><br>
    手机号码:<input type="text" id="tel" name="tel"><br>
    验证码:<input type="text" name="verifyCode" id="verifyCode">
    <input type="button" id="getVerifyCode-button" value="获取验证码" class="sendVerifyCode"><br>
    <input type="submit" value="提交">
</form>
<script type="text/javascript">
    $(function () {
        //发送验证码
        $(".sendVerifyCode").on("click",function () {
            var number=$("input[name=tel]").val();
            $.ajax({
                url: "/sendSms",
                async : true,/*是否为异步*/
                type: "post",
                dataType: "json",
                data: {"number":number},
                success: function (data) {
                    if(data == 'fail'){
                        alert("发送验证码失败");
                        return ;
                    }
                }
            });
        });
    });
</script>
</body>
</html>

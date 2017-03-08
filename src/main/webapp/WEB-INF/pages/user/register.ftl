<#import "/base/base.ftl" as base>
<#import "/base/func.ftl" as func>

<@base.html "用户注册">
<link href="${ctx}/static/css/user/Register.css" rel="stylesheet">
<script src="${ctx}/static/js/user/verificationNumbers.js"></script>
<script src="${ctx}/static/js/user/Particleground.js"></script>
<script src="${ctx}/static/js/user/AjaxName.js"></script>
<style>
    body {
        height: 100%;
        background: #16a085;
        overflow: hidden;
    }

    canvas {
        z-index: -1;
        position: absolute;
    }
</style>
<script>
    $(document).ready(function() {
        //粒子背景特效
        $('body').particleground({
            dotColor: '#5cbdaa',
            lineColor: '#5cbdaa'
        });
    });
</script>
<form action="${rc.contextPath}/user/create" method="post">
    <dl class="admin_login">
        <dt>
            <strong>翊芃网络科技会员注册</strong>
            <em>YiPeng System</em>
        </dt>

        <dd class="user_icon">
            <input type="text" name="userName" placeholder="用户名" class="login_txtbx" id="logid"/>
        </dd>
        <span style="font-size:14px;" class="pdlogid"></span>

        <dd class="pwd_icon">
            <input type="password" name="password" placeholder="密码" class="login_txtbx" id="pwd"/>
        </dd>
        <span style="font-size:14px;" class="pdpwd"></span>

        <dd class="pwd_icon">
            <input type="password" name="rpwd" placeholder="确认密码" class="login_txtbx" id="rpwd" />
        </dd>
        <span style="font-size:14px;" class="pdrpwd"></span>

        <dd class="pwd_icon">
            <input type="text" name="realName" placeholder="真实姓名" class="login_txtbx" id="realName" />
        </dd>
        <span style="font-size:14px;" class="pdrpwd"></span>

        <dd class="pwd_icon">
            <input type="text" name="contact" placeholder="联系人" class="login_txtbx" id="contact" />
        </dd>
        <span style="font-size:14px;" class="realName"></span>
        <dd class="pwd_icon">
            <input type="text" name="qq" placeholder="qq" class="login_txtbx" id="qq" />
        </dd>
        <span style="font-size:14px;" class="qq"></span>
        <dd class="pwd_icon">
            <input type="text" name="phone" placeholder="电话" class="login_txtbx" id="phone" />
        </dd>
        <span style="font-size:14px;" class="phone"></span>

        <dd>
            <input type="submit" value="立即注册" class="submit_btn" />
        </dd>
        <dd>
            <p></p>
            <p></p>
        </dd>
    </dl>



</form>
</@base.html>
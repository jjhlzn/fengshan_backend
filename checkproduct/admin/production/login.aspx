<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="fengshan.admin.production.login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="./css/login.css" rel="stylesheet" />
</head>
<body>
    <form id="formdiv" runat="server">
   <div class="login">
	<h1>东阳尚方装饰</h1>

    	<input id="username" type="text" name="u" placeholder="用户名" required="" data-parsley-errors-messages-disabled="" />
        <input id="password" type="password" name="p" placeholder="密码" required="" data-parsley-errors-messages-disabled=""/>
        <button type="submit" class="btn btn-primary btn-block btn-large" onclick="submitForm();">登录</button>
        </div>
    </form>

    <script src="../vendors/jquery/dist/jquery.min.js"></script>
    <script src="../vendors/parsleyjs/dist/parsley.min.js"></script>
    <script src="./js/login.js"></script>
</body>
</html>

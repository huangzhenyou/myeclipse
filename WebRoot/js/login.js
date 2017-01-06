
function checkform()
{
if(document.getElementById('username').value=='')
{
alert('用户名不能为空！');
return false;
}
if(document.getElementById('password').value=='')
{
alert('密码不能为空！');
return false;
}
}

param($openLanten = $true)

if($openLanten){
	C:\Users\tony.xuf\AppData\Roaming\Lantern\lantern.exe;
	echo "start lantern"
	Start-Sleep -Seconds 10
}


#set up for vs compiling permission
$dir = "C:\Windows\Temp"
$acl = get-acl -path $dir
$new = "IIS_IUSRS","Modify","ContainerInherit,ObjectInherit","None","Allow"
$accessRule = new-object System.Security.AccessControl.FileSystemAccessRule $new
$acl.SetAccessRule($accessRule)
$acl | Set-Acl $dir

echo "the permission setup done"

#set up for internet proxy exception superxsusie
$regKey="HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings"

Set-ItemProperty -Path $regKey -Name ProxyOverride -Value "*.baidu.com;*.chinaielts.org;*.qq.com;*.dingtalk.com;*.netcnnet.net;*.taobao.com;*.tmall.com;*.jd.com;cns-qaauto5;*.windowsazure.com;*.englishtown.com;*.sina.com;*.sina.com.cn;*.bilibili.com;*.cnblogs.com;*.jd.com;*.bing.com;*.baidu.com;*.todgo.com;*.sjtu.edu.cn;*.mi.com;*.englishtown.cn;www.iciba.com;*.weixin.qq.com;*.sjtu.edu.cn;*.oneplusbbs.com;*.tencent.com;*.bing.com;*.douban.com;*.baidu.com;*taobao.com;cns-qaauto5;<local>"

echo "exception of proxy setup done"
 // 请勿修改，否则可能出错
	var userAgent = navigator.userAgent, 
				rMsie = /(msie\s|trident.*rv:)([\w.]+)/, 
				rFirefox = /(firefox)\/([\w.]+)/, 
				rOpera = /(opera).+version\/([\w.]+)/, 
				rChrome = /(chrome)\/([\w.]+)/, 
				rSafari = /version\/([\w.]+).*(safari)/;
				var browser;
				var version;
				var ua = userAgent.toLowerCase();
				function uaMatch(ua) {
					var match = rMsie.exec(ua);
					if (match != null) {
						return { browser : "IE", version : match[2] || "0" };
					}
					var match = rFirefox.exec(ua);
					if (match != null) {
						return { browser : match[1] || "", version : match[2] || "0" };
					}
					var match = rOpera.exec(ua);
					if (match != null) {
						return { browser : match[1] || "", version : match[2] || "0" };
					}
					var match = rChrome.exec(ua);
					if (match != null) {
						return { browser : match[1] || "", version : match[2] || "0" };
					}
					var match = rSafari.exec(ua);
					if (match != null) {
						return { browser : match[2] || "", version : match[1] || "0" };
					}
					if (match != null) {
						return { browser : "", version : "0" };
					}
				}
				var browserMatch = uaMatch(userAgent.toLowerCase());
				if (browserMatch.browser) {
					browser = browserMatch.browser;
					version = browserMatch.version;
                }
                console.log(browserMatch)
				//document.write(browser);
/*
谷歌浏览器事件接管
*/
function OnComplete2(type,code,html)
{
	TANGER_OCX_OBJ.ShowTipMessage("提示",trim(html));
	//alert(trim(html));
}
function OnBeginOpenFromURL(type,code)
{
	
}
function OnComplete3(str,doc)
{

	 TANGER_OCX_OBJ.ShowTipMessage("提示","ondocumentopened成功回调");
	//SetReviewMode(true);
	
}
function OnComplete4(str){
	//alert(str);
}
function publishashtml(type,code,html){
	//alert(html);
	//alert("Onpublishashtmltourl成功回调");
}
function publishaspdf(type,code,html){
//alert(html);
//alert("Onpublishaspdftourl成功回调");
}
function saveasotherurl(type,code,html){
//alert(html);
//alert("SaveAsOtherformattourl成功回调");
}
function dowebget(type,code,html){
//alert(html);
//alert("OnDoWebGet成功回调");
}
function webExecute(type,code,html){
//alert(html);
//alert("OnDoWebExecute成功回调");
}
function webExecute2(type,code,html){
//alert(html);
//alert("OnDoWebExecute2成功回调");
}
function FileCommand(TANGER_OCX_str,TANGER_OCX_obj){
	if (TANGER_OCX_str == 3) 
	{
		//alert("不能保存！");
		SaveOfficeToServerDir();
		TANGER_OCX_OBJ.CancelLastCommand = true;
	}
	if (TANGER_OCX_str == 5)  //5代表打印
	{
		TANGER_OCX_OBJ.CancelLastCommand = true;//取消打印命令
		DisableConten(true); //去红
		TANGER_OCX_OBJ.PrintOut(true);//执行打印
		DisableConten(false); //恢复红头
	}

}
var ProductCaption="";
var ProductKey="";
var classidx64="A64E3073-2016-4baf-A89D-FFE1FAA10EE0";
var classid = "A64E3073-2016-4baf-A89D-FFE1FAA10EC0";
//var classid="C9BC4DFF-4248-4a3c-8A49-63A7D317F404";
var codebase="OfficeControl/OfficeControl.cab#version=5,0,2,9";
var codebase64="OfficeControl/OfficeControlx64.cab#version=5,0,2,7";
var codebaseExe="OfficeControl/软航文档控件平台版PLUS.exe";
if (browser=="IE"){
	//alert(window.navigator.platform);
	if(window.navigator.platform=="Win32"){
		document.write('<!-- 用来产生编辑状态的ActiveX控件的JS脚本-->   ');
		document.write('<!-- 因为微软的ActiveX新机制，需要一个外部引入的js-->   ');
		document.write('<object id="TANGER_OCX" classid="clsid:'+classid+'"');
		document.write('codebase="'+codebase+'" width="100%" height="100%">   ');
		document.write('<param name="IsUseUTF8URL" value="-1">   ');
		document.write('<param name="IsUseUTF8Data" value="-1">   ');
		document.write('<param name="BorderStyle" value="1">   ');
		document.write('<param name="BorderColor" value="14402205">   ');
		document.write('<param name="TitlebarColor" value="15658734">   ');
		document.write('<param name="isoptforopenspeed" value="0">   ');
		document.write('<param name="TitlebarTextColor" value="0">   ');
		document.write('<param name="ProductCaption" value="'+ProductCaption+'">');
		document.write('<param name="ProductKey" value="'+ProductKey+'">');
		document.write('<param name="MenubarColor" value="14402205">   ');
		document.write('<param name="MenuButtonColor" VALUE="16180947">   ');
		document.write('<param name="MenuBarStyle" value="3">   ');
		document.write('<param name="MenuButtonStyle" value="7">   ');
		document.write('<param name="WebUserName" value="NTKO">   ');
		document.write('<param name="Caption" value="NTKO OFFICE文档控件示例演示 http://www.ntko.com">   ');
		document.write('<SPAN STYLE="color:red">不能装载文档控件。请在检查浏览器的选项中检查浏览器的安全设置。请点击<a href="'+codebaseExe+'">软航文档控件平台版PLUS.exe</a></SPAN>   ');
		document.write('</object>');	
	}
	if(window.navigator.platform=="Win64"){
		document.write('<!-- 用来产生编辑状态的ActiveX控件的JS脚本-->   ');
		document.write('<!-- 因为微软的ActiveX新机制，需要一个外部引入的js-->   ');
		document.write('<object id="TANGER_OCX" classid="clsid:'+classidx64+'"');
		document.write('codebase="'+codebase64+'" width="100%" height="100%">   ');
		document.write('<param name="IsUseUTF8URL" value="-1">   ');
		document.write('<param name="IsUseUTF8Data" value="-1">   ');
		document.write('<param name="BorderStyle" value="1">   ');
		document.write('<param name="BorderColor" value="14402205">   ');
		document.write('<param name="TitlebarColor" value="15658734">   ');
		document.write('<param name="isoptforopenspeed" value="0">   ');
		document.write('<param name="TitlebarTextColor" value="0">   ');
		document.write('<param name="ProductCaption" value="'+ProductCaption+'">');
		document.write('<param name="ProductKey" value="'+ProductKey+'">');		
		document.write('<param name="MenubarColor" value="14402205">   ');
		document.write('<param name="MenuButtonColor" VALUE="16180947">   ');
		document.write('<param name="MenuBarStyle" value="3">   ');
		document.write('<param name="MenuButtonStyle" value="7">   ');
		document.write('<param name="WebUserName" value="NTKO">   ');
		document.write('<param name="Caption" value="NTKO OFFICE文档控件示例演示 http://www.ntko.com">   ');
		document.write('<SPAN STYLE="color:red">不能装载文档控件。请在检查浏览器的选项中检查浏览器的安全设置。请点击<a href="'+codebaseExe+'">软航文档控件平台版PLUS.exe</a></SPAN>   ');
		document.write('</object>');	
		
	}
	
}
else if (browser=="firefox"){ 	
		document.write('<object id="TANGER_OCX" type="application/ntko-plug"  codebase="'+codebase+'" width="100%" height="100%" ForOnSaveToURL="OnComplete2" ForAfterSaveToURL="OnComplete4" ForOnBeginOpenFromURL="OnBeginOpenFromURL" ForOndocumentopened="OnComplete3"');
		
		document.write('ForOnpublishAshtmltourl="publishashtml"');
		document.write('ForOnpublishAspdftourl="publishaspdf"');
		document.write('ForOnSaveAsOtherFormatToUrl="saveasotherurl"');
		document.write('ForOnDoWebGet="dowebget"');
		document.write('ForOnDoWebExecute="webExecute"');
		document.write('ForOnDoWebExecute2="webExecute2"');
		document.write('ForOnFileCommand="FileCommand"');
		document.write('ForOnCustomToolBarCommand="CustomToolBarCom"');
		document.write('ForOnCustomMenuCmd2="CustomMenuCmd"');
		document.write('_IsUseUTF8URL="-1"   ');
		document.write('_ProductCaption="'+ProductCaption+'"   ');
		document.write('_ProductKey="'+ProductKey+'"   ');
		document.write('_IsUseUTF8Data="-1"   ');
		document.write('_BorderStyle="1"   ');
		document.write('_BorderColor="14402205"   ');
		document.write('_MenubarColor="14402205"   ');
		document.write('_MenuButtonColor="16180947"   ');
		document.write('_MenuBarStyle="3"  ');
		document.write('_MenuButtonStyle="7"   ');
		document.write('_WebUserName="NTKO"   ');
		document.write('clsid="{'+classid+'}" >');
		document.write('<SPAN STYLE="color:red">尚未安装NTKO Web FireFox跨浏览器插件。请点击<a href="'+codebaseExe+'">软航文档控件平台版PLUS.exe</a></SPAN>   ');
		document.write('</object>   ');
}else if(browser=="chrome"){
		document.write('<object id="TANGER_OCX" clsid="{'+classid+'}"  ForOnSaveToURL="OnComplete2" ForOnBeginOpenFromURL="OnBeginOpenFromURL" ForOndocumentopened="OnComplete3"');
		document.write('ForOnpublishAshtmltourl="publishashtml"');
		document.write('ForOnpublishAspdftourl="publishaspdf"');
		document.write('ForOnSaveAsOtherFormatToUrl="saveasotherurl"');
		document.write('ForOnDoWebGet="dowebget"');
		document.write('ForOnDoWebExecute="webExecute"');
		document.write('ForOnDoWebExecute2="webExecute2"');
		document.write('ForOnFileCommand="FileCommand"');
		document.write('ForOnCustomToolBarCommand="CustomToolBarCom"');
		document.write('ForOnCustomMenuCmd2="CustomMenuCmd"');
		document.write('codebase="'+codebase+'" width="100%" height="100%" type="application/ntko-plug" ');
		document.write('_IsUseUTF8URL="-1"   ');
		document.write('_IsUseUTF8Data="-1"   ');
		document.write('_BorderStyle="1"   ');
		document.write('_ProductCaption="'+ProductCaption+'"   ');
		document.write('_ProductKey="'+ProductKey+'"   ');
		document.write('_BorderColor="14402205"   ');
		document.write('_MenubarColor="14402205"   ');
		document.write('_MenuButtonColor="16180947"   ');
		document.write('_MenuBarStyle="3"  ');
		document.write('_MenuButtonStyle="7"   ');
		document.write('_WebUserName="NTKO"   ');
		document.write('_Caption="NTKO OFFICE文档控件示例演示 http://www.ntko.com">    ');
		document.write('<SPAN STYLE="color:red">尚未安装NTKO Web Chrome跨浏览器插件。请点击<a href="'+codebaseExe+'">软航文档控件平台版PLUS.exe</a></SPAN>   ');
		document.write('</object>');
	}else if (Sys.opera){
		alert("sorry,ntko web印章暂时不支持opera!");
	}else if (Sys.safari){
		 alert("sorry,ntko web印章暂时不支持safari!");
	}
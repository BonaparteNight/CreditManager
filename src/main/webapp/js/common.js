var common = {};
common.uuid = function() {
	var uuid = "";
	$.ajax({
		url: "/commController/getUUID.do",
		async:false,
		success:function(data) {
			var aj = $.parseJSON(data);
			uuid = aj.uu;
		}
	})
	return uuid;
}

common.progressShow = function(){
	$.messager.progress({
		title:'提示',
		msg:'请等待，处理中...'
	});
}
common.progressClose = function(){
	setTimeout(function(){
		$.messager.progress('close');
	},8)
}

/**核实当前活动次数是否大于营销活动总次数**/
common.doCheckActiveTotalNum = function(tn,mn,dn){
	var shimu = mn;
	if(tn==''){
		$.messager.alert('提示', '请填写营销渠道模块中的活动总次数!');
		return false;
	}else{
		if(shimu==''){
			shimu = '0';
		}
//		if((parseInt(shimu)+parseInt(dn))>tn){
//			$.messager.alert('提示', '已使用次数不能大于营销总次数!');
//			return false;
//		}
	}
	return true;
}

common.ie = function(){
	if ((navigator.userAgent.indexOf('MSIE') >= 0) && (navigator.userAgent.indexOf('Opera') < 0)){
		return navigator.userAgent.toLowerCase().match(/msie ([\d.]+)/)[1];
	}
	return false;
}

common.firefox = function(){
	if (navigator.userAgent.indexOf('Firefox') >= 0){
		return navigator.userAgent.toLowerCase().match(/firefox\/([\d.]+)/)[1];
	}
	return false;
}
var overlayID = "overlay";
var msgID = "overlayMsg";
common.showSysInform = function() {
  	// 消息显示
	var newDiv = document.createElement("div");
	newDiv.id = msgID;
	newDiv.style.position = "absolute";
	newDiv.style.zIndex = "999";
	newDiv.style.width = "200px";
	newDiv.style.height = "60px";
	var scrolltop = window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
	var _clientheight = Math.max(document.body.clientHeight, document.documentElement.clientHeight);
	var _clientwidth = document.documentElement.clientWidth || document.body.clientWidth;
    //整个页面的高度
	var msgtop = (scrolltop + ((_clientheight) / 4+100)) + "px";
	var msgleft = (_clientwidth - 200) / 2 + "px";
	newDiv.style.top = msgtop;
	newDiv.style.left = msgleft; // 屏幕居中
	newDiv.style.background = "#EFEFEF";
	newDiv.style.border = "1px solid #860001";
	newDiv.style.padding = "5px";
	newDiv.style.opacity = "1";

	newDiv.innerHTML += "<table width='100%' cellpadding='0' cellspacing='0' border='0'>";
  	newDiv.innerHTML += " <tr>";
  	newDiv.innerHTML += "  <td rowspan='2' width='70' valign='top' style='padding-top:10px;'>";
    newDiv.innerHTML += "<img src='../images/sys/loading.gif' hspace='10' align='absmiddle'>";
	newDiv.innerHTML += " </td>    ";
	newDiv.innerHTML += "<td height='30%' style='padding:10px 40px 0 0;'>";
	newDiv.innerHTML += "<span id='inform1'>正在处理中。。。</span>";
	newDiv.innerHTML += "</td>";
    newDiv.innerHTML += " </tr>";
   	newDiv.innerHTML += "</table>";

	document.body.appendChild(newDiv);
  	// 锁屏图层
	var h;
	if (document.body.scrollHeight > document.body.offsetHeight){
		h = document.body.scrollHeight
	}else{
		 h = document.body.clientHeight;
	}
	var newMask = document.createElement("div");
	newMask.id = overlayID;
	newMask.style.position = "absolute";
	newMask.style.zIndex = "998";
	newMask.style.width = _clientwidth + "px";
	newMask.style.height = h +"px";
	newMask.style.top = "0px";
	newMask.style.left = "0px";
	newMask.style.background = "#f2f2f2";
	//newMask.style.filter = "progid:DXImageTransform.Microsoft.Alpha(style=3,opacity=40,finishOpacity=90)";
	newMask.style.opacity = "0.85";
	document.body.appendChild(newMask);
}

common.loadHidInfo = function() {
	var my = document.getElementById(overlayID);
    if (my != null)  my.parentNode.removeChild(my);
    my = document.getElementById(msgID);
    if (my != null) my.parentNode.removeChild(my);
}

common.GuiZe = function(ruleinstanceid) {
	var arrIframeKey = parent.iframeMap.entrys();
	var tishi  = 0;
	for(var i=0;i<arrIframeKey.length;i++){
		if(arrIframeKey[i].key.split('_')[0]=='markChanPTDX'
			||arrIframeKey[i].key.split('_')[0]=='markChanZTDXTZ'
				||arrIframeKey[i].key.split('_')[0]=='markChanWX'
				||arrIframeKey[i].key.split('_')[0]=='markChanM'
				||arrIframeKey[i].key.split('_')[0]=='markChan10086007'
				||arrIframeKey[i].key.split('_')[0]=='markChanMFlash'){
			var obj = parent.document.getElementById(arrIframeKey[i].key).contentWindow;
			var str = obj.$('#rule_instance_id').combogrid('getValues');
			if(String(str).indexOf(ruleinstanceid)!=-1){
				obj.$('#rule_instance_id').combogrid('clear');
				tishi = 1;
			}
		}
	}
	if(tishi == 1){
		top.$.messager.alert('提醒', '因某渠道使用了此规则，</br>所以请重新选择渠道的营销规则！','warning');
	}
}

//产品保存，清除渠道选择的受理产品
common.chanandSucess = function(step_ids,_step_status) {
	var arrIframeKey = parent.iframeMap.entrys();
//	alert(step_ids+"***"+_step_status);
	var stepids = step_ids.split(",");
	var stepstatus = _step_status.split(",");
	for(var i=0;i<arrIframeKey.length;i++){
		if(arrIframeKey[i].key.split('_')[0]=='markChanPTDX'||arrIframeKey[i].key.split('_')[0]=='markChanDXTX'||
				arrIframeKey[i].key.split('_')[0]=='markChanZTDXTZ'||arrIframeKey[i].key.split('_')[0]=='markChanWX'||
				arrIframeKey[i].key.split('_')[0]=='markChanToolBar'||arrIframeKey[i].key.split('_')[0]=='markChanZTWAP'
				||arrIframeKey[i].key.split('_')[0]=='markChanNet'||arrIframeKey[i].key.split('_')[0]=='markChanZTClient'
				||arrIframeKey[i].key.split('_')[0]=='markChan10086'||arrIframeKey[i].key.split('_')[0]=='markChanZUZD'
				||arrIframeKey[i].key.split('_')[0]=='markChanSTYYT'||arrIframeKey[i].key.split('_')[0]=='markChanToolBar4G'
				||arrIframeKey[i].key.split('_')[0]=='markChanM'||arrIframeKey[i].key.split('_')[0]=='markChanESOP'
				||arrIframeKey[i].key.split('_')[0]=='markChanRelax'||arrIframeKey[i].key.split('_')[0]=='markChanRelax'){
			var obj = parent.document.getElementById(arrIframeKey[i].key).contentWindow;
			for(var j=0;j<stepids.length;j++){
				if(arrIframeKey[i].key.split('_')[1]==stepids[j] && (stepstatus[j]==1 || stepstatus[j]==5 || stepstatus[j]==13)){
					obj.$('#productId').combogrid('clear');
				}
			}
		}
//		if(arrIframeKey[i].key.split('_')[0]=='condSuccSave'){
//			var obj = parent.document.getElementById(arrIframeKey[i].key).contentWindow;
//			if(obj.$("#acepCheck")[0].checked){
//				obj.$("#acepCheck").attr("checked",false);
//				/*obj.$('#prodiv').attr('style','display:none');*/
//				obj.$('#aceptPro').val("");
//				obj.$('#btnAdd').linkbutton('disable');
//				obj.$('#btnAdd1').linkbutton('disable');
//				obj.$('#btnAdd2').linkbutton('disable');
//			}
//		}
	}
}

//渠道删除的时候，清空成功条件之产品受理
common.sucessc = function() {
	var arrIframeKey = parent.iframeMap.entrys();
	for(var i=0;i<arrIframeKey.length;i++){
		if(arrIframeKey[i].key.split('_')[0]=='condSuccSave'){
			var obj = parent.document.getElementById(arrIframeKey[i].key).contentWindow;
			if(obj.$("#acepCheck")[0].checked){
				obj.$("#acepCheck").attr("checked",false);
				//obj.$('#prodiv').attr('style','display:none');aceptPro
				obj.$('#aceptPro').val('');
			}
		}
	}
}

//判断电话经理子类名称是否相同
common.checkTelSubNameEqual=function(newIframeId) {
	var arrIframeKey = parent.iframeMap.entrys();
	for(var i=0;i<arrIframeKey.length;i++){
		if(arrIframeKey[i].key!=newIframeId){
			if(arrIframeKey[i].key.split('_')[0]=='markChanTel'){
				var obj = parent.document.getElementById(arrIframeKey[i].key).contentWindow;
				var obj_new = parent.document.getElementById(newIframeId).contentWindow;
				if(obj.$("#SUB_PROJECT_NAME").val()==obj_new.$("#SUB_PROJECT_NAME").val()){
					return true;
				}
			}
		}

	}
	return false;
}

//判断电话经理子类之间开始结束时间是否相同
common.checkTelSubStartEndTimeEqual=function(newIframeId){
	var arrIframeKey = parent.iframeMap.entrys();
	for(var i=0;i<arrIframeKey.length;i++){
		if(arrIframeKey[i].key!=newIframeId){
			if(arrIframeKey[i].key.split('_')[0]=='markChanTel'){
				var obj = parent.document.getElementById(arrIframeKey[i].key).contentWindow;
				var obj_new = parent.document.getElementById(newIframeId).contentWindow;
				if(obj.$("#begindate").val()!=obj_new.$("#begindate").val()){
					return true;
				}
				if(obj.$("#enddate").val()!=obj_new.$("#enddate").val()){
					return true;
				}
			}
		}

	}
	return false;
}

//判断是否是互斥渠道（M+渠道与其他渠道互斥）
common.huchiChan=function() {
	var arrIframeKey = parent.iframeMap.entrys();
	for(var i=0;i<arrIframeKey.length;i++){
		if(arrIframeKey[i].key.split('_')[0]=='markChanPTDX'||arrIframeKey[i].key.split('_')[0]=='markChanQFDX'
			||arrIframeKey[i].key.split('_')[0]=='markChanZTDXTZ'){
			parent.$('#btnM').linkbutton('disable');
			break;
		}else if(arrIframeKey[i].key.split('_')[0]=='markChanM'){
			parent.$('#btnPTDX').linkbutton('disable');
			parent.$('#btnQFDX').linkbutton('disable');
			parent.$('#btnZTDXTZ').linkbutton('disable');
			break;
		}else{
			parent.$('#btnPTDX').linkbutton('enable');
			parent.$('#btnQFDX').linkbutton('enable');
			parent.$('#btnZTDXTZ').linkbutton('enable');
			//优惠提醒短信
			parent.$('#btnM').linkbutton('enable');
			//优惠提醒闪信
			parent.$('#btnMFlash').linkbutton('enable');
		}
	}
	return false;
};

common.getlength=function(str) {
	var len = 0;
	var v = $.trim(str);
	for(i=0;i<v.length;i++)	{
		if(v.charCodeAt(i)>256)	{
			len += 2;
		} else {
			len++;
		}
	}
	return len;
}

//处理键盘事件 禁止后退键（Backspace）密码或单行、多行文本框除外
function banBackSpace(e){
var ev = e || window.event;//获取event对象
var obj = ev.target || ev.srcElement;//获取事件源

var t = obj.type || obj.getAttribute('type');//获取事件源类型

//获取作为判断条件的事件类型
var vReadOnly = obj.getAttribute('readonly');
var vEnabled = obj.getAttribute('enabled');
//处理null值情况
vReadOnly = (vReadOnly == null) ? false : vReadOnly;
vEnabled = (vEnabled == null) ? true : vEnabled;

//当敲Backspace键时，事件源类型为密码或单行、多行文本的，
//并且readonly属性为true或enabled属性为false的，则退格键失效
var flag1=(ev.keyCode == 8 && (t=="password" || t=="text" || t=="textarea")
&& (vReadOnly==true || vEnabled!=true))?true:false;

//当敲Backspace键时，事件源类型非密码或单行、多行文本的，则退格键失效
var flag2=(ev.keyCode == 8 && t != "password" && t != "text" && t != "textarea")
?true:false;

//判断
if(flag2){
return false;
}
if(flag1){
return false;
}
}

//禁止后退键 作用于Firefox、Opera
document.onkeypress=banBackSpace;
//禁止后退键 作用于IE、Chrome
document.onkeydown=banBackSpace;


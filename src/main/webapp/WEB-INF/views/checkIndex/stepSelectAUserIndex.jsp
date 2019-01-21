<%@ page language="java" pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<%@include file="/include.jsp"%>
	<title></title>
	<script type="text/javascript">
	var total = "";
	var rindex = "";
	var step_id = "";
	var show_user = "";
	var user_value = "";
	$(document).ready(function() {
		$.messager.defaults = { ok: "是", cancel: "否" }; 
		$('#dg').datagrid({
		    url:"/FirstHandHousing/getChannelInfoList.do?_activeId=${_activeId}",
			method:'get',
			fitColumns: true,
		    singleSelect: true,
			loadMsg:'加载中...',
			striped: true,
		    fit: true,
		    pagination: false,
			rownumbers: true,
			onClickRow:function(rowIndex, rowData){
    			rindex = rowIndex+1;
    			step_id = rowData.step_id;
   			},
			onLoadSuccess : function(data) {
				if(data.rows.length == 0){
					var body = $(this).data().datagrid.dc.body2;
					body.find('table tbody').append('<tr><td width = "'+body.width()+'" style = "height:25px;text-align:center;">当前没有相关信息！</td></tr>');
				}else
					total = data.cnt;
			},
			 columns:[[
						{field:'step_id',title:'步骤id',width:150,align:'left',
						formatter: function(value,row,index){
							return "<span title='" + value + "'>" + value + "</span>";
						}},
						{field:'step_status',title:'步骤状态编码',hidden:true,width:80,align:'left',
						formatter: function(value,row,index){
							return "<span title='" + value + "'>" + value + "</span>";
						}},
						{field:'dict_name',title:'步骤状态',width:120,align:'left',
						formatter: function(value,row,index){
							return "<span title='" + value + "'>" + value + "</span>";
						}},
						{field:'channel_type',title:'步骤名称',hidden:true,width:100,align:'left',
						formatter: function(value,row,index){
							return "<span title='" + value + "'>" + value + "</span>";
						}},
						{field:'channel_name',title:'部门',width:100,align:'left',
						formatter: function(value,row,index){
							return "<span title='" + value + "'>" + value + "</span>";
						}},
						{field:'caozuo',title:'操作选项',width:80,align:'center'}
			    ]]
			});
		
		$('#btnClose').bind('click', function() {    
			parent.$('#win').window('close');
		});
		
		$('#btnOk').bind('click', function() { 
			//比较是否都选择了审核人
			var n=(user_value.split(';')).length-1; 
			if(n==total){
				var params = {
					'active_id':'${_activeId}',
					'user_value':user_value
				};
				$.ajax({
					type: 'post',
					url:'/homePage/doSaveAsFormInfo.do',
					data: params,
					dataType: 'text',
					async: false,
					success:function(data){
						var aj = $.parseJSON(data);
						if (aj.success) {
							parent.reload1();
				    	}else {
							$.messager.alert('提示','提交审核失败!','error');
				    	}
					}
				});
			}else{
				$.messager.alert('提示','请为需要审核的渠道选择审核人!','warning');
			}
		});
		
	});
	
	function selectUserFunc(channel_type,step_id){
		//判断是否选择，如果选择则提示是否重新选择
		if(user_value.indexOf(step_id)!=-1){
			$.messager.confirm('确认', '您已经为此步骤选择了审批人，是否重新选择？', 
				function(r){
					if (r){
						winOpen(channel_type);
					}
			});
		}else{
			winOpen(channel_type);
		}
	}
	
	function winOpen(channel_type){
		var step_ids = "step_ids";
		var content = '<iframe scrolling="auto" frameborder="0" src="/homePage/'+step_ids+'/userInfoIndex.do?activeid=${_activeId}&channel_type='+channel_type+'" style="width:100%;height:96%;overflow-x:hidden;overflow:auto;"></iframe>';
    	$('#win').window({
    		title: '人员列表',
		    width: 700,
		    height: 290,
		    content: content,
		    minimizable: false,
		    maximizable: false,
		    collapsible: false,
		    closable: true,
		    method:'get',
		    modal:true
		});
    	$('#win').window('refresh');
    	$('#win').window('center');
    	$('#win').window('open');
	}
	</script>
</head>
  
  <body style="margin: 0px;" bgcolor="#FFFFFF">
  	<div data-options="region:'north'" style="height:300px;">
  		<table id="dg"></table>
  	</div>
	<div data-options="region:'center'" style="height:40px;" align="center">
		<a href="javascript:void(0)" id="btnOk" class="easyui-linkbutton" data-options="iconCls:'icon-ok'">提交审核人</a>
		<a href="javascript:void(0)" id="btnClose" class="easyui-linkbutton" data-options="iconCls:'icon-cancel'">取消</a>
	</div>
	<!-- <div>
		已选择人员（对应行号）：<input class="input" style="width:400px" id="userinput"/>
	</div> -->
	<div id="win" class="easyui-window" data-options="closed:true,resizable:false"></div>
	</body>
</html>

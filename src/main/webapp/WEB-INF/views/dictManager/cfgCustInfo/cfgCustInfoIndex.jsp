<%@ page language="java" pageEncoding="UTF-8"%>

<html>
<head>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
	<%@include file="/include.jsp"%>
<title>客户信息管理</title>
<style>
	.datagrid-toolbar {
	height: auto;
	background: none repeat scroll 0% 0% rgb(239, 239, 239);
	padding: 1px 2px;
	border-bottom: 1px solid rgb(204, 204, 204);
	}
</style>
</head>
<script type="text/javascript">
$(document).ready(function() {
	
	
	var role='${role}';
	if("1"!=role){
		$("#btnUse").show();
	}else{
		$("#btnUse").hide();
	}
	
	
	$('#btnEdit').bind('click', function() {
		
		$.ajax({
	    	type: "get",
            url: "/common/getSeq.do?seq_name=seq_stakeholder_id",
            dataType: "text",
            success: function (data) {
            	var aj = $.parseJSON(data);
            	if (aj.success) {
            		var  aa=aj.attributes.nextvalue;
					$('#cust_id').val(aa);           		
            	}else{
            		$.messager.alert('提示', aj.msg,'error');
            		
            	}
            	
            }
		});
		
		
		/*证件类型 */
		$('#id_type').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=7',
			valueField : 'value',
			textField : 'name',
			panelHeight : '100',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				comboboxLoadFirst(this, "value");
			}
		});
		
		/*收入来源 */
		$('#income_source').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=9',
			valueField : 'value',
			textField : 'name',
			panelHeight : '100',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				comboboxLoadFirst(this, "value");
			}
		});
		
		/*职业性质 */
		$('#occup_type').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=8',
			valueField : 'value',
			textField : 'name',
			panelHeight : '100',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				comboboxLoadFirst(this, "value");
			}
		});
		/*是否真实单位 */
		$('#is_true').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=10',
			valueField : 'value',
			textField : 'name',
			panelHeight : '100',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				comboboxLoadFirst(this, "value");
			}
		});
		
		
		
		
		/*单位性质 */
		$('#co_type').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=13',
			valueField : 'value',
			textField : 'name',
			panelHeight : '100',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				comboboxLoadFirst(this, "value");
			}
		});
		
		
		
		$("#win").window("open");
		$("#win").window("center");
	});


	function comboboxLoadFirst(obj, valueField) {
		var val = $(obj).combobox("getData");
		for ( var item in val[0]) {
			if (item == valueField) {
				$(obj).combobox("select", val[0][item]);
			}
		}
	}


	$('#dg').datagrid({
		title:'客户信息管理列表',
		url:"/cfgCustInfo/getcfgCustInfoList.do",
		toolbar: '#tb',
		fit: true,
		fitColumns: true,
		singleSelect: true,
		loadMsg:'加载中...',
		pagination: true,
		pageNumber:1,
		pageSize:15,
		pageList:[15,30],
		striped: true,
		rownumbers: true,
		onLoadError: function(data) {
			var content = '<iframe scrolling="auto" frameborder="0" src="/frameSysmgmt/showError.action?funcId=020201" style="width:100%;height:100%;overflow-x:hidden;overflow:auto;"></iframe>';
			top.$('#winErr').window({
				content: content
			});
			top.$('#winErr').window('center');
			top.$('#winErr').window('open');
		},
		onLoadSuccess : function(data) {
			
			if(data.rows.length == 0){
				var body = $(this).data().datagrid.dc.body2;
				body.find('table tbody').append('<tr><td width = "'+body.width()+'" style = "height:25px;text-align:center;">当前没有相关信息！</td></tr>');
			}
		},
		onClickRow:function(rowIndex, rowData) {
			var resultRows = $('#dg').datagrid('getSelections');
			 $('#btnUse').linkbutton('enable');
			
			
		},

		columns:[[
			{field:'cust_id',title:'cust_name',hidden:true,width:80,align:'left',formatter: function(value,row,index){
				if(value == null) value = '-';
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'cust_name',title:'人员名称',width:80,align:'left',formatter: function(value,row,index){
				if(value == null) value = '-';
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'id_type_name',title:'证件类型',width:80,align:'left',formatter: function(value,row,index){
				if(value == null) value = '-';
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'id_type',title:'证件类型',hidden:true,width:80,align:'left',formatter: function(value,row,index){
				if(value == null) value = '-';
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'id_number',title:'证件号',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'land_phone',title:'手机号码',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'occup_type_name',title:'职业性质',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'occup_type',title:'职业性质',width:80,align:'left',hidden:true, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}}/* ,
			{field:'is_true',title:'是否真实单位',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				if(value == "1") value = "是";
				if(value == "0") value = "否";
				return "<span title='" + value + "'>" + value + "</span>";
			}} */,
			{field:'income_source_name',title:'收入来源',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'income_source',title:'收入来源',width:80,align:'left',hidden:true, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'amount_value',title:'收入金额',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}}
			/* ,
			{field:'is_stream',title:'流水有无',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				if(value == "1") value = "有";
				if(value == "0") value = "无";
				return "<span title='" + value + "'>" + value + "</span>";
			}}
			,
			{field:'is_true_stream',title:'流水是否真实',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				if(value == "1") value = "是";
				if(value == "0") value = "否";
				return "<span title='" + value + "'>" + value + "</span>";
			}} */
			,
			{field:'co_type_name',title:'单位性质',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},{field:'co_type',title:'单位性质',width:80,align:'left',hidden:true, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'co_name',title:'工作单位',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'co_phone',title:'单位电话',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'co_address',title:'单位地址',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'account_name',title:'账户名',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'khh_name',title:'开户行',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}},
			{field:'account_id',title:'账号',width:80,align:'left',hidden:false, formatter: function(value,row,index){
				if(value == null) value = "-";
				return "<span title='" + value + "'>" + value + "</span>";
			}}
		]]
	});

	/* $('#dg').datagrid('load', {
		'channeltype':$('#channeltype').combobox('getValue')
	}); */
	
	
	$('#btnClose').bind('click', function() {
		$("#win").window("close");
	});
	
	
	//查询
	$('#btnQuery').bind('click', function() {
		$('#dg').datagrid('load', {
			'serchMsg':$('#serchMsg').val()
		});
	});
		
	
	$('#btnSave').bind('click', function() {
		
		var opt = $('#btnSave').linkbutton('options');
		if(!opt.disabled) {
			$('#formId').form('submit',{
				success:function(data) {
					var aj = $.parseJSON(data);
					if (aj.success) {
						$("#win").window("close");
						$.messager.alert('提示', '保存成功！');
						 $('#dg').datagrid('reload');
					}else{
						 $.messager.alert('提示', aj.msg);
						 $('#dg').datagrid('reload');
					}
			    }
			});
		}
    });

	if("2"==role){
		$('#btnUse').bind('click', function() {
			
			var opt = $('#btnUse').linkbutton('options');
			if(!opt.disabled) {
				var resultRows = $('#dg').datagrid('getSelections');
				var  row=resultRows[0];
				parent.$("#cust_id").val(row.cust_id);
				parent.$("#cust_id").val(row.cust_id);
				parent.$("#cust_name").val(row.cust_name);
				parent.$("#id_type").combobox("select", row.id_type);
				parent.$("#id_number").val(row.id_number);
				parent.$("#mobile_phone").val(row.mobile_phone);
				parent.$("#land_phone").val(row.land_phone);
				parent.$("#occup_type").combobox("select",row.occup_type);
				parent.$("#income_source").combobox("select",row.income_source);
				parent.$("#amount_value").val(row.amount_value);
				parent.$("#co_type").combobox("select",row.co_type);
				parent.$("#co_name").val(row.co_name);
				parent.$("#co_phone").val(row.co_phone);
				parent.$("#co_address").val(row.co_address);
				parent.$("#account_name").val(row.account_name);
				parent.$("#khh_name").val(row.khh_name);
				parent.$("#account_id").val(row.account_id);
			/* 	parent.$("#stream_value").val(row.stream_value);
				parent.$("#is_true").combobox("select",row.is_true);
				parent.$("#is_stream").val(row.is_stream);
				parent.$("#is_true_stream").val(row.is_true_stream);
				 */
				parent.$("#win2").window("close");
			}
	    });
		
		
		
	}else if("3"==role){
		$('#btnUse').bind('click', function() {
			var opt = $('#btnUse').linkbutton('options');
			if(!opt.disabled) {
				var resultRows = $('#dg').datagrid('getSelections');
				var  row=resultRows[0];
				parent.$("#cust_id_1").val(row.cust_id);
				parent.$("#cust_name_1").val(row.cust_name);
				parent.$("#id_type_1").combobox("select",row.id_type);
				parent.$("#id_number_1").val(row.id_number);
				parent.$("#mobile_phone_1").val(row.mobile_phone);
				parent.$("#land_phone_1").val(row.land_phone);
				parent.$("#occup_type_1").combobox("select",row.occup_type);
				parent.$("#income_source_1").combobox("select",row.income_source);
				parent.$("#amount_value_1").val(row.amount_value);
				parent.$("#co_type_1").combobox("select",row.co_type);
				parent.$("#co_name_1").val(row.co_name);
				parent.$("#co_phone_1").val(row.co_phone);
				parent.$("#co_address_1").val(row.co_address);
				parent.$("#account_name_1").val(row.account_name);
				parent.$("#khh_name_1").val(row.khh_name);
				parent.$("#account_id_1").val(row.account_id);
			/* 	parent.$("#stream_value_1").val(row.stream_value);
				parent.$("#is_true_1").combobox("select",row.is_true);
				parent.$("#is_stream_1").combobox("select",row.is_stream);
				parent.$("#is_true_stream_1").combobox("select",row.is_true_stream);
				 */
				parent.$("#win2").window("close");
			}
	    });
		
	}
	
	

});


</script>
<body>
<table id="dg"></table>
<div id="tb">
<table>
 	<input type="hidden" id="delsql" name="delsql" value=""/>
	<tr>
		<td>个人信息：</td>
		<td>
			<input name="serchMsg" id="serchMsg" class="easyui-input " />
			<font color="#FF0000">（根据姓名模糊查询）</font>
		</td>
		<td>
		<div>  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		</td>
		<td><div ><a href="#" id="btnQuery" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a></div></td>
		<td><div ><a href="#" id="btnEdit" class="easyui-linkbutton"  data-options="iconCls:'icon-edit'">新增</a></div></td>
		<td><div ><a href="#" id="btnUse" class="easyui-linkbutton"  disabled data-options="iconCls:'icon-edit'">使用</a></div></td>
	</tr>
</table>

</div>
<div id="win" class="easyui-dialog" title="新增客户信息"  data-options="closed:true,resizable:false" style="width:800px;height:420px;">
	<form action="/cfgCustInfo/doSaveCfgCustInfoManage.do" id="formId">
			<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"   align="center">
		<td >
		    <span>主贷人id:</span>
			<input id="cust_id" class="easyui-validatebox" name="cust_id" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td   align="left">
		    <span>主贷人姓名:</span>
			<input id="cust_name" class="easyui-validatebox" name="cust_name" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr  width="100%"  align="center">
		<td>
		    <span>证件类型:</span>
			<input id="id_type" class="easyui-combobox input" name="id_type"  style="width:230px;height:28px"  ></input>
		</td>
		<td align="left">
		    <span>证件号:</span>
		    <input id="id_number" class="easyui-validatebox" name="id_number"  style="width:230px;height:23px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>移动电话:</span>
			<input id="mobile_phone" class="easyui-validatebox" name="mobile_phone" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>家庭电话:</span>
			<input id="land_phone" class="easyui-validatebox" name="land_phone" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
	
		<tr width="100%"  align="center">
		<td>
		    <span>收入金额:</span>
			<input id="amount_value" class="easyui-validatebox" name="amount_value" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>收入来源:</span>
			<input id="income_source" class="easyui-combobox input" name="income_source" style="width:230px;height:28px;" />
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>职业性质:</span>
			<input id="occup_type" class="easyui-combobox input" name="occup_type" style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<!-- <td align="left">
		    <span>是否真实单位:</span>
		    <input id="is_true" class="easyui-combobox input" name="is_true" style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td> -->
		</tr>
		
	<!-- 	<tr width="100%"  align="center">
		<td>
		    <span>流水有无:</span>
			<select id="is_stream" name="is_stream" class="easyui-validatebox" style="width:230px;height:28px;" >
		    	<option value="1">有</option>
		    	<option value="0">无</option>
		    </select>
		</td>
		<td align="left">
		    <span>流水是否真实:</span>
		    <select id="is_true_stream" name="is_true_stream" class="easyui-validatebox" style="width:230px;height:28px;" >
		    	<option value="1">是</option>
		    	<option value="0">否</option>
		    </select>
		</td>
		</tr> -->
		
		<tr width="100%"  align="center">
		<!-- <td>
		    <span>补充流水:</span>
			<input id="stream_value" class="easyui-validatebox" name="stream_value" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td> -->
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>单位性质:</span>
			<!-- <input id="co_type" class="easyui-combobox input" name="co_type" style="width:230px;height:28px;"  data-options="required:true"/> -->
			<input id="co_type" class="easyui-combobox input"  name="co_type"  style="width:230px;height:28px"  ></input>
		</td>
		<td align="left">
		    <span>工作单位:</span>
			<input id="co_name" class="easyui-validatebox" name="co_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>单位电话:</span>
			<input id="co_phone" class="easyui-validatebox" name="co_phone" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>单位地址:</span>
			<input id="co_address" class="easyui-validatebox" name="co_address" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>账户名:</span>
			<input id="account_name" class="easyui-validatebox" name="account_name" style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>开户行:</span>
			<input id="khh_name" class="easyui-validatebox" name="khh_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td >
		    <span>账号:</span>
			<input id="account_id" class="easyui-validatebox" name="account_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		
		</table>
			<div style="height:10px;"></div>
			<div   align="center">
		   			<a href="#" id="btnClose" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">关闭</a>
		   			<a href="#" id="btnSave" class="easyui-linkbutton" data-options="iconCls:'icon-edit'">保存</a>
			</div>
	</form>
</div>
</body>
</html>

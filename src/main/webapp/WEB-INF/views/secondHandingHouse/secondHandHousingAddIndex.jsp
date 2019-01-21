<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page import="com.core.utils.GlobalConst"%>
<%@ page import="com.core.entity.SessionBean"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%
	SessionBean sessionBean = (SessionBean)request.getSession().getAttribute(GlobalConst.SESSION_KEY);
%>
<html>
<head>
	<title>新增二手房信息</title>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<%@include file="/include.jsp"%>
	<link href="<%=path%>/css/homePageStyle.css" rel="stylesheet" type="text/css" />
	<style rel="stylesheet" type="text/css">
		.panel-title {
		    font-weight: bold;
		    color: #494949;
		    height: 30px;
		    line-height: 30px;
		    padding-left: 10px;
		    font-size:16px;
		}
		.panel-title i {
		    width: 5px;
		    height: 20px;
		    display: inline-block;
		    background-color: #f8a73d;
		    margin-right: 10px;
		    margin-top: 5px;
		    float: left;
		}
		#loading {
			height:100px;
			width:290px;
			background-image: url("../images/sys/div_loading_bg.gif");
			background-repeat: no-repeat;
			background-position: left top;
		}

		.bgDiv{
			background:white;
			filter:	progid:DXImageTransform.Microsoft.Shadow(color="#777777", Direction=135, Strength=4)
							alpha(Opacity=60);
			-moz-opacity:		0.6;
			z-index:			111;
			position:absolute;
			left:0px;
			top:0px;
		}
		td{
			font-family: "Microsoft YaHei" !important;
			font-size: 13px;
		}
		span{
			font-family: "Microsoft YaHei" !important;
		}
		.datagrid-cell span{
			font-family: "Microsoft YaHei" !important;
			font-size: 13px;
		}
		.datagrid-toolbar td{
			font-size: 13px;
		}
		.label2{font-size: 13px;text-align:right;vertical-align:middle;width:155px;height:23px;color:#8B8878;background:#fafafa;padding:1px;}
	</style>
	<script type="text/javascript">
	
	
	 function comboboxLoadFirst(obj, valueField) {
			var val = $(obj).combobox("getData");
			for ( var item in val[0]) {
				if (item == valueField) {
					$(obj).combobox("select", val[0][item]);
				}
			}
	 }
	
	$(document).ready(function() {
		
		var type='${type}';
		if("add"==type){
			$.ajax({
		    	type: "get",
	            url: "/common/getSeq.do?seq_name=seq_case_id",
	            dataType: "text",
	            success: function (data) {
	            	var aj = $.parseJSON(data);
	            	if (aj.success) {
	            		var  aa=aj.attributes.nextvalue;
						$('#case_id').val(aa);           		
	            	}else{
	            		$.messager.alert('提示', aj.msg,'error');
	            		
	            	}
	            	
	            }
			});
			
		}
		
		
		
		
		/*贷款年限 */
		$('#loan_year').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=3',
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
		
		/*还款方式 */
		$('#repay_type').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=2',
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
		
		/*贷款类型 */
		$('#loan_type').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=4',
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
		
		/*交易方式*/
		$('#pretrade_bus_type').combobox({
			url : '/FirstHandHousing/getDictByType.do?type=6',
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
		
		/*房屋地址*/
		$('#pretrade_house1').combobox({
			url : '/FirstHandHousing/getPretradeHouse.do?type=1',
			valueField : 'value',
			textField : 'name',
			panelHeight : '80',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				comboboxLoadFirst(this, "value");
			},
			onSelect:function(record){
				var  value = record.value;
				$('#pretrade_house2').combobox({
					url : '/FirstHandHousing/getPretradeHouse.do?type=2&pretrade_house='+value,
					valueField : 'value',
					textField : 'name',
					panelHeight : '100',
					editable : false,
					method : 'get',
					required : true,
					onLoadSuccess : function() { 
						comboboxLoadFirst(this, "value");
					},
					onSelect:function(record1){
						var  value1 = record1.value;
						$('#pretrade_house3').combobox({
							url : '/FirstHandHousing/getPretradeHouse.do?type=3&pretrade_house='+value1,
							valueField : 'value',
							textField : 'name',
							panelHeight : '200',
							editable : false,
							method : 'get',
							required : true,
							onLoadSuccess : function() { 
								comboboxLoadFirst(this, "value");
							},
							onSelect:function(record3){
								var  value3 = record3.value;
								$('#pretrade_house4').combobox({
									url : '/FirstHandHousing/getPretradeHouse.do?type=4&pretrade_house='+value3,
									valueField : 'value',
									textField : 'name',
									panelHeight : '200',
									editable : false,
									method : 'get',
									required : true,
									onLoadSuccess : function() { 
										comboboxLoadFirst(this, "value");
									}
								});
								
							}
						});
					}
				});
				
			}
		});
		
		
		
		
		
		/*贷款银行*/
		$('#loan_branch').combobox({
			url : '/FirstHandHousing/getLoanBank.do?type=1',
			valueField : 'value',
			textField : 'name',
			panelHeight : '100',
			editable : false,
			method : 'get',
			required : true,
			onLoadSuccess : function() { 
				 $("#loan_subbranch").attr("disabled",false);
				/* comboboxLoadFirst(this, "value"); */
			},
			onSelect:function(record){
				var  value = record.value;
				/* $('loan_subbranch').disabled('false'); */
				$('#loan_subbranch').combobox({
					url : '/FirstHandHousing/getLoanBank.do?type=3&bank_id='+value,
					valueField : 'value',
					textField : 'name',
					panelHeight : 200,
					multiple : false,
					editable : false,
					method : 'get',
					required : true,
					onLoadSuccess:function(record1){
						 comboboxLoadFirst(this, "value");
					}
				});
			}
				
		});
		
		$('#btnReturn').bind('click',function(){
			
			$.messager.confirm('确认', '您确定要关闭本页吗？',
					function(r){
						if (r){
							window.close();
				}}
			);
			
		})
		
		
		/* 
		$('#btnCount').bind('click', function() {
			var opt = $('#btnCount').linkbutton('options');
			
	    	if(!opt.disabled) {
		    	var content = '<iframe id="cfgCustInfoIndex" scrolling="auto" frameborder="0" src="/cfgCustInfo/cfgCustInfoIndex.do" style="width:100%;height:100%;overflow-x:hidden;overflow:auto;"></iframe>';
		    	var title = "选择贷款人";
		    	var tab =$('#tt').tabs('getTab',title);
				if(null !== tab) {
					parent.parent.$('#tt').tabs('select',title);
				} else {
					  $('#tt').tabs('add',{
						id: 'cfgCustInfoIndex',
						title: title,
						content:content,
						selected: true,
						closable: true
					});
				}
	    	}
		});
		 */ 
		
		
		$('#btnSubmit').bind('click', function() {
			if(true){
				var content = '<iframe scrolling="auto" frameborder="0" src="/FirstHandHousing/stepSelectAuser.do" style="width:100%;height:96%;overflow-x:hidden;overflow:auto;"></iframe>';
		     	$('#win').window({
		     		title: '选择审批人员',
		 		    width: 800,
		 		    height: 450,
		 		    content: content,
		 		    minimizable: false,
		 		    maximizable: false,
		 		    collapsible: false,
		 		    closable: true,
		 		    method:'get',
		 		    modal:true
		 		});
		     	$('#win').window('refresh');
		     	$('#win').window('open');
			}
		});	
		
		
		
		$('#activetype').combogrid({ 
			  panelWidth: 800,
			  panelHeight: 200,
			  position: 'right',
			  idField: 'active_type_id',
			  textField: 'active_type_name',
			  toolbar:'#tb',
			  pagination : true,//是否分页  
			  rownumbers:true,//序号  
			  fit: true,//自动大小  
			  pageSize: 5,//每页显示的记录条数，默认为10  
			  pageList: [5],//可以设置每页记录条数的列表  
			  multiple : false,
			  required : true,
			  editable : false,
			  onChange : function(newvalue,oldvalue){
				  if(newvalue=='10099'){
					  $.messager.alert('提示', '该分类不可选，请重新选择别的分类！！！','warning');
					  $(this).combogrid('clear');
				  }
			  },
			  loadMsg:'正在加载...',
			  url: '/basicInfo/getActiveTypeInfo.do',
			  columns: [[
				{field:'active_type_id',title:'分类编码',width:80,align:'left',formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				}},
				{field:'active_type_name',title:'分类名称',width:80,align:'left',formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				}},
				{field:'active_type_seq',title:'优先级',width:40,align:'left',hidden:false, formatter: function(value,row,index){
					if(value == null) value = "-";
					return "<span title='" + value + "'>" + value + "</span>";
				}}
			  ]],
			  fitColumns: true
		  });
		
		
		
	
	});
	
		
	
	</script>
</head>

<body >
	 <div id="buttonDiv" >
		<table  width="100%" height="auto" bgcolor="#FFFFFF" >
			<tr>
			<td height="auto"  bgcolor="#FFFFFF" align="center">
				<a href="#" id="btnSubmit" class="easyui-linkbutton" >提交审批</a>
				<a href="#" id="btnSave" class="easyui-linkbutton" >保存</a>
				<a href="#" id="btnReturn" class="easyui-linkbutton" >关闭</a>
			</td>
		</table>
	</div>
	<form action="">
<!-- 	<div>
	<table width="100%" height="auto" bgcolor="#FFFFFF" >
		 <tr>
			<td align="center"  width="50%">
			    <span>案子编码:</span>
				<input id="case_id" class="easyui-validatebox" name="active_type_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
			<td align="center" width="50%">
				 <span>案子名称:</span>
				<input id="case_name" class="easyui-validatebox" name="active_type_name" style="width:360px;height:23px;"  data-options="required:true,validType:'vname'"/>
		    </td>
			</tr>
	</table>
	</div> -->
	<div title="<i></i>基本信息" style="padding-bottom:6px;height:80px" class="easyui-panel" data-options="collapsible:false">
	<table width="100%" height="auto" bgcolor="#FFFFFF" >
		 <tr width="100%"  align="center">
			<td>
			    <span>案子编码:</span>
				<input id="case_id" class="easyui-validatebox" value="${case_id}"  name="active_type_id" style="width:280px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
			</td>
			<td >
				 <span>案子名称:</span>
				<input id="case_name" class="easyui-validatebox" value="${active_type_name}" name="active_type_name" style="width:360px;height:23px;"  data-options="required:true,validType:'vname'"/>
		    </td>
			</tr>
			<tr><td></td></tr>
	</table>
	</div>
		
	<div title="<i></i>贷款信息" style="padding-bottom:6px;height:200px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td>
		    <span class="label">贷款金额:</span>
			<input id="loan_fee" class="easyui-validatebox" name="loan_fee" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span class="label">贷款年限:</span>
			<input id="loan_year" class="easyui-combobox input" name="loan_year"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span class="label">还款方式:</span>
		    <input id="repay_type" class="easyui-combobox input" name="repay_type"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>贷款类型:</span>
			 <input id="loan_type" class="easyui-combobox input" name="loan_type"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span class="label">贷款银行:</span>
			 <input id="loan_branch"  readOnly   class="easyui-combobox input" name="loan_branch"  style="width:280px;height:28px"  data-options="disabled:false"></input>
			 
		</td>
		<td>
		    <span>审批支行:</span>
			 <input id="loan_subbranch" readOnly class="easyui-combobox input" name="loan_subbranch"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>网签价格:</span>
			<input id="contract_price" class="easyui-validatebox" name="contract_price" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>审批单价:</span>
			<input id="exam_unit_price" class="easyui-validatebox" name="exam_unit_price" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>贷款比例:</span>
			<input id="loan_scale" class="easyui-validatebox" name="loan_scale" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>还款账号:</span>
			<input id="repay_account" class="easyui-validatebox" name="repay_account" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>客户经理:</span>
			<input id="customer_manager" class="easyui-validatebox" name="customer_manager" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>虚高比例:</span>
			<input id="high_scale" class="easyui-validatebox" name="high_scale" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		</table>
	</div>
	
	<div title="<i></i>房屋信息" style="padding-bottom:6px;height:200px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td>
		    <span>交易方式:</span>
			<input id="pretrade_bus_type" class="easyui-combobox input" name="pretrade_bus_type" style="width:280px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="right">
		    <span>房屋地址:</span>
			<input id="pretrade_house1" class="easyui-combobox select" name="pretrade_house"  style="width:90px;height:28px"  data-options="disabled:false"></input>
			<input id="pretrade_house2" class="easyui-combobox select" name="pretrade_house"  style="width:90px;height:28px"  data-options="disabled:false"></input>
			<input id="pretrade_house3" class="easyui-combobox select" name="pretrade_house"  style="width:95px;height:28px"  data-options="disabled:false"></input>
			<input id="pretrade_house4" class="easyui-combobox select" name="pretrade_house"  style="width:100px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span>详细地址:</span>
		    <input id="pretrade_house_detail" class="easyui-validatebox" name="pretrade_house_detail"  style="width:260px;height:28px"  data-options="required:true,validType:'vname'"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>契约证号:</span>
			<input id="newhouse_qyz" class="easyui-validatebox" name="newhouse_qyz" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>不动产号:</span>
			<input id="afttrade_bdc_id" class="easyui-validatebox" name="afttrade_bdc_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>房产面积:</span>
			<input id="pretrade_area" class="easyui-validatebox" name="pretrade_area" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>建筑楼层:</span>
			<input id="pretrade_floor" class="easyui-validatebox" name="pretrade_floor" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>建筑年代:</span>
			<input id="pretrade_age" class="easyui-validatebox" name="pretrade_age" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>土地年限:</span>
			<input id="newhouse_tdnx" class="easyui-validatebox" name="newhouse_tdnx" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>成交价格:</span>
			<input id="pretrade_price" class="easyui-validatebox" name="pretrade_price" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>成交单价:</span>
			<input id="pretrade_unit_price" class="easyui-validatebox" name="pretrade_unit_price" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		  
		</td>
		</tr>
		
		</table>
	</div>
	
	
	<div title="<i></i>楼盘及开发商信息" style="padding-bottom:6px;height:250px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td align="center">
		    <span>楼盘名称:</span>
			<input id="newhouse_lpmc" class="easyui-validatebox" name="loan_amount" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>楼盘地址:</span>
			<input id="newhouse_addrest" class="easyui-validatebox" name="newhouse_addrest"  style="width:480px;height:28px"  data-options="required:true,validType:'vname'"></input>
		</td>
		<!--  <td align="left">
		    <span>贷款方式:</span>
		    <input id="loan_method" class="easyui-validatebox" name="loan_method"  style="width:260px;height:28px"  data-options="required:true,validType:'vname'"></input>
		</td>  -->
		</tr>
		<tr width="100%"  align="center">
		<td align="center">
		    <span>楼盘电话:</span>
			<input id="newhouse_phone" class="easyui-validatebox" name="newhouse_phone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>楼盘负责人:</span>
			<input id="newhouse_man" class="easyui-validatebox" name="newhouse_man" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>楼盘负责人电话:</span>
			<input id="newhouse_man_ph" class="easyui-validatebox" name="newhouse_man_ph" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td align="center">
		    <span>楼盘开发商:</span>
			<input id="newhouse_dever" class="easyui-validatebox" name="newhouse_dever" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>楼盘开发商地址:</span>
			<input id="newhouse_dever_ads" class="easyui-validatebox" name="newhouse_dever_ads" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		
		</tr>
		
		<tr width="100%"  align="center">
		<td align="center">
		    <span>楼盘开发商电话:</span>
			<input id="newhouse_dever_ph" class="easyui-validatebox" name="newhouse_dever_ph" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>财务负责人:</span>
			<input id="newhouse_fin" class="easyui-validatebox" name="newhouse_fin" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>财务负责人电话:</span>
			<input id="newhouse_fin_ph" class="easyui-validatebox" name="newhouse_fin_ph" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td align="center">
		    <span>下款账户:</span>
			<input id="newhouse_dever_act" class="easyui-validatebox" name="newhouse_dever_act" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>开户行:</span>
			<input id="newhouse_dever_khg" class="easyui-validatebox" name="newhouse_dever_khg" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
	</div>
	
	 
	<div title="<i></i>楼盘销售人员" style="padding-bottom:6px;height:150px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td>
		    <span>销售员:</span>
			<input id="newhouse_seller" class="easyui-validatebox" name="newhouse_seller" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>销售员手机:</span>
			<input id="newhouse_sel_ph" class="easyui-combobox input" name="newhouse_sel_ph"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span>销售员办公电话:</span>
		    <input id="newhouse_sel_ph2" class="easyui-combobox input" name="newhouse_sel_ph2"  style="width:260px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>销售员账户名:</span>
			<input id="newhouse_sel_actn" class="easyui-validatebox" name="newhouse_sel_actn" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>销售员开户行:</span>
			<input id="newhouse_sel_khh" class="easyui-validatebox" name="newhouse_sel_khh" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>

		
		</table>
	</div>
	
	
	
	<div title="<i></i>主贷人信息" style="padding-bottom:6px;height:300px" class="easyui-panel" data-options="collapsible:false">
		
		
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td align="center">
		    <span>主贷人id:</span>
			<input id="cust_id" class="easyui-validatebox"  name="cust_id" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td  >
		    <span>主贷人姓名:</span>
			<input id="cust_name" class="easyui-validatebox" name="cust_name" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>证件类型:</span>
			<input id="id_type" class="easyui-combobox input" name="id_type"  style="width:230px;height:28px" readonly ></input>
		</td>
	
		</tr>
		<tr width="100%"  align="center">
			<td align="center">
		    	<span>证件号:</span>
		   	 	<input id="id_number" class="easyui-validatebox" name="id_number" readonly style="width:230px;height:23px"  data-options="disabled:false"></input>
			</td>
			<td>
		   	 	<span>移动电话:</span>
				<input id="mobile_phone" class="easyui-validatebox" name="mobile_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
			<td align="left">
			    <span>家庭电话:</span>
				<input id="land_phone" class="easyui-validatebox" name="land_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>职业性质:</span>
			<input id="occup_type" class="easyui-combobox input" name="occup_type" readonly  style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>收入金额:</span>
			<input id="amount_value" class="easyui-validatebox" name="amount_value" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>收入来源:</span>
			<input id="income_source" class="easyui-combobox input" name="income_source" readonly style="width:230px;height:28px;" />
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td align="center">
		    <span>是否真实单位:</span>
		    <input id="is_true" class="easyui-combobox input" name="is_true" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>流水有无:</span>
			<select id="is_stream" name="is_stream" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">有</option>
		    	<option value="0">无</option>
		    </select>
		</td>
		<td align="left">
		    <span>流水是否真实:</span>
		    <select id="is_true_stream" name="is_true_stream" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">是</option>
		    	<option value="0">否</option>
		    </select>
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td>
		    <span>补充流水:</span>
			<input id="stream_value" class="easyui-validatebox" name="stream_value" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>单位性质:</span>
			<input id="co_type" class="easyui-combobox input" name="co_type" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>工作单位:</span>
			<input id="co_name" class="easyui-validatebox" name="co_name" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<!-- <tr width="100%"  align="center">
		
		</tr> -->
		<tr width="100%"  align="center">
		<td>
		    <span>单位电话:</span>
			<input id="co_phone" class="easyui-validatebox" name="co_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>单位地址:</span>
			<input id="co_address" class="easyui-validatebox" name="co_address" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
		<div align="center">
		<td ><a href="/cfgCustInfo/cfgCustInfoIndex.do" id="btnCount" name="btnCount" target="_Blank" class="easyui-linkbutton" data-options="plain:false" >选择主贷人信息</a>
		</div>
		<div style="height:20px;">
		
		</div>
	</div>
	
	
	
	<div title="<i></i>共还人信息" style="padding-bottom:6px;height:350px" class="easyui-panel" data-options="collapsible:false">
		
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td align="center">
		    <span>主贷人id:</span>
			<input id="cust_id" class="easyui-validatebox"  name="cust_id" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td  >
		    <span>主贷人姓名:</span>
			<input id="cust_name" class="easyui-validatebox" name="cust_name" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>证件类型:</span>
			<input id="id_type" class="easyui-combobox input" name="id_type"  style="width:230px;height:28px" readonly ></input>
		</td>
	
		</tr>
		<tr width="100%"  align="center">
			<td align="center">
		    	<span>证件号:</span>
		   	 	<input id="id_number" class="easyui-validatebox" name="id_number" readonly style="width:230px;height:23px"  data-options="disabled:false"></input>
			</td>
			<td>
		   	 	<span>移动电话:</span>
				<input id="mobile_phone" class="easyui-validatebox" name="mobile_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
			<td align="left">
			    <span>家庭电话:</span>
				<input id="land_phone" class="easyui-validatebox" name="land_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>职业性质:</span>
			<input id="occup_type" class="easyui-combobox input" name="occup_type" readonly  style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>收入金额:</span>
			<input id="amount_value" class="easyui-validatebox" name="amount_value" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>收入来源:</span>
			<input id="income_source" class="easyui-combobox input" name="income_source" readonly style="width:230px;height:28px;" />
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td align="center">
		    <span>是否真实单位:</span>
		    <input id="is_true" class="easyui-combobox input" name="is_true" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>流水有无:</span>
			<select id="is_stream" name="is_stream" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">有</option>
		    	<option value="0">无</option>
		    </select>
		</td>
		<td align="left">
		    <span>流水是否真实:</span>
		    <select id="is_true_stream" name="is_true_stream" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">是</option>
		    	<option value="0">否</option>
		    </select>
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td>
		    <span>补充流水:</span>
			<input id="stream_value" class="easyui-validatebox" name="stream_value" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>单位性质:</span>
			<input id="co_type" class="easyui-combobox input" name="co_type" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>工作单位:</span>
			<input id="co_name" class="easyui-validatebox" name="co_name" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<!-- <tr width="100%"  align="center">
		
		</tr> -->
		<tr width="100%"  align="center">
		<td>
		    <span>单位电话:</span>
			<input id="co_phone" class="easyui-validatebox" name="co_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>单位地址:</span>
			<input id="co_address" class="easyui-validatebox" name="co_address" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
		<div align="center">
		<td ><a href="/cfgCustInfo/cfgCustInfoIndex.do" id="btnCount" name="btnCount" target="_Blank" class="easyui-linkbutton" data-options="plain:false" >选择共还人信息</a>
		</div>
		<div style="height:20px;">
		
		</div>
	</div>
	
	 <div title="<i></i>中介人信息" style="padding-bottom:6px;height:300px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td>
		    <span>中介编码:</span>
			<input id="agency_id" class="easyui-validatebox" name="agency_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>中介全称:</span>
			<input id="agency_name" class="easyui-combobox input" name="agency_name"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>中介电话:</span>
			<input id="agency_phone" class="easyui-validatebox" name="agency_phone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>中介地址:</span>
			<input id="agency_address" class="easyui-validatebox" name="agency_address" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>中介老板:</span>
			<input id="boss_name" class="easyui-validatebox" name="boss_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>中介老板手机:</span>
			<input id="boss_mphone" class="easyui-validatebox" name="boss_mphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>中介老板办公电话:</span>
			<input id="boss_lphone" class="easyui-validatebox" name="boss_lphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>权限负责人:</span>
			<input id="pm_name" class="easyui-validatebox" name="pm_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>权证负责人手机:</span>
			<input id="pm_mphone" class="easyui-validatebox" name="pm_mphone" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>权证负责人办公电话:</span>
			<input id="pm_lphone" class="easyui-validatebox" name="pm_lphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		
		<tr width="100%"  align="center">
		<td>
		    <span>业务接洽人:</span>
			<input id="bm_name" class="easyui-validatebox" name="bm_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>业务接洽人手机:</span>
			<input id="bm_mphone" class="easyui-validatebox" name="bm_mphone" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>业务接洽人办公电话:</span>
			<input id="bm_lphone" class="easyui-validatebox" name="bm_lphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>返款结算户名:</span>
			<input id="account_name" class="easyui-validatebox" name="account_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>结算卡开户行:</span>
			<input id="khh_name" class="easyui-validatebox" name="khh_name" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>账号:</span>
			<input id="account_id" class="easyui-validatebox" name="account_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
	</div>
	
	 
	<div title="<i></i>费用结项" style="padding-bottom:6px;height:400px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" border="1px">
		<thead>
		<th>项目名称</th>
		<th>单价</th>
		<th>数量</th>
		<th>费用</th>
		</thead>
		<tr width="100%" height="40px"  align="center">
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		<tr width="100%" height="40px"  align="center">
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		<tr width="100%"  height="40px"  align="center">
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		<tr width="100%"  height="40px"  align="center">
		<td align="center"  colspan="3">
		合计
		</td>
		<td>
		</td>
		</tr>
		
		</table>
	</div>
	
	<div title="<i></i>所缺材料" style="padding-bottom:6px;height:400px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" border="1">
		<thead>
		<th>类型</th>
		<th>材料名称</th>
		<th>数量</th>
		<th>原件/复印件</th>
		<th>备注</th>
		</thead>
		<tr  width="100%" height="40px"  align="center">
		<td >
		<!-- <input  style="width:180px;height:28px">
		<option>贷款人</option>
		</input> -->
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		<tr width="100%" height="40px"  align="center">
		<td >
		<!-- <input  style="width:180px;height:28px">
		<option>贷款人</option>
		</input> -->
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		<tr width="100%"  height="40px"  align="center">
		<td>
		<!-- <input  style="width:180px;height:28px">
		<option>贷款人</option>
		</input> -->
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		<td>
		</td>
		</tr>
		
		</table>
	</div>
	</form>
		<div id="win" class="easyui-window" data-options="modal:true,closed:true,resizable:true,left:'250px',top:'100px'"></div>
		<div id="centerPanel" data-options="region:'center',border:true,title:''" >
			<div id="tt" class="easyui-tabs" data-options="tabPosition:'top',fit:true,border:false,plain:true">
		</div>
	</div>
</body>

</html>
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
	<title>新增一手房信息</title>
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
		var caseId="";
		
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
	            		caseId=aa;
						$('#case_id').val(aa);           		
	            	}else{
	            		$.messager.alert('提示', aj.msg,'error');
	            		
	            	}
	            	
	            }
			});
			
		}
		
		

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
		
		
		/*证件类型 */
		$('#id_type_1').combobox({
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
		$('#income_source_1').combobox({
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
		$('#occup_type_1').combobox({
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
		$('#is_true_1').combobox({
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
		$('#co_type_1').combobox({
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
		

		$('#dg').datagrid({
			title:'费用结项',
			url:"/FirstHandHousing/crdtModifyFee.do",
			fit: true,
			fitColumns: true,
			singleSelect: true,
			loadMsg:'加载中...',
			pagination: true,
			pageNumber:1,
			pageSize:5,
			pageList:[5,10],
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
			/* onClickRow:function(rowIndex, rowData) {
				var resultRows = $('#dg').datagrid('getSelections');
				 $('#btnUse').linkbutton('enable');
				
				
			}, */
			columns:[[
				{field:'case_id',title:'case_id',hidden:true,width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				}},{field:'fee_item_id',title:'fee_item_id',hidden:true,width:80,align:'left',formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				}},
				{field:'fee_item_name',title:'项目名称',width:80,align:'left',formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}},
				{field:'unit_price',title:'单价',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}},
				{field:'count_num',title:'数量',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}},
				{field:'fee_amount',title:'费用',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',resize:'auto',options:{required:true,validType:'length[0,50]'}}}/* ,
				{field:'caozuo',title:'操作',width:40,align:'center',halign:'center',sortable:false,formatter: function(value,row,index){
					return '<input type="button" onclick="doEditOper(\''+row.fee_amount+'\',\''+row.count_num+'\',\''+row.unit_price+'\',\''+row.fee_item_name+'\',\''+row.fee_item_id+'\')" value="保存"/>';
				}} */
			]],toolbar: [{
	            text: '添加', iconCls: 'icon-add', handler: function () {
	            	var index=$('#dg').datagrid('appendRow', {
	            		state: '0',
	            		Delete:''
	            		}).datagrid("getRows").length-1;
	            		$('#dg').datagrid('beginEdit', index);
	            }
	        },'-', {
	            text: '删除', iconCls: 'icon-remove', handler: function () {
	                var row = $("#dg").datagrid('getSelections');
	                $("#dg").datagrid('destroyRow', row.index);
	                
	            }
	        }]
		});
		
		$('#dg').datagrid('load', {
			'case_id':caseId
		});
		
		function doEditOper(fee_amount,count_num,unit_price,fee_item_name,fee_item_id){
    		var param={'case_id':caseId,'fee_amount':fee_amount,'count_num':count_num,'unit_price':unit_price,'fee_item_name':fee_item_name,'fee_item_id':fee_item_id}; 
    		$.ajax({
				type: 'get',
				url: '/firstHandHousingAddIndex/saveCrdtModifyFee.do',
				data:param,
				dataType: 'json',
				success:function(data, textStatus) {
					if(data.success){
						 $.messager.alert('提示','保存成功!','success');
						 $('#dg').datagrid('reload');
					}else{
						 $.messager.alert('提示','保存失败!','warning');
					}
			    }
		})
			
    	}
		
		
		$('#grid_2').datagrid({
			title:'所缺材料',
			url:"/FirstHandHousing/getCrdtDataInfoList.do",
			fit: true,
			fitColumns: true,
			singleSelect: true,
			loadMsg:'加载中...',
			pagination: true,
			pageNumber:1,
			pageSize:5,
			pageList:[5,10],
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
			onBeforeEdit:function(index,row){
		        row.editing = true;
		        
		    },
			columns:[[
				{field:'case_id',title:'case_id',hidden:true,width:80,align:'left',formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				}},
				{field:'data_belong',title:'类型',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'combobox',options:{
					
					url : '/FirstHandHousing/getDictByType.do?type=19',
					valueField : 'value',
					textField : 'name',
               		 method: 'get',
                	required: true,
                	onSelect: function (rec) {
                	 var a=rec.name;	
                	
                	}
                }}},
				{field:'data_name',title:'材料名称',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}},
				{field:'data_count',title:'数量',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}},
				{field:'org_info',title:'原件',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}},
				{field:'remark',title:'备注',width:80,align:'left', formatter: function(value,row,index){
					if(value == null) value = '-';
					return "<span title='" + value + "'>" + value + "</span>";
				},editor:{type:'validatebox',options:{required:true,validType:'length[0,50]'}}}/* ,
				{field:'caozuo',title:'操作',width:40,align:'center',halign:'center',sortable:false,formatter: function(value,row,index){
					return '<input type="button" onclick="doEditOper1(\''+row.case_id+'\',\''+row.remark+'\',\''+row.data_count+'\',\''+row.org_info+'\',\''+row.data_name+'\',\''+row.data_belong+'\')" value="保存"/>';
				}} */
			]],toolbar: [{
	            text: '添加', iconCls: 'icon-add', handler: function () {
	            	var index=$('#grid_2').datagrid('appendRow', {
	            		state: '0',
	            		Delete:''
	            		}).datagrid("getRows").length-1;
	            		$("#grid_2").datagrid('beginEdit', index)
	            	
	            }
	        },'-', {
	            text: '删除', iconCls: 'icon-remove', handler: function () {
	                var row = $("#grid_2").datagrid('getSelections');
	                 
	            }
	        }]
		});
		
		$('#grid_2').datagrid('load', {
			'case_id':caseId
		});
		
		
		function doEditOper(fee_amount,count_num,unit_price,fee_item_name,fee_item_id){
			
			var param={'case_id':caseId,'remark':remark,'org_info':org_info,'data_count':data_count,'data_name':data_name,'data_belong':data_belong}; 
    		$.ajax({
				type: 'get',
				url: '/firstHandHousingAddIndex/saveCrdtDataInfo.do',
				data:param,
				dataType: 'json',
				success:function(data, textStatus) {
					if(data.success){
						 $.messager.alert('提示','保存成功!','success');
						 $('#grid_2').datagrid('reload');
					}else{
						 $.messager.alert('提示','保存失败!','warning');
					}
			    }
		})
			
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
		
		var i=1;
		var height=0;
		
		
	$('#delCust').bind('click',function(){
			
			$('#custTable'+(i-1)).remove();
			$('#divCust_'+(i-1)).remove();
			if(i>1){
				i=i-1;
			}else{
				i=1;
			}
			
			if(height>300){
				height=height-300;
			}else{
				height=100;
			}
			var newHeight=height+"px";
			$('#shareCust').css("height",newHeight);
			
			
		})
		
		
		$('#addCust').bind('click',function(){
			var table=add(i);
			$("#custAdd").append(table);
	        var tagobj = $('#custAdd');
	        $.parser.parse(tagobj);
			
	        /*证件类型 */
			$('#id_type_'+i).combobox({
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
			$('#income_source_'+i).combobox({
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
			$('#occup_type_'+i).combobox({
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
			$('#is_true_'+i).combobox({
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
			
			i=i+1;
			height=300+height;
			var newHeight=height+"px";
			/* $('#shareCust').style.setProperty('height',height+'px'); */
			/* $('#shareCust').style.height = newHeight;  */
			$('#shareCust').css("height",newHeight);
	        
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
		 
		 
		 
		 $('#btnCount').bind('click', function() {
			 var opt = $('#btnCount').linkbutton('options');
				if(!opt.disabled){
					var content = '<iframe scrolling="auto" frameborder="0" src="/cfgCustInfo/cfgCustInfoIndex.do?type=2" style="width:100%;height:96%;overflow-x:hidden;overflow:auto;"></iframe>';
			     	$('#win2').window({
			     		title: '选择审批人员',
			 		    width: 1000,
			 		    height: 650,
			 		    content: content,
			 		    minimizable: false,
			 		    maximizable: false,
			 		    collapsible: false,
			 		    closable: true,
			 		    method:'get',
			 		    modal:true
			 		});
			     	$('#win2').window('refresh');
			     	$('#win2').window('open');
			     	$('#win2').window('center');
				}
			});
		 
		 $('#btnCount_1').bind('click', function() {
			 var opt = $('#btnCount').linkbutton('options');
				if(!opt.disabled){
					var content = '<iframe scrolling="auto" frameborder="0" src="/cfgCustInfo/cfgCustInfoIndex.do?type=3" style="width:100%;height:96%;overflow-x:hidden;overflow:auto;"></iframe>';
			     	$('#win2').window({
			     		title: '选择审批人员',
			 		    width: 1000,
			 		    height: 650,
			 		    content: content,
			 		    minimizable: false,
			 		    maximizable: false,
			 		    collapsible: false,
			 		    closable: true,
			 		    method:'get',
			 		    modal:true
			 		});
			     	$('#win2').window('refresh');
			     	$('#win2').window('open');
			     	$('#win2').window('center');
				}
			});
		 
		 
		
		
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
	
	function  add(i){
	var	tables='	<table  width="100%" height="center" id="custTable'+i+'" bgcolor="#FFFFFF">                                                                                                                                    '
		+'	<tr width="100%"  align="center">                                                                                                                                                          '
		+'	<td align="center">                                                                                                                                                                        '
		+'	    <span>共还人id:</span>                                                                                                                                                                 '
		+'		<input id="cust_id_'+i+'" class="easyui-validatebox"  name="cust_id_'+i+'" style="width:230px;height:23px;" readonly data-options="required:true,validType:\'vname\'"/>                          '
		+'	</td>                                                                                                                                                                                      '
		+'	<td  >                                                                                                                                                                                     '
		+'	    <span>主贷人姓名:</span>                                                                                                                                                               '
		+'		<input id="cust_name_'+i+'" class="easyui-validatebox" name="cust_name_'+i+'" style="width:230px;height:23px;" readonly data-options="required:true,validType:\'vname\'"/>                       '
		+'	</td>                                                                                                                                                                                      '
		+'	<td align="left">                                                                                                                                                                          '
		+'	    <span>证件类型:</span>                                                                                                                                                                 '
		+'		<input id="id_type_'+i+'" class="easyui-combobox input" name="id_type_'+i+'"  style="width:230px;height:28px" readonly ></input>                                                               '
		+'	</td>                                                                                                                                                                                      '
		+'                                                                                                                                                                                             '
		+'	</tr>                                                                                                                                                                                      '
		+'	<tr width="100%"  align="center">                                                                                                                                                          '
		+'		<td align="center">                                                                                                                                                                    '
		+'	    	<span>证件号:</span>                                                                                                                                                               '
		+'	   	 	<input id="id_number_'+i+'" class="easyui-validatebox" name="id_number_'+i+'" readonly style="width:230px;height:23px"  data-options="disabled:false"></input>                             '
		+'		</td>                                                                                                                                                                                  '
		+'		<td>                                                                                                                                                                                   '
		+'	   	 	<span>移动电话:</span>                                                                                                                                                             '
		+'			<input id="mobile_phone_'+i+'" class="easyui-validatebox" name="mobile_phone_'+i+'" readonly style="width:230px;height:23px;"  data-options="required:true,validType:\'vname\'"/>            '
		+'		</td>                                                                                                                                                                                  '
		+'		<td align="left">                                                                                                                                                                      '
		+'		    <span>家庭电话:</span>                                                                                                                                                             '
		+'			<input id="land_phone_'+i+'" class="easyui-validatebox" name="land_phone_'+i+'" readonly style="width:230px;height:23px;"  data-options="required:true,validType:\'vname\'"/>                '
		+'		</td>                                                                                                                                                                                  '
		+'	</tr>                                                                                                                                                                                      '
		+'	<tr width="100%"  align="center">                                                                                                                                                          '
		+'	<td>                                                                                                                                                                                       '
		+'	    <span>职业性质:</span>                                                                                                                                                                 '
		+'		<input id="occup_type_'+i+'" class="easyui-combobox input" name="occup_type_'+i+'" readonly  style="width:230px;height:28px;"  data-options="required:true,validType:\'vname\'"/>                '
		+'	</td>                                                                                                                                                                                      '
		+'	<td>                                                                                                                                                                                       '
		+'	    <span>收入金额:</span>                                                                                                                                                                 '
		+'		<input id="amount_value_'+i+'" class="easyui-validatebox" name="amount_value_'+i+'" readonly style="width:230px;height:23px;"  data-options="required:true,validType:\'vname\'"/>                '
		+'	</td>                                                                                                                                                                                      '
		+'	<td align="left">                                                                                                                                                                          '
		+'	    <span>收入来源:</span>                                                                                                                                                                 '
		+'		<input id="income_source_'+i+'" class="easyui-combobox input" name="income_source_'+i+'" readonly style="width:230px;height:28px;" />                                                          '
		+'	</td>                                                                                                                                                                                      '
		+'	</tr>                                                                                                                                                                                      '
		+'	<tr width="100%"  align="center">                                                                                                                                                          '
		+'	                                                                                                                                                                                           '
		+'	<td align="center">                                                                                                                                                                        '
		+'	    <span>是否真实单位:</span>                                                                                                                                                             '
		+'	    <input id="is_true_'+i+'" class="easyui-combobox input" name="is_true_'+i+'" readonly style="width:230px;height:28px;"  data-options="required:true,validType:\'vname\'"/>                       '
		+'	</td>                                                                                                                                                                                      '
		+'	<td>                                                                                                                                                                                       '
		+'	    <span>流水有无:</span>                                                                                                                                                                 '
		+'		<select id="is_stream_'+i+'" name="is_stream_'+i+'" class="easyui-validatebox" readonly style="width:230px;height:28px;" >                                                                     '
		+'	    	<option value="1">有</option>                                                                                                                                                      '
		+'	    	<option value="0">无</option>                                                                                                                                                      '
		+'	    </select>                                                                                                                                                                              '
		+'	</td>                                                                                                                                                                                      '
		+'	<td align="left">                                                                                                                                                                          '
		+'	    <span>流水是否真实:</span>                                                                                                                                                             '
		+'	    <select id="is_true_stream_'+i+'" name="is_true_stream_'+i+'" class="easyui-validatebox" readonly style="width:230px;height:28px;" >                                                           '
		+'	    	<option value="1">是</option>                                                                                                                                                      '
		+'	    	<option value="0">否</option>                                                                                                                                                      '
		+'	    </select>                                                                                                                                                                              '
		+'	</td>                                                                                                                                                                                      '
		+'	</tr>                                                                                                                                                                                      '
		+'	<tr width="100%"  align="center">                                                                                                                                                          '
		+'	                                                                                                                                                                                           '
		+'	<td>                                                                                                                                                                                       '
		+'	    <span>补充流水:</span>                                                                                                                                                                 '
		+'		<input id="stream_value_'+i+'" class="easyui-validatebox" name="stream_value_'+i+'"  style="width:230px;height:23px;"  data-options="required:true,validType:\'vname\'"/>                        '
		+'	</td>                                                                                                                                                                                      '
		+'	<td>                                                                                                                                                                                       '
		+'	    <span>单位性质:</span>                                                                                                                                                                 '
		+'		<input id="co_type_'+i+'" class="easyui-combobox input" name="co_type_'+i+'" readonly style="width:230px;height:28px;"  data-options="required:true,validType:\'vname\'"/>                       '
		+'	</td>                                                                                                                                                                                      '
		+'	<td align="left">                                                                                                                                                                          '
		+'	    <span>工作单位:</span>                                                                                                                                                                 '
		+'		<input id="co_name_'+i+'" class="easyui-validatebox" name="co_name_'+i+'" readonly style="width:280px;height:23px;"  data-options="required:true,validType:\'vname\'"/>                          '
		+'	</td>                                                                                                                                                                                      '
		+'	</tr>                                                                                                                                                                                      '
		+'	                                                                                                                                                                                           '
		+'	<!-- <tr width="100%"  align="center">                                                                                                                                                     '
		+'	                                                                                                                                                                                           '
		+'	</tr> -->                                                                                                                                                                                  '
		+'	<tr width="100%"  align="center">                                                                                                                                                          '
		+'	<td>                                                                                                                                                                                       '
		+'	    <span>单位电话:</span>                                                                                                                                                                 '
		+'		<input id="co_phone_'+i+'" class="easyui-validatebox" name="co_phone_'+i+'" readonly style="width:230px;height:23px;"  data-options="required:true,validType:\'vname\'"/>                        '
		+'	</td>                                                                                                                                                                                      '
		+'	<td align="left" colspan="2">                                                                                                                                                              '
		+'		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                                                                                             '
		+'	    <span>单位地址:</span>                                                                                                                                                                 '
		+'		<input id="co_address_'+i+'" class="easyui-validatebox" name="co_address_'+i+'" readonly style="width:280px;height:23px;"  data-options="required:true,validType:\'vname\'"/>                    '
		+'	</td>                                                                                                                                                                                      '
		+'	</tr>                                                                                                                                                                                      '
		+'	</table>                                                                                                                                                                                   '
		+'	<div align="center" id="divCust_'+i+'">                                                                                                                                                                       '
		+'	<td ><a href="javascript:void(0)" id="btnCount_'+i+'" name="btnCount_'+i+'" target="_Blank" class="easyui-linkbutton"  data-options="iconCls:\'icon-edit\'"   data-options="plain:false" >选择共还人信息</a>                               '
		+'	</div>                                                                                                                                                                                     '
		+'	<div style="height:20px;">                                                                                                                                                                 '
		+'	                                                                                                                                                                                           '
		+'	</div> '
		
		return tables;
		
	}
	
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
	<form action="/FirstHandHousing/doSaveFirstHandHousing.do" id="formId">
	
	<input id="cust_i" type="hidden" name="cust_i"  value="${cust_i}"/>
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
				<input id="case_id" class="easyui-validatebox" value="${case_id}"  name="case_id" style="width:280px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
			</td>
			<td >
				 <span>案子名称:</span>
				<input id="case_name" class="easyui-validatebox" value="${case_name}" name="case_name" style="width:360px;height:23px;"  data-options="required:true,validType:'vname'"/>
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
			<input id="loan_fee" class="easyui-validatebox" name="loan_fee" value="${loan_fee}"  style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span class="label">贷款年限:</span>
			<input id="loan_year" class="easyui-combobox input" name="loan_year" value="${loan_year}"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span class="label">还款方式:</span>
		    <input id="repay_type" class="easyui-combobox input" name="repay_type" value="${repay_type}" style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>贷款类型:</span>
			 <input id="loan_type" class="easyui-combobox input" name="loan_type"  value="${loan_type}"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span class="label">贷款银行:</span>
			 <input id="loan_branch"  readOnly   class="easyui-combobox input" name="loan_branch" value="${loan_branch}" style="width:280px;height:28px"  data-options="disabled:false"></input>
			 
		</td>
		<td>
		    <span>审批支行:</span>
			 <input id="loan_subbranch" readOnly class="easyui-combobox input" name="loan_subbranch" value="${loan_subbranch}" style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>网签价格:</span>
			<input id="contract_price" class="easyui-validatebox" name="contract_price" value="${contract_price}" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>审批单价:</span>
			<input id="exam_unit_price" class="easyui-validatebox" name="exam_unit_price" value="${exam_unit_price}" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>贷款比例:</span>
			<input id="loan_scale" class="easyui-validatebox" name="loan_scale"  value="${loan_scale}" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>还款账号:</span>
			<input id="repay_account" class="easyui-validatebox" value="${repay_account}"   name="repay_account" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>客户经理:</span>
			<input id="customer_manager" class="easyui-validatebox" value="${customer_manager}"  name="customer_manager" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>虚高比例:</span>
			<input id="high_scale" class="easyui-validatebox" name="high_scale" value="${high_scale}"  style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		</table>
	</div>
	
	<div title="<i></i>房屋信息" style="padding-bottom:6px;height:200px" class="easyui-panel" data-options="collapsible:false">
		<table  width="105%" height="center"  bgcolor="#FFFFFF">
		<tr width="100%"  align="center" >
		<td>
		    <span>交易方式:</span>
			<input id="pretrade_bus_type" class="easyui-combobox input" name="pretrade_bus_type"  value="${pretrade_bus_type}"  style="width:280px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" style="withd:380px;">
		    <span>房屋地址:</span>
			<input id="pretrade_house1" class="easyui-combobox select" name="pretrade_house1"   value="${pretrade_house1}" style="width:90px;height:28px"  data-options="disabled:false"></input>
			<input id="pretrade_house2" class="easyui-combobox select" name="pretrade_house2"  value="${pretrade_house2}"  style="width:90px;height:28px"  data-options="disabled:false"></input>
			<input id="pretrade_house3" class="easyui-combobox select" name="pretrade_house3"  value="${pretrade_house3}" style="width:95px;height:28px"  data-options="disabled:false"></input>
			<input id="pretrade_house4" class="easyui-combobox select" name="pretrade_house4"  value="${pretrade_house4}" style="width:100px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td align="left" style="withd:280px;">
		    <span>详细地址:</span>
		    <input id="pretrade_house_detail" class="easyui-validatebox" name="pretrade_house_detail" value="${pretrade_house_detail}"  style="width:260px;height:23px"  data-options="required:true,validType:'vname'"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>契约证号:</span>
			<input id="newhouse_qyz" class="easyui-validatebox" name="newhouse_qyz" style="width:280px;height:23px;" value="${newhouse_qyz}"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" style="withd:380px;">
		    <span>不动产号:</span>
			<input id="afttrade_bdc_id" class="easyui-validatebox" name="afttrade_bdc_id"  value="${afttrade_bdc_id}" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" style="withd:280px;">
		    <span>房产面积:</span>
			<input id="pretrade_area" class="easyui-validatebox" value="${pretrade_area}"  name="pretrade_area" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>建筑楼层:</span>
			<input id="pretrade_floor" class="easyui-validatebox" value="${pretrade_floor}"  name="pretrade_floor" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" style="withd:380px;">
		    <span>建筑年代:</span>
			<input id="pretrade_age" class="easyui-validatebox"  value="${pretrade_age}" name="pretrade_age" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" style="withd:280px;">
		    <span>土地年限:</span>
			<input id="newhouse_tdnx" class="easyui-validatebox"  value="${newhouse_tdnx}"  name="newhouse_tdnx" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>成交价格:</span>
			<input id="pretrade_price" class="easyui-validatebox" value="${pretrade_price}"  name="pretrade_price" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" style="withd:380px;">
		    <span>成交单价:</span>
			<input id="pretrade_unit_price" class="easyui-validatebox" value="${pretrade_unit_price}"  name="pretrade_unit_price" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		  
		</td>
		</tr>
		
		</table>
	</div>
	
	
	<div title="<i></i>楼盘及开发商信息" style="padding-bottom:6px;height:250px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td align="center" >
		    <span>楼盘名称:</span>
			<input id="newhouse_lpmc" class="easyui-validatebox" value="${loan_amount}" name="loan_amount" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>楼盘地址:</span>
			<input id="newhouse_addrest" class="easyui-validatebox"  value="${newhouse_addrest}" name="newhouse_addrest"  style="width:805px;height:23px"  data-options="required:true,validType:'vname'"></input>
		</td>
		<!--  <td align="left">
		    <span>贷款方式:</span>
		    <input id="loan_method" class="easyui-validatebox" name="loan_method"  style="width:260px;height:28px"  data-options="required:true,validType:'vname'"></input>
		</td>  -->
		</tr>
		<tr width="100%"  align="center">
		<td align="center">
		    <span>楼盘电话:</span>
			<input id="newhouse_phone" class="easyui-validatebox"  value="${newhouse_phone}" name="newhouse_phone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
		<td align="left" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>楼盘开发商地址:</span>
			<input id="newhouse_dever_ads" class="easyui-validatebox"  value="${newhouse_dever_ads}" name="newhouse_dever_ads" style="width:770px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		
		</tr>
		
		<tr width="100%"  align="center">
		<td align="center">
		    <span>楼盘开发商电话:</span>
			<input id="newhouse_dever_ph" class="easyui-validatebox"  value="${newhouse_dever_ph}" name="newhouse_dever_ph" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>财务负责人:</span>
			<input id="newhouse_fin" class="easyui-validatebox" value="${newhouse_fin}" name="newhouse_fin" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>财务负责人电话:</span>
			<input id="newhouse_fin_ph" class="easyui-validatebox" value="${newhouse_fin_ph}"  name="newhouse_fin_ph" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td align="center">
		    <span>下款账户:</span>
			<input id="newhouse_dever_act" value="${newhouse_dever_act}"  class="easyui-validatebox" name="newhouse_dever_act" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>开户行:</span>
			<input id="newhouse_dever_khg" class="easyui-validatebox" value="${newhouse_dever_khg}" name="newhouse_dever_khg" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
	</div>
	
	 
	<div title="<i></i>楼盘销售人员" style="padding-bottom:6px;height:150px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td>
		    <span>销售员:</span>
			<input id="newhouse_seller" class="easyui-validatebox" value="${newhouse_seller}"  name="newhouse_seller" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>销售员手机:</span>
			<input id="newhouse_sel_ph" class="easyui-combobox input" value="${newhouse_sel_ph}" name="newhouse_sel_ph"  style="width:280px;height:28px"  data-options="disabled:false"></input>
		</td>
		<td>
		    <span>销售员办公电话:</span>
		    <input id="newhouse_sel_ph2" class="easyui-combobox input" value="${newhouse_sel_ph2}" name="newhouse_sel_ph2"  style="width:260px;height:28px"  data-options="disabled:false"></input>
		</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>销售员账户名:</span>
			<input id="newhouse_sel_actn" class="easyui-validatebox" value="${newhouse_sel_actn}" name="newhouse_sel_actn" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>销售员开户行:</span>
			<input id="newhouse_sel_khh" class="easyui-validatebox" value="${newhouse_sel_khh}" name="newhouse_sel_khh" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>

		
		</table>
	</div>
	
	
	
	<div title="<i></i>主贷人信息" style="padding-bottom:6px;height:300px" class="easyui-panel" data-options="collapsible:false">
		
		
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td align="center">
		    <span>主贷人id:</span>
			<input id="cust_id" class="easyui-validatebox" value="${cust_id}" name="cust_id" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td  >
		    <span>主贷人姓名:</span>
			<input id="cust_name" class="easyui-validatebox" value="${cust_name}" name="cust_name" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>证件类型:</span>
			<input id="id_type" class="easyui-combobox input" value="${id_type}" name="id_type"  style="width:230px;height:28px" readonly ></input>
		</td>
	
		</tr>
		<tr width="100%"  align="center">
			<td align="center">
		    	<span>证件号:</span>
		   	 	<input id="id_number" class="easyui-validatebox" value="${id_number}" name="id_number" readonly style="width:230px;height:23px"  data-options="disabled:false"></input>
			</td>
			<td>
		   	 	<span>移动电话:</span>
				<input id="mobile_phone" class="easyui-validatebox"  value="${mobile_phone}" name="mobile_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
			<td align="left">
			    <span>家庭电话:</span>
				<input id="land_phone" class="easyui-validatebox" value="${land_phone}"  name="land_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>职业性质:</span>
			<input id="occup_type" class="easyui-combobox input" value="${occup_type}" name="occup_type" readonly  style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>收入金额:</span>
			<input id="amount_value" class="easyui-validatebox" value="${amount_value}" name="amount_value" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>收入来源:</span>
			<input id="income_source" class="easyui-combobox input" value="${income_source}" name="income_source" readonly style="width:230px;height:28px;" />
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td align="center">
		    <span>是否真实单位:</span>
		    <input id="is_true" class="easyui-combobox input" value="${is_true}" name="is_true" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>流水有无:</span>
			<select id="is_stream" name="is_stream" value="${is_stream}" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">有</option>
		    	<option value="0">无</option>
		    </select>
		</td>
		<td align="left">
		    <span>流水是否真实:</span>
		    <select id="is_true_stream" name="is_true_stream" value="${is_true_stream}"  class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">是</option>
		    	<option value="0">否</option>
		    </select>
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td>
		    <span>补充流水:</span>
			<input id="stream_value" class="easyui-validatebox" value="${stream_value}" name="stream_value"  style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>单位性质:</span>
			<input id="co_type" class="easyui-combobox input" value="${co_type}"   name="co_type" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>工作单位:</span>
			<input id="co_name" class="easyui-validatebox" value="${co_name}"  name="co_name" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<!-- <tr width="100%"  align="center">
		
		</tr> -->
		<tr width="100%"  align="center">
		<td>
		    <span>单位电话:</span>
			<input id="co_phone" class="easyui-validatebox" value="${co_phone}"  name="co_phone" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" colspan="2">
		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>单位地址:</span>
			<input id="co_address" class="easyui-validatebox" value="${co_address}" name="co_address" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
		<div align="center">
		<td ><a href="javascript:void(0)" id="btnCount" name="btnCount" target="_Blank" class="easyui-linkbutton" data-options="plain:false" >选择主贷人信息</a>
		</div>
		<div style="height:20px;">
		
		</div>
	</div>
	
	
	
	<div title="<i></i>共还人信息" id="shareCust"  style="padding-bottom:6px;height:100px" class="easyui-panel" data-options="collapsible:false">
		<div align="right"  id="custAdd">
		<td ><a href="javascript:void(0)" id="addCust" name="addCust" target="_Blank" class="easyui-linkbutton" data-options="plain:false" >新增共还人信息</a>
		<td ><a href="javascript:void(0)" id="delCust" name="delCust" target="_Blank" class="easyui-linkbutton" data-options="plain:false" >删除共同还款人</a>
		</div>
		<div style="height:20px;">
		</div>
		<!-- 
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td align="center">
		    <span>共还人id:</span>
			<input id="cust_id_1" class="easyui-validatebox"  name="cust_id_1" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td  >
		    <span>主贷人姓名:</span>
			<input id="cust_name_1" class="easyui-validatebox" name="cust_name_1" style="width:230px;height:23px;" readonly data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>证件类型:</span>
			<input id="id_type_1" class="easyui-combobox input" name="id_type_1"  style="width:230px;height:28px" readonly ></input>
		</td>
	
		</tr>
		<tr width="100%"  align="center">
			<td align="center">
		    	<span>证件号:</span>
		   	 	<input id="id_number_1" class="easyui-validatebox" name="id_number_1" readonly style="width:230px;height:23px"  data-options="disabled:false"></input>
			</td>
			<td>
		   	 	<span>移动电话:</span>
				<input id="mobile_phone_1" class="easyui-validatebox" name="mobile_phone_1" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
			<td align="left">
			    <span>家庭电话:</span>
				<input id="land_phone_1" class="easyui-validatebox" name="land_phone_1" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
			</td>
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>职业性质:</span>
			<input id="occup_type_1" class="easyui-combobox input" name="occup_type_1" readonly  style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>收入金额:</span>
			<input id="amount_value_1" class="easyui-validatebox" name="amount_value_1" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>收入来源:</span>
			<input id="income_source_1" class="easyui-combobox input" name="income_source_1" readonly style="width:230px;height:28px;" />
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td align="center">
		    <span>是否真实单位:</span>
		    <input id="is_true_1" class="easyui-combobox input" name="is_true_1" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>流水有无:</span>
			<select id="is_stream_1" name="is_stream_1" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">有</option>
		    	<option value="0">无</option>
		    </select>
		</td>
		<td align="left">
		    <span>流水是否真实:</span>
		    <select id="is_true_stream_1" name="is_true_stream_1" class="easyui-validatebox" readonly style="width:230px;height:28px;" >
		    	<option value="1">是</option>
		    	<option value="0">否</option>
		    </select>
		</td>
		</tr>
		<tr width="100%"  align="center">
		
		<td>
		    <span>补充流水:</span>
			<input id="stream_value_1" class="easyui-validatebox" name="stream_value_1"  style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>单位性质:</span>
			<input id="co_type_1" class="easyui-combobox input" name="co_type_1" readonly style="width:230px;height:28px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left">
		    <span>工作单位:</span>
			<input id="co_name_1" class="easyui-validatebox" name="co_name_1" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		
		</tr>
		<tr width="100%"  align="center">
		<td>
		    <span>单位电话:</span>
			<input id="co_phone_1" class="easyui-validatebox" name="co_phone_1" readonly style="width:230px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td align="left" colspan="2">
			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		    <span>单位地址:</span>
			<input id="co_address_1" class="easyui-validatebox" name="co_address_1" readonly style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
		<div align="center">
		<td ><a href="javascript:void(0)" id="btnCount_1" name="btnCount_1" target="_Blank" class="easyui-linkbutton" data-options="plain:false" >选择共还人信息</a>
		</div>
		<div style="height:20px;">
		
		</div> -->
	</div>
	
	 <div title="<i></i>中介人信息" style="padding-bottom:6px;height:300px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" bgcolor="#FFFFFF">
		<tr width="100%"  align="center">
		<td>
		    <span>中介编码:</span>
			<input id="agency_id" class="easyui-validatebox" value="${agency_id}" name="agency_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>中介全称:</span>
			<input id="agency_name" class="easyui-combobox input" value="${agency_name}" name="agency_name"  style="width:280px;height:28px"  data-options="disabled:false"></input>
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
			<input id="boss_mphone" class="easyui-validatebox" value="${boss_mphone}" name="boss_mphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>中介老板办公电话:</span>
			<input id="boss_lphone" class="easyui-validatebox"  value="${boss_lphone}" name="boss_lphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
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
			<input id="bm_name" class="easyui-validatebox" value="${bm_name}" name="bm_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>业务接洽人手机:</span>
			<input id="bm_mphone" class="easyui-validatebox" value="${bm_mphone}" name="bm_mphone" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>业务接洽人办公电话:</span>
			<input id="bm_lphone" class="easyui-validatebox"  value="${bm_lphone}"  name="bm_lphone" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		
		<tr width="100%"  align="center">
		<td>
		    <span>返款结算户名:</span>
			<input id="account_name" class="easyui-validatebox" value="${account_name}" name="account_name" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>结算卡开户行:</span>
			<input id="khh_name" class="easyui-validatebox" value="${khh_name}"  name="khh_name" style="width:260px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		<td>
		    <span>账号:</span>
			<input id="account_id" class="easyui-validatebox" value="${account_id}" name="account_id" style="width:280px;height:23px;"  data-options="required:true,validType:'vname'"/>
		</td>
		</tr>
		</table>
	</div>
	
	 
	<div title="<i></i>费用结项" style="padding-bottom:6px;height:400px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" id="dg" border="1px">
		<!-- <thead>
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
		</tr> -->
		
		</table>
	</div>
	
	<div title="<i></i>所缺材料" style="padding-bottom:6px;height:400px" class="easyui-panel" data-options="collapsible:false">
		<table  width="100%" height="center" border="1" id="grid_2">
		
		
		</table>
	</div>
	</form>
		<div id="win" class="easyui-window" data-options="modal:true,closed:true,resizable:true,left:'250px',top:'100px'"></div>
		<div id="centerPanel" data-options="region:'center',border:true,title:''" >
			<div id="tt" class="easyui-tabs" data-options="tabPosition:'top',fit:true,border:false,plain:true">
		</div>
	</div>
	<div id="win2" class="easyui-window" data-options="modal:true,closed:true,resizable:true,left:'250px',top:'100px'"></div>
</body>

</html>
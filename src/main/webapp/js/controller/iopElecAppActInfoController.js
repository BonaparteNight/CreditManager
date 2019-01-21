 //控制层 
app.controller('iopElecAppActInfoController' ,function($scope,$controller,iopElecAppActInfoService){	
	
	$controller('baseController',{$scope:$scope});//继承
	
    //读取列表数据绑定到表单中  
	$scope.findAll=function(){
		iopElecAppActInfoService.findAll().success(
			function(response){
				$scope.list=response;
			}			
		);
	}    
	
	//分页
	$scope.findPage=function(page,rows){			
		iopElecAppActInfoService.findPage(page,rows).success(
			function(response){
				$scope.list=response.rows;	
				$scope.paginationConf.totalItems=response.total;//更新总记录数
			}			
		);
	}
	
	//查询实体 
	$scope.findOne=function(id){				
		iopElecAppActInfoService.findOne(id).success(
			function(response){
				$scope.entity= response;
				$scope.entity.mgicIopElecAppActInfo.activitystatus = JSON.parse($scope.entity.mgicIopElecAppActInfo.activitystatus);
				$scope.entity.mgicIopElecAppActInfo.activitytype = JSON.parse($scope.entity.mgicIopElecAppActInfo.activitytype);
				$scope.entity.mgicIopElecAppActInfo.activityobjective = JSON.parse($scope.entity.mgicIopElecAppActInfo.activityobjective);
			}
		);				
	}
	
	//保存 
	$scope.save=function(){				
		var serviceObject;//服务层对象
		if($scope.entity.mgicIopElecAppActInfo.activitytype == null){
			alert("保存失败，请填写营销活动类型。");
			return;
		}
		if($scope.entity.mgicIopElecAppActInfo.activityobjective == null){
			alert("保存失败，请填写营销活动目的。");
			return;
		}
		if($scope.entity.mgicIopElecAppActInfo.activityid!=null){//如果有ID
			serviceObject=iopElecAppActInfoService.update( $scope.entity ); //修改  
		}else{
			serviceObject=iopElecAppActInfoService.add( $scope.entity  );//增加 
		}				
		serviceObject.success(
			function(response){
				if(response.success){
					window.location.reload();
					//重新查询 
		        	$scope.reloadList();//重新加载
				}else{
					alert(response.message);
				}
			}		
		);				
	}
	
	 
	//批量删除 
	$scope.dele=function(){			
		//获取选中的复选框			
		iopElecAppActInfoService.dele( $scope.selectIds ).success(
			function(response){
				if(response.success){
					$scope.reloadList();//刷新列表
					$scope.selectIds=[];
				}						
			}		
		);				
	}
	
	$scope.searchEntity={};//定义搜索对象 
	
	//搜索
	$scope.search=function(page,rows){			
		iopElecAppActInfoService.search(page,rows,$scope.searchEntity).success(
			function(response){
				$scope.list=response.rows;	
				$scope.paginationConf.totalItems=response.total;//更新总记录数
			}			
		);
	}
	
	$scope.addTableRow = function(){
		$scope.entity.mgicIopElecAppCamInfoList.push({});
	}
    
	$scope.deleteTableRow = function(index){
		$scope.entity.mgicIopElecAppCamInfoList.splice(index,1);
	}
	
	$scope.actTypeList={data:[]}
	//活动类型字典
	$scope.findActiveTypeList = function(id){
		iopElecAppActInfoService.selectOptionList(id).success(function(response){
			$scope.actTypeList = {data:response};
		});
	}
	
	$scope.actPurList={data:[]}
	//活动目的字典
	$scope.findActivePurList = function(id){
		iopElecAppActInfoService.selectOptionList(id).success(function(response){
			$scope.actPurList = {data:response};
		});
	}
	
    
  //初始化日期插件 -- 选择到天
    $('#activitystarttime').datetimepicker({
     format: 'yyyy/mm/dd hh:ii:ss',//显示格式
     todayHighlight: 1,//今天高亮
     minView: "hour",//设置只显示到月份
     startView:2,
     forceParse: 0,
     showMeridian: 1,
     autoclose: true,//选择后自动关闭
     language: 'zh-CN',
     weekStart: 1,
     // todayBtn: 1,
     // autoclose: 1,
     // todayHighlight: 1,
     // startView: 2,
     // minView: 2,
     // forceParse: 0,
     // pickerPosition:'bottom-right'//日期插件弹出的位置
    }).on("changeDate", function () {
	     $('#activityendtime').datetimepicker('setStartDate', $("#activitystarttime").val());
	     $("#activityendtime").focus();
    });
     
    $('#activityendtime').datetimepicker({
     format: 'yyyy/mm/dd hh:ii:ss',//显示格式
     todayHighlight: 1,//今天高亮
     minView: "hour",//设置只显示到月份
     startView:2,
     forceParse: 0,
     showMeridian: 1,
     autoclose: true,//选择后自动关闭
     language: 'zh-CN',
     weekStart: 1,
    }).on("changeDate", function () {
    	$('#activitystarttime').datetimepicker('setEndDate', $("#activityendtime").val());
    });
	
});	

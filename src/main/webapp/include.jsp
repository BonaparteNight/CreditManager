<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ page language="java" pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/bootstrap/easyui.css" />
<link rel="stylesheet" type="text/css" href="/js/easyui/themes/cupertino/tooltip.css" />
<link rel="stylesheet" type="text/css" href="/css/style.css" />
<link rel="stylesheet" type="text/css" href="/css/newstyle.css" />
<link rel="stylesheet" type="text/css" href="/bootstrap/assets/css/icons.css" />
<script type="text/javascript" src="/js/easyui/jquery-1.8.0.min.js"></script>
<script type="text/javascript" src="/js/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="/js/easyui/datagrid-detailview.js"></script>
<script type="text/javascript" src="/js/easyui/locale/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="/js/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript" src="/js/easyui/plugins/jquery.tooltip.js"></script>
<script type="text/javascript" src="/js/map.js"></script>
<script type="text/javascript" src="/js/common.js"></script>
<script type="text/javascript" src="/js/slide.js"></script>
<script type="text/javascript" >
$.extend($.fn.validatebox.defaults.rules, {
    vname: {
        validator: function(value, param) {
            if (value.indexOf("<") ==-1
            		&& value.indexOf(">") ==-1 && value.indexOf("|") ==-1
            		&& value.indexOf("&") ==-1 && value.indexOf("$") ==-1) {
		        return true;
		    } else {
		        return false;
		    }
        },
        message: '不能包含有 < > | & $ 等特殊字符!' 
    }
});
</script>

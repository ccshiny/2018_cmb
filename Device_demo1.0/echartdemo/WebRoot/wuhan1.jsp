<!DOCTYPE html>
<html lang="en">
<head>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
 <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <link href="css/bootstrap-table.css" rel="stylesheet">
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=KSOP9zkg1u2QCl4KYAEG4FWfYDmAaCUb"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/library/Heatmap/2.0/src/Heatmap_min.js"></script>
<script type="text/javascript" src="jquery-1.8.3.min.js"></script>
   <script src="bootstrap.js"></script>
       <script src="bootstrap-table.js"></script>
<script src="bootstrap-table-zh-CN.js"></script>
<title>热力图功能示例</title>
<style type="text/css">


html, body {
            
            margin: 0px;
            font-size: 15px;
            padding: 0px;
            background: #34363A;
            color: #fff;
      
          
        }
        #container {
            height: 580px;
            width:950px;
            margin:-20px
        }
        .colorchange{
        background-color:#34363a;
        }

#r-result {
	width: 100%;
}
</style>
</head>
<body>
 <nav class="navbar navbar-inverse colorchange" role="navigation">
  <div class="container-fluid">
  <a class="navbar-brand" href="index1.jsp">首页</a>
  <ul class="nav navbar-nav">
    <li class="active"><a href="">城市热力图</a></li>
    <li><a href="index1.jsp">设备分析</a></li>
  </ul>
  </div>
</nav> 
	<div id="container"></div>

<div id="right" style="position:absolute; width:350px; height:30%;right: 40px;top:100px;">
<ul class="nav nav-tabs " >
  <li><a href="#p1" data-toggle="tab">总交易量</a></li>
  <li ><a href="#p2" data-toggle="tab">设备数量</a></li>
  <li><a href="#p3" data-toggle="tab">平均交易量</a></li>
</ul>
<div class="tab-content"  style="margin:20px">
  <div class="fade tab-pane" id="p1">
<div class="pre-scrollable" >
	<table class="table  table-hover"  data-toggle="table"  id="WorkTable1"   >
      <thead>
                <tr>
                       <th data-field="bank"  data-align="right">银行</th> 
                   <th data-field="num"  data-align="right"   data-sortable="true">交易量</th> 
                </tr>
            </thead>
	</table>
</div>
	<script type="text/javascript">
   
	function Request(str){
    var href=this.location;
    var strHref = decodeURI(href);
    var intPos = strHref.indexOf("?");
    var strRight = strHref.substr(intPos + 1);
    var arrTmp = strRight.split("&");
    for (var i=0;i<arrTmp.length;i++)
    {
     var arrTemp=arrTmp[i].split("=");
     if(arrTemp[0].toUpperCase() == str.toUpperCase()) return arrTemp[1];
    }
}
str=Request("time");


  $(function(){
        $.ajax({
            type: "post",
            url: "bankHeatmap",  
    		data : {
							name1 : str,
							area : "武汉"
						},
    
            dataType: "json",
            success: function (msg) {
            $("#WorkTable1").bootstrapTable('load', msg);
            },
            error: function () {
                alert("错误");
            }
        });
    });
     


</script>					
  </div>
  <div class="fade in tab-pane active" id="p2">
 
<div class="pre-scrollable" >
	<table class="table  table-hover"  data-toggle="table"  id="WorkTable2"   >
      <thead>
                <tr>
                       <th data-field="bank" data-align="right">银行</th> 
                   <th data-field="devicenum" data-align="right"  data-sortable="true">设备数量</th> 
                </tr>
            </thead>
	</table>
</div>
	<script type="text/javascript">
 	function Request(str){
    var href=this.location;
    var strHref = decodeURI(href);
    var intPos = strHref.indexOf("?");
    var strRight = strHref.substr(intPos + 1);
    var arrTmp = strRight.split("&");
    for (var i=0;i<arrTmp.length;i++)
    {
     var arrTemp=arrTmp[i].split("=");
     if(arrTemp[0].toUpperCase() == str.toUpperCase()) return arrTemp[1];
    }
}
str=Request("time");
    $(function(){
        $.ajax({
            type: "post",
            url: "bankHeatmap",  
            		data : {
							name1 : str,
							area : "武汉"
						},
            dataType: "json",
            success: function (msg) {
          $("#WorkTable2").bootstrapTable('load', msg);
            },
            error: function () {
                alert("错误");
            }
        });
    });
     
</script>					
</div>
<div class="fade tab-pane" id="p3">
<div class="pre-scrollable" >
	<table class="table  table-hover"  data-toggle="table"  id="WorkTable3"   >
      <thead>
                <tr>
                       <th data-field="bank" data-align="right">银行</th> 
                   <th data-field="mean" data-align="right"   data-sortable="true">平均交易量</th> 
                </tr>
            </thead>
	</table>
</div>
	<script type="text/javascript">
  	function Request(str){
    var href=this.location;
    var strHref = decodeURI(href);
    var intPos = strHref.indexOf("?");
    var strRight = strHref.substr(intPos + 1);
    var arrTmp = strRight.split("&");
    for (var i=0;i<arrTmp.length;i++)
    {
     var arrTemp=arrTmp[i].split("=");
     if(arrTemp[0].toUpperCase() == str.toUpperCase()) return arrTemp[1];
    }
}
str=Request("time");
    $(function(){
        $.ajax({
            type: "post",
            url: "bankHeatmap",  
    		data : {
							name1 : str,
							area : "武汉"
						},
    
            dataType: "json",
            success: function (msg) {
             $("#WorkTable3").bootstrapTable('load', msg);
            },
            error: function () {
                alert("错误");
            }
        });
    });
     


</script>					
  </div>
</div>
  </div>

</body>
</html>
<script type="text/javascript">
	   	var map = new BMap.Map("container"); // 创建地图实例
     var point = new BMap.Point(114.304862,30.587162);
		map.centerAndZoom(point, 13.5); // 初始化地图，设置中心点坐标和地图级别
		map.setCurrentCity("武汉"); //设置当前显示城市
       map.enableScrollWheelZoom(); // 允许滚轮缩放


//这里面添加经纬度
	   
	function Request(str){
    var href=this.location;
    var strHref = decodeURI(href);
    var intPos = strHref.indexOf("?");
    var strRight = strHref.substr(intPos + 1);
    var arrTmp = strRight.split("&");
    for (var i=0;i<arrTmp.length;i++)
    {
     var arrTemp=arrTmp[i].split("=");
     if(arrTemp[0].toUpperCase() == str.toUpperCase()) return arrTemp[1];
    }
}
/*获取时间*/
str_time=Request("time");

/*从数据库加载数据列表包含每个支行的经纬度，交易量等*/
 var points=[];
     $.ajax({
     type : "post",
     async : false, //同步执行
     url: "bankHeatmap",  
		data : {
							name1 : str,
							area : "武汉"
						},
     dataType : "json", //返回数据形式为json
     success : function(result) {
     if (result) {
            for(var i=0;i<result.length;i++){
               points.push(result[i]);
               
              }
     }
             return points; 
 },
 error : function(errorMsg) {
     alert("数据失败");
  
 }
})

                                
	
	alert(points);
	var opts = {
		width : 100, // 信息窗口宽度
		height : 80, // 信息窗口高度
		title : "点开有惊喜喔", // 信息窗口标题
		enableMessage : true
	//设置允许信息窗发送短息
	};

	for (var i = 0; i < points.length; i++) {

        var point1 = new BMap.Point(points[i].lng, points[i].lat);
		var marker = new BMap.Marker(point1); // 创建标注
		
		var content = "支行编号："+points[i].bankNbr +"\t"+ "<br>"+"支行名称："+points[i].bank +"\t"+ "<br>"+"交易总量："+ points[i].num; //创建标注信息框 
		map.addOverlay(marker); // 将标注添加到地图中
		marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画
		addClickHandler1(content, marker);
		addClickHandler(content, marker);
		

	};
	/* var marker = new BMap.Marker(point1);  // 创建标注
	 map.addOverlay(marker);               // 将标注添加到地图中
	 marker.setAnimation(BMAP_ANIMATION_BOUNCE); //跳动的动画 */

	function addClickHandler(content, marker) {
		marker.addEventListener("click", function(e) {
	        var p3=content;
	     
	        var str = p3.substring(p3.indexOf("支行编号：") + 5,p3.indexOf("\t"));
            //将str银行名称传到下一个展示详情的页面，也就是echart页面1
			location.href="echart.jsp?bankname=" + str + "&date=" + str_time;

           }
		);
	}

	function addClickHandler1(content, marker) {
		marker.addEventListener("mouseout", function(e) {
			openInfo(content, e)
		});
	}

	function openInfo(content, e) {
		var p = e.target;
		var point = new BMap.Point(p.getPosition().lng, p.getPosition().lat);
		var infoWindow = new BMap.InfoWindow(content, opts); // 创建信息窗口对象 
		map.openInfoWindow(infoWindow, point); //开启信息窗口
	}

	if(!isSupportCanvas()){
        alert('热力图目前只支持有canvas支持的浏览器,您所使用的浏览器不能使用热力图功能~')
    }
    //详细的参数,可以查看heatmap.js的文档 https://github.com/pa7/heatmap.js/blob/master/README.md
    //参数说明如下:
    /* visible 热力图是否显示,默认为true
     * opacity 热力的透明度,1-100
     * radius 势力图的每个点的半径大小
     * gradient  {JSON} 热力图的渐变区间 . gradient如下所示
     *  {
            .2:'rgb(0, 255, 255)',
            .5:'rgb(0, 110, 255)',
            .8:'rgb(100, 0, 255)'
        }
        其中 key 表示插值的位置, 0~1.
            value 为颜色值.
     */
    heatmapOverlay = new BMapLib.HeatmapOverlay({"radius":20,"visible":true});
    map.addOverlay(heatmapOverlay);
    heatmapOverlay.setDataSet({data:points,max:100});
	
    //closeHeatmap();
	
	
 
    //判断浏览区是否支持canvas
    function isSupportCanvas(){
        var elem = document.createElement('canvas');
        return !!(elem.getContext && elem.getContext('2d'));
    }
 
    function setGradient(){
        /*格式如下所示:
        {
            0:'rgb(102, 255, 0)',
            .5:'rgb(255, 170, 0)',
            1:'rgb(255, 0, 0)'
        }*/
        var gradient = {};
        var colors = document.querySelectorAll("input[type='color']");
        colors = [].slice.call(colors,0);
        colors.forEach(function(ele){
            gradient[ele.getAttribute("data-key")] = ele.value;
        });
        heatmapOverlay.setOptions({"gradient":gradient});
    }
 
    function openHeatmap(){
        heatmapOverlay.show();
    }
 
    function closeHeatmap(){
        heatmapOverlay.hide();
    }

</script>

</body>
</html>
<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
      <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
          <link href="css/bootstrap-table.css" rel="stylesheet">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script> 
   
   <!-- 本地化 --> 
  <%-- <script type="text/javascript" src="offlinemap/map_load.js"></script>
  <script type="text/javascript" src="offlinemap/tools/Heatmap_min.js"></script>
  <link rel="stylesheet" type="text/css" href="offlinemap/css/map.css"/>
  <script type="text/javascript" src="layer/layer.js"></script> 
   --%>
   
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KSOP9zkg1u2QCl4KYAEG4FWfYDmAaCUb"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
    <script type="text/javascript" src="http://lbsyun.baidu.com/custom/stylelist.js"></script>
    
       <script src="bootstrap.js"></script>
       <script src="bootstrap-table.js"></script>
<script src="bootstrap-table-zh-CN.js"></script>
    <script src="bootstrap.js"></script>
  
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


    </style>
</head>

<body>
 <nav class="navbar navbar-inverse colorchange" role="navigation">
  <div class="container-fluid">
 
  <ul class="nav navbar-nav">
    <li class="active"><a href="index1.jsp">首页</a></li>
  <li class="dropdown"><a href="" class="dropdown-toggle" data-toggle="dropdown">城市热力图 <b class="caret"></b></a>
				<ul class="dropdown-menu">
					<li><a  href="wuhan1.jsp">武汉</a></li>
					<li><a href="yichang.jsp">宜昌</a></li>
					<li><a href="xiangyang.jsp">襄阳</a></li>
				    <li><a href="huangshi.jsp">黄石</a></li>
				    <li><a href="xiaogan.jsp">孝感</a></li>
				    <li><a href="jinzhou.jsp">荆州</a></li>
				       <li><a href="shiyan.jsp">十堰</a></li>
				    <li><a href="huanggang.jsp">黄冈</a></li>
				 
				</ul>
			</li>

    <li><a href="predict.jsp">交易量预测</a></li>
  </ul>
  </div>
</nav> 

    <div id="container"></div>
<div id="right" style="position:absolute; width:330px;right: 35px;top:100px">

<select id="selectid" onchange="getValue()"  style="color:#303030;margin-bottom:15px">
     <option value="2018-01" >2018-01</option>
     <option value="2018-02">2018-02</option>
     <option value="2018-03">2018-03</option>
      <option value="2018-04">2018-04</option>
     <option value="2018-05"  selected>2018-05</option>
</select>

<ul class="nav nav-tabs " >
  <li><a href="#p1" data-toggle="tab">总交易量</a></li>
  <li ><a href="#p2" data-toggle="tab">设备数量</a></li>
  <li><a href="#p3" data-toggle="tab">平均交易量</a></li>
</ul>
<div class="tab-content"  style="margin:20px">

<div class="fade in tab-pane active" id="p1">

<div class="pre-scrollable" >
	<table class="table  table-hover"  data-toggle="table"  id="WorkTable1"   >
      <thead>
                <tr>
                       <th data-field="areaName" data-align="right">银行</th> 
                   <th data-field="tradeNum" data-align="right"   data-sortable="true">总交易量</th> 
                </tr>
            </thead>
	</table>
</div>
</div>
<div class=" tab-pane" id="p2">
<div class="pre-scrollable" >
	<table class="table  table-hover"  data-toggle="table"  id="WorkTable2"   >
      <thead>
                <tr>
                       <th data-field="areaName" data-align="right">银行</th> 
                   <th data-field="deviceNum" data-align="right"   data-sortable="true">设备数量</th> 
                </tr>
            </thead>
	</table>
</div>
</div>
<div class=" tab-pane" id="p3">
<div class="pre-scrollable" >
	<table class="table  table-hover"  data-toggle="table"  id="WorkTable3"   >
      <thead>
                <tr>
                       <th data-field="areaName" data-align="right">银行</th> 
                   <th data-field="deviceNum" data-align="right"   data-sortable="true">设备数量</th> 
                </tr>
            </thead>
	</table>
</div>
</div>
</div>
  </div>

<script type='text/javascript'>
//获取下拉选择框的表格的数据
$("select").change(function() {
        var str = $("#selectid option:selected").val();  
        $.ajax({
            type: "post",
            url: "indexBank",  
            data : {name1:str},
    
            dataType: "json",
            success: function (msg) {
             $("#WorkTable1").bootstrapTable('load', msg);
               $("#WorkTable2").bootstrapTable('load', msg);
             $("#WorkTable3").bootstrapTable('load', msg);
             
            },
            error: function () {
                alert("错误");
            }
      })
    }); 
//获取不选下拉框时候的默认数值时候的表格数据
     var str = $("#selectid option:selected").val();  
         $.ajax({
            type: "post",
            url: "indexBank",  
            data : {name1:str},
    
            dataType: "json",
            success: function (msg) {
             $("#WorkTable1").bootstrapTable('load', msg);
               $("#WorkTable2").bootstrapTable('load', msg);
             $("#WorkTable3").bootstrapTable('load', msg);
             
            },
            error: function () {
                alert("错误");
            }
      })
//需引用api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js
var map = new BMap.Map("container",{ minZoom : 5,maxZoom:8 }); // 创建地图实例
//设置个性化样式
map.setMapStyle({
      styleJson:  [{
            "featureType": "road",
            "elementType": "all",
            "stylers": {
                    "color": "#d64f44",
                    "visibility": "off"
                   }
            }]
});
 function getValue(){
        var str = $("#selectid option:selected").val();  
        return str;

    }

map.enableScrollWheelZoom();
map.enableDragging();


var blist = [];
var districtLoading = 0;

/*
=====获取行政区域边界=====
*/
function getBoundary() {   
    addDistrict("武汉");
    addDistrict("孝感");
    addDistrict("黄石");
    addDistrict("荆州");
    addDistrict("宜昌");
    addDistrict("襄阳");
    addDistrict("十堰");
    addDistrict("黄冈"); 
}
/*
=====添加行政区域=====
*/
function addDistrict(districtName) {
    //使用计数器来控制加载过程
    districtLoading++;
    var bdary = new BMap.Boundary();
    bdary.get(districtName, function (rs) {       //获取行政区域
    	map.clearOverlays();        //清除地图覆盖物  
        var count = rs.boundaries.length; //行政区域的点有多少个
       // alert(districtName+count);
        for (var i = 0; i < count; i++) {
            blist.push({ points: rs.boundaries[i], name: districtName });
        };
        //加载完成区域点后计数器-1
        districtLoading--;
        //drawBoundary();
         if (districtLoading == 0) {
            //全加载完成后画端点
            drawBoundary();
        } 
       // alert(districtName+"画完一个区域");
    });
}

/*
=====点击行政区域事件=====
*/
function click(evt) {   
 //alert(evt.target.name);
 //if(evt.target.name=="武汉")
 
   //window.location.href="wuhan1.jsp";
  /*  window.location.href="area.jsp?areaname="+str; */
   var i= evt.target.name;
str=getValue();
alert(str);

	switch (i) {
	case "武汉":
	 window.location.href="wuhan1.jsp?time="+str;
      
	    break;
	case "孝感":
	    window.location.href="xiaogan.jsp?time="+str;
	    break;
	case "宜昌":
	    window.location.href="yichang.jsp?time="+str;
		break;
	case "襄阳":
	    window.location.href="xiangyang.jsp?time="+str;
		break;
	case "荆州":
	    window.location.href="jinzhou.jsp?time="+str;
		break;
	case "十堰":
	   window.location.href="shiyan.jsp?time="+str;
		break;
	case "黄冈":
	   window.location.href="huanggang.jsp?time="+str;
		break;
	case "黄石":
	   window.location.href="huangshi.jsp?time="+str;
		break;
	}
 }
 


function drawBoundary() {
    //包含所有区域的点数组
    var pointArray = [];
   //var color=["#008B45","#4169E1","#CDBE70","#CDBE70","#FFFF00","#FFFF00","#CD5C5C","#CD5C5C","#8B4513","#8B4513","#FF1493","#FF1493","#551A8B","#551A8B"];
   var colorMap={"武汉":"#FF0000","宜昌":"FF7575","宜昌":"#FF7575","黄石":"#D94600","黄石":"#D94600","襄阳":"#F75000","襄阳":"#F75000","孝感":"#FF9224","荆州":"#F9F900","荆州":"#F9F900","十堰":"#FFFF93","十堰":"#FFFF93","黄冈":"#FFFFDF","黄冈":"#FFFFDF"};
	//孝感17339  //武汉：447133  //黄石：
	//循环添加各闭合区域
   
    for (var i = 0; i < blist.length; i++) {
        //添加多边形层并显示
        var ply = new BMap.Polygon(blist[i].points, { 
                                          strokeWeight: 1.5,   //边框宽度
                                          strokeColor: "#ff0000",
                                          //trokeColor: "#593959",   //边框颜色
                                          fillColor: colorMap[blist[i].name] //填充颜色
                                       }); //建立多边形覆盖物
        ply.name = blist[i].name;
        ply.addEventListener("click", click);
      
        map.addOverlay(ply);

        //将点增加到视野范围内
        var path = ply.getPath();
        pointArray = pointArray.concat(path);
    }
    

    //限定显示区域(只显示特定区域，鼠标拖动松开后自动回到显示范围内)，需要引用api库
  // var boundply = new BMap.Polygon(pointArray);
   //BMapLib.AreaRestriction.setBounds(map, boundply.getBounds());
    map.setViewport(pointArray);    //调整视野 
}

/* setTimeout(function () {
    getBoundary();
}) */getBoundary();

</script>
</body>
</html>
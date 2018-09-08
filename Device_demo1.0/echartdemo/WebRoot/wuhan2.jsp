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
                       <th data-field="bank" data-align="right">银行</th> 
                   <th data-field="num" data-align="right"   data-sortable="true">交易量</th> 
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
            data : {name1:str},
    
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
            data : {name1:str},
    
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
            data : {name1:str},
    
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

	var points = [ 
{"lng":"114.408135","lat":"30.5041008","支行名称":"创业街支行","count":"107.1494284","total":"11481","areaname":"武汉"},
{"lng":"114.3603488","lat":"30.52709173","支行名称":"东湖支行","count":"121.6182552","total":"14791","areaname":"武汉"},
{"lng":"114.1355514","lat":"30.62290749","支行名称":"东西湖支行","count":"124.8879498","total":"15597","areaname":"武汉"},
{"lng":"114.2066635","lat":"30.59271902","支行名称":"古田支行","count":"107.8424777","total":"11630","areaname":"武汉"},
{"lng":"114.4050393","lat":"30.48077821","支行名称":"光谷科技支行","count":"148.7850799","total":"22137","areaname":"武汉"},
{"lng":"114.3996645","lat":"30.50494232","支行名称":"光谷支行","count":"169.4609099","total":"28717","areaname":"武汉"},
{"lng":"114.3383203","lat":"30.55684207","支行名称":"汉街支行","count":"82.73451517","total":"6845","areaname":"武汉"},
{"lng":"114.326438","lat":"30.707491","支行名称":"汉口北支行","count":"77.98076686","total":"6081","areaname":"武汉"},
{"lng":"114.2617157","lat":"30.55311426","支行名称":"汉阳支行","count":"114.5076417","total":"13112","areaname":"武汉"},
{"lng":"114.2726211","lat":"30.57236234","支行名称":"汉正街支行","count":"82.94576541","total":"6880","areaname":"武汉"},
{"lng":"114.2980887","lat":"30.65463731","支行名称":"后湖支行","count":"99.16652661","total":"9834","areaname":"武汉"},
{"lng":"114.3633027","lat":"30.51909063","支行名称":"虎泉支行","count":"74.76630257","total":"5590","areaname":"武汉"},
{"lng":"114.2809084","lat":"30.61315332","支行名称":"花桥支行","count":"102.0490078","total":"10414","areaname":"武汉"},
{"lng":"114.3034292","lat":"30.56260821","支行名称":"积玉桥支行","count":"100.9851474","total":"10198","areaname":"武汉"},
{"lng":"114.3404729","lat":"30.53042491","支行名称":"街道口支行","count":"81.25269226","total":"6602","areaname":"武汉"},
{"lng":"114.3002351","lat":"30.6101464","支行名称":"解放公园支行","count":"71.79136438","total":"5154","areaname":"武汉"},
{"lng":"114.4150981","lat":"30.45640754","支行名称":"金融港支行","count":"163.4594751","total":"26719","areaname":"武汉"},
{"lng":"114.2004748","lat":"30.6427725","支行名称":"金银湖支行","count":"69.32532005","total":"4806","areaname":"武汉"},
{"lng":"114.2326041","lat":"30.65296665","支行名称":"金银潭支行","count":"88.27797007","total":"7793","areaname":"武汉"},
{"lng":"114.1548732","lat":"30.49203147","支行名称":"经济开发区支行","count":"145.251506","total":"21098","areaname":"武汉"},
{"lng":"114.3230258","lat":"30.50574686","支行名称":"南湖支行","count":"105.399241","total":"11109","areaname":"武汉"},
{"lng":"114.2541866","lat":"30.58001363","支行名称":"桥口支行","count":"96.4935231","total":"9311","areaname":"武汉"},
{"lng":"114.2562573","lat":"30.62906699","支行名称":"硚口支行","count":"34.17601498","total":"1168","areaname":"武汉"},
{"lng":"114.2928532","lat":"30.58392637","支行名称":"青岛路支行","count":"67.60917098","total":"4571","areaname":"武汉"},
{"lng":"114.3962016","lat":"30.64382913","支行名称":"青山支行","count":"117.3413823","total":"13769","areaname":"武汉"},
{"lng":"114.2955228","lat":"30.60091386","支行名称":"三阳路支行","count":"60.10823571","total":"3613","areaname":"武汉"},
{"lng":"114.4691859","lat":"30.48615647","支行名称":"生物城支行","count":"70.5478561","total":"4977","areaname":"武汉"},
{"lng":"114.3032144","lat":"30.53634305","支行名称":"首义支行","count":"120.9793371","total":"14636","areaname":"武汉"},
{"lng":"114.3383395","lat":"30.55046951","支行名称":"水果湖支行","count":"81.63332653","total":"6664","areaname":"武汉"},
{"lng":"114.3058782","lat":"30.61187165","支行名称":"天地支行","count":"67.84541252","total":"4603","areaname":"武汉"},
{"lng":"114.2023204","lat":"30.56005169","支行名称":"王家湾支行","count":"130.9580085","total":"17150","areaname":"武汉"},
{"lng":"114.3283929","lat":"30.5411478","支行名称":"武昌支行","count":"123.701253","total":"15302","areaname":"武汉"},
{"lng":"114.35509","lat":"30.60615554","支行名称":"武钢支行","count":"79.15175298","total":"6265","areaname":"武汉"},
{"lng":"114.2585126","lat":"30.59628695","支行名称":"武汉分行营业部","count":"141.9401282","total":"20147","areaname":"武汉"},
{"lng":"113.9311837","lat":"30.91906006","支行名称":"孝感分行营业部","count":"131.6776367","total":"17339","areaname":"孝感"},
{"lng":"114.2594859","lat":"30.61729107","支行名称":"新华路支行","count":"85.93602271","total":"7385","areaname":"武汉"},
{"lng":"114.3881453","lat":"30.49946629","支行名称":"雄楚金地城支行","count":"91.69514709","total":"8408","areaname":"武汉"},
{"lng":"114.3371436","lat":"30.51232954","支行名称":"雄楚支行","count":"100.0949549","total":"10019","areaname":"武汉"},
{"lng":"114.3356022","lat":"30.58861891","支行名称":"徐东支行","count":"114.7039668","total":"13157","areaname":"武汉"},
{"lng":"114.278701","lat":"30.58820648","支行名称":"循礼门支行","count":"128.1678587","total":"16427","areaname":"武汉"},
{"lng":"114.3588158","lat":"30.58369353","支行名称":"岳家嘴支行","count":"51.50728104","total":"2653","areaname":"武汉"},
{"lng":"114.3336163","lat":"30.55398107","支行名称":"中北路支行","count":"73.34166619","total":"5379","areaname":"武汉"},
{"lng":"114.06812","lat":"30.570683","支行名称":"中法生态城支行","count":"70.29224708","total":"4941","areaname":"武汉"},
{"lng":"114.982852","lat":"30.10472","支行名称":"大冶支行","count":"85.01176389","total":"7227","areaname":"黄石"},
{"lng":"112.196437","lat":"32.105442","支行名称":"高新支行","count":"62.93647591","total":"3961","areaname":"襄阳"},
{"lng":"111.298849","lat":"30.728508","支行名称":"葛洲坝支行","count":"51.26402247","total":"2628","areaname":"宜昌"},
{"lng":"114.889263","lat":"30.458555","支行名称":"黄冈分行营业部","count":"116.447413","total":"13560","areaname":"黄冈"},
{"lng":"115.036842","lat":"30.20441","支行名称":"黄石分行营业部","count":"78.55571271","total":"6171","areaname":"黄石"},
{"lng":"115.101083","lat":"30.211672","支行名称":"京华路支行","count":"61.8950725","total":"3831","areaname":"黄石"},
{"lng":"112.251685","lat":"30.317087","支行名称":"荆州分行营业部","count":"113.7321415","total":"12935","areaname":"荆州"},
{"lng":"112.270242","lat":"30.319941","支行名称":"荆州沙市支行","count":"59.94997915","total":"3594","areaname":"荆州"},
{"lng":"115.097726","lat":"30.217981","支行名称":"南京路支行","count":"62.92853089","total":"3960","areaname":"黄石"},
{"lng":"115.440024","lat":"30.238626","支行名称":"蕲春支行","count":"57.68882041","total":"3328","areaname":"黄冈"},
{"lng":"110.785297","lat":"32.647162","支行名称":"十堰分行营业部","count":"124.2175511","total":"15430","areaname":"十堰"},
{"lng":"111.299745","lat":"30.715432","支行名称":"西陵支行","count":"75.6306816","total":"5720","areaname":"宜昌"},
{"lng":"112.140853","lat":"32.016853","支行名称":"襄城支行","count":"73.05477397","total":"5337","areaname":"襄阳"},
{"lng":"112.144785","lat":"32.045905","支行名称":"襄阳分行营业部","count":"111.1125555","total":"12346","areaname":"襄阳"},
{"lng":"112.185587","lat":"32.081647","支行名称":"襄州支行","count":"54.74486277","total":"2997","areaname":"襄阳"},
{"lng":"111.329444","lat":"30.77399","支行名称":"夷陵支行","count":"62.67375846","total":"3928","areaname":"宜昌"},
{"lng":"111.288549","lat":"30.70829","支行名称":"宜昌分行营业部","count":"70.63993205","total":"4990","areaname":"宜昌"},
{"lng":"111.312917","lat":"30.6872","支行名称":"宜昌中山支行","count":"92.40129869","total":"8538","areaname":"宜昌"},
{"lng":"115.090955","lat":"30.220388","支行名称":"挹江支行","count":"77.76888838","total":"6048","areaname":"黄石"},
{"lng":"111.302075","lat":"30.70207","支行名称":"云集支行","count":"67.17142249","total":"4512","areaname":"宜昌"},

   
	];//这里面添加经纬度
	
	

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
		
		var content = "支行名称："+points[i].支行名称 +"\t"+ "<br>"+"交易总量："+ points[i].total; //创建标注信息框 
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
	     
	        var str = p3.substring(p3.indexOf("支行名称：") + 5,p3.indexOf("\t"));
            //将str银行名称传到下一个展示详情的页面，也就是echart页面1
			location.href="echart.jsp?bankname="+str;

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
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'echart.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" type="text/css" href="css/bootstrap.css">
<script type="text/javascript"
	src="http://echarts.baidu.com/build/dist/echarts.js"></script>
<script type="text/javascript" src="jquery.min.js"></script>
<script src="bootstrap.js"></script>
<script type="text/javascript">
	require.config({
		paths : {
			echarts : 'http://echarts.baidu.com/build/dist'
		}
	});
	// 使用
	require([ 'echarts', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
	], drewEcharts2
    );
    	// 路径配置
	require.config({
		paths : {
			echarts : 'http://echarts.baidu.com/build/dist'
		}
	});
	// 使用
	require([ 'echarts', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
	], drewEcharts1
    );
	// 路径配置
	require.config({
		paths : {
			echarts : 'http://echarts.baidu.com/build/dist'
		}
	});
	// 使用
	require([ 'echarts', 'echarts/chart/line' // 使用柱状图就加载bar模块，按需加载
	], drewEcharts
    );



	//获取网址后面的参数-银行名称
	function Request(strName) {
		var href = this.location;
		//http://localhost:8080/echartdemo/echart.jsp?bankname=%E6%B1%89%E5%8F%A3%E5%8C%97%E6%94%AF%E8%A1%8Cdate=2018-04
		// var strHref = "http://localhost:8080/echartdemo/echart.jsp?bankname="+decodeURI("%E6%B1%89%E5%8F%A3%E5%8C%97%E6%94%AF%E8%A1%8C");
		var strHref = decodeURI(href);

		var intPos = strHref.indexOf("?");
		var strRight = strHref.substr(intPos + 1);
		var arrTmp = strRight.split("&");
		for ( var i = 0; i < arrTmp.length; i++) {
			var arrTemp = arrTmp[i].split("=");
			if (arrTemp[0].toUpperCase() == strName.toUpperCase())
				return arrTemp[1];
		}
	}
	var bankname = Request("bankname");
	alert(bankname);
	var date = Request("date");
	alert(date);
	function drewEcharts(ec) {
		// 基于准备好的dom，初始化echarts图表
		var myChart = ec.init(document.getElementById('main'));
       var option = {
     
			title : {
				text : "VTM-大机交易量",

			},
			tooltip : {
				show : true
			},
			legend : {
				data : [ '交易量' ]
			},
			xAxis : [ {
				type : 'category',
				name : '设备编号',
				axisLabel : {
					interval : 0,
					rotate : 30,
					//倾斜度 -90 至 90 默认为0  
					margin : 1,
					textStyle : {

						color : "#000000"
					}
				},
				data : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "helloBar",
						data : {
							name1:bankname, //支行编号
							date : date,
							type:1,
						},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for ( var i = 0; i < result.length; i++) {
									if (result[i].type == 1) {

										arr.push(result[i].name);
									}
								}
							}

						},
						error : function(errorMsg) {
							alert("图表请求数据失败");
							myChart.hideLoading();
						}
					})
					return arr;
				})()

			},

			],
			yAxis : [ {
				type : 'value'
			} ],
			series : [
					{
						"name" : "交易量",
						"type" : "line",
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						},
						symbol : 'triangle',
						symbolSize : 10,
						lineStyle : {
							normal : {
								color : 'green',
								width : 4,
								type : 'dashed'
							}
						},
						itemStyle : {
							normal : {
								borderWidth : 3,
								borderColor : 'yellow',
								color : 'blue'
							}
						},
						"data" : (function() {
							var arr = [];
							$
									.ajax({
										type : "post",
										async : false, //同步执行
										url : "helloBar",
										data : {
											name1 : bankname,
											date : date,
											type:1,
										},
										dataType : "json", //返回数据形式为json
										success : function(result) {
											if (result) {
												var sum = 0;
												var count = 0;
												for ( var i = 0; i < result.length; i++) {
													if (result[i].type == 1) {
														sum += parseInt(result[i].num);
														count = count + 1;
														arr.push(result[i].num);
													}
												}
							                    var avg = parseFloat(sum/ count);
												var avg = avg.toFixed(2);
												if (avg > 2764) {
													var str1 = "湖北省的VTM大机的平均交易量是2764，该支行的平均交易量是"
															+ avg
															+ "，该支行VTM大机的平均交易量高于湖北省VTM大机的平均交易量";
												} else {
													var str1 = "湖北省的VTM大机的平均交易量是2764，该支行的平均交易量是"
															+ avg
															+ "，该支行VTM大机的平均交易量低于湖北省VTM大机的平均交易量";
												}

												$("#msg").text(str1);
												
                                         	}
										},
										error : function(errorMsg) {
											alert("图表请求数据失败");
											myChart.hideLoading();
										}
									})
							return arr;
						})()

					},

					{
						name : '湖北省VTM交易量的平均值',
						symbol : 'triangle',
						symbolSize : 0,
						type : 'line',
						data : [ 2764 ],
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						}
					},

			]
		};

		// 为echarts对象加载数据 
		myChart.setOption(option);

	}

	function drewEcharts1(ec) {
		// 基于准备好的dom，初始化echarts图表
		var myChart = ec.init(document.getElementById('main1'));;
      var flag=1;
		var option = {
		noDataLoadingOption: {
                        text: '无数据',
                        effect: 'bubble',
                        effectOption: {
                            effect: {
                                n: 0
                            }
                        }
                    },
			title : {
				text : "VTM-行内PAD交易量"
			},
			tooltip : {
				show : true
			},
			legend : {
				data : [ '交易量' ]
			},
			xAxis : [ {
				type : 'category',
				name : '设备编号',
				axisLabel : {
					interval : 0,
					rotate : 30,
					//倾斜度 -90 至 90 默认为0  
					margin : 1,
					textStyle : {

						color : "#000000"
					}
				},
				data : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "helloBar",
						data : {
							name1 : bankname,
							date : date,
							type:2,
						},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for ( var i = 0; i < result.length; i++) {
									if (result[i].type == 2) {
										console.log(result[i].name);
										arr.push(result[i].name);
									}
								}
							}

						},
						error : function(errorMsg) {
							alert("图表请求数据失败");
							myChart.hideLoading();
						}
					})
					return arr;
				})()

			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [
					{
						"name" : "交易量",
						"type" : "line",
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						},

						symbol : 'triangle',
						symbolSize : 10,
						lineStyle : {
							normal : {
								color : 'green',
								width : 3,
								type : 'dashed'
							}
						},
						itemStyle : {
							normal : {
								borderWidth : 2,
								borderColor : 'yellow',
								color : 'green'
							}
						},
						"data" : (function() {
							var arr = [];
							$
									.ajax({
										type : "post",
										async : false, //同步执行
										url : "helloBar",
										data : {
											name1 : bankname,
											date : date,
											type:2
										},
										dataType : "json", //返回数据形式为json
										success : function(result) {
											if (result) {
												var sum = 0;
												var count = 0;
												for ( var i = 0; i < result.length; i++) {
													if (result[i].type == 2) {
														sum += parseInt(result[i].num);
														count = count + 1;
														console.log(result[i].num);
														arr.push(result[i].num);
													}
												}
												if(arr.length<1)
												{
												flag=0;
										      $("#msg1").hidden();
												}
										var avg = parseFloat(sum	/ count);
												var avg = avg.toFixed(2);
												if (avg > 120) {
													var str1 = "湖北省的行内PAD的平均交易量是120，该支行的平均交易量是"
															+ avg
															+ "，该支行行内PAD的平均交易量高于湖北省行内PAD的平均交易量";
												} else {
													var str1 = "湖北省的行内PAD的平均交易量是120，该支行的平均交易量是"
															+ avg
															+ "，该支行行内PAD的平均交易量低于湖北省行内PAD的平均交易量";
												}

												$("#msg1").text(str1);
												
						
											}
										},
										error : function(errorMsg) {
											alert("图表请求数据失败");
											myChart.hideLoading();
										}
									})
							return arr;
						})()

					}, {
						name : '湖北省行内PAD交易量的平均值',
						symbol : 'triangle',
						symbolSize : 0,
						type : 'line',
						data : [ 120 ],
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						}
					}

			]
		};

		// 为echarts对象加载数据 
		if(flag==0)
		{
		alert("该支行无行内PAD")
		}
		else{
		myChart.setOption(option);
		}
	}
	function drewEcharts2(ec) {
		// 基于准备好的dom，初始化echarts图表
		var myChart = ec.init(document.getElementById('main2'));

            var flag=1;
		var option = {
      title : {
				text : "VTM-外拓PAD交易量"
			},
			tooltip : {
				show : true
			},
			legend : {
				data : [ '交易量' ]
			},
			xAxis : [ {
				type : 'category',
				name : '设备编号',
				axisLabel : {
					interval : 0,
					rotate : 30,
					//倾斜度 -90 至 90 默认为0  
					margin : 1,
					textStyle : {

						color : "#000000"
					}
				},
				data : (function() {
					var arr = [];
					$.ajax({
						type : "post",
						async : false, //同步执行
						url : "helloBar",
						data : {
							name1 : bankname,
							date : date,
							type:3,
						},
						dataType : "json", //返回数据形式为json
						success : function(result) {
							if (result) {
								for ( var i = 0; i < result.length; i++) {
									if (result[i].type == 3) {
										console.log(result[i].name);
										arr.push(result[i].name);
									}
								}
								if(arr.length<1)
								flag=0;
							}

						},
						error : function(errorMsg) {
							alert("图表请求数据失败");
							myChart.hideLoading();
						}
					})
					return arr;
				})()

			} ],
			yAxis : [ {
				type : 'value'
			} ],
			series : [
					{
						"name" : "交易量",
						"type" : "line",
						symbol : 'triangle',
						symbolSize : 10,
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						},
						lineStyle : {
							normal : {
								color : 'green',
								width : 4,
								type : 'dashed'
							}
						},
						itemStyle : {
							normal : {
								borderWidth : 3,
								borderColor : 'yellow',
								color : 'orange'
							}
						},
						"data" : (function() {
							var arr = [];
							$
									.ajax({
										type : "post",
										async : false, //同步执行
										url : "helloBar",
										data : {
											name1 : bankname,
											date : date,
											type:3,
										},
										dataType : "json", //返回数据形式为json
										success : function(result) {
											if (result) {
												var sum = 0;
												var count = 0;
												for ( var i = 0; i < result.length; i++) {
													if (result[i].type == 3) {
														sum += parseInt(result[i].num);
														count = count + 1;
														console.log(result[i].num);
														arr.push(result[i].num);
													}
												}
											if(arr.length<1)
												{
												flag=0;
												$("#msg2").hidden();
												}
		                                        var avg = parseFloat(sum/ count);
												var avg = avg.toFixed(2);
												if (avg > 395) {
													var str2 = "湖北省的外拓PAD的平均交易量是395，该支行的平均交易量是"
															+ avg
															+ "，该支行外拓PAD的平均交易量高于湖北省外拓PAD的平均交易量";
												} else {
													var str2 = "湖北省的外拓PAD的平均交易量是395，该支行的平均交易量是"
															+ avg
															+ "，该支行外拓PAD的平均交易量低于湖北省外拓PAD的平均交易量";
												}

												$("#msg2").text(str2);
						
											}
										},
										error : function(errorMsg) {
											alert("图表请求数据失败");
											myChart.hideLoading();
										}
									})
							return arr;
						})()

					}, {
						name : '湖北省外拓交易量的平均值',
						symbol : 'triangle',
						symbolSize : 0,
						type : 'line',
						data : [ 395 ],
						markLine : {
							data : [ {
								type : 'average',
								name : '平均值'
							} ]
						}
					}, ]
		};

		// 为echarts对象加载数据 
		if(flag==0)
		{
		alert("该支行无外拓PAD")
		}
		else{
		myChart.setOption(option);
		}
	}
	
</script>

<style type="text/css">
html,body {
	margin: 0px;
	font-size: 17px;
	padding: 0px;
}
</style>
</head>

<body>
	<nav class="navbar  navbar-inverse" role="navigation">
	<div class="container-fluid">
		<a class="navbar-brand" href="index1.jsp">首页</a>
		<ul class="nav navbar-nav">
			<li><a href="">城市热力图</a>
			</li>
			<li class="active"><a href="index1.jsp">设备分析</a>
			</li>
		</ul>
	</div>
	</nav>


	<div id="main" style="height: 400px; width: 600px;margin:70px"></div>
	<div id="right"
		style="position:absolute; width:350px; height:30%;right: 300px;top:180px;">
		<p id="msg" style="line-height:40px"></p>
	</div>

	<div id="main1" style="height: 400px; width: 600px;margin:70px"></div>
	<div id="right"
		style="position:absolute;width:350px; height:30%;right: 300px;top:660px;">
		<p id="msg1" style="line-height:40px"></p>
	</div>

	<div id="main2" style="height: 400px; width: 600px;margin:70px"></div>
	<div id="right"
		style="position:absolute;width:350px; height:30%;right: 300px;top:1140px;">
		<p id="msg2" style="line-height:40px"></p>
	</div>
</body>
</html>

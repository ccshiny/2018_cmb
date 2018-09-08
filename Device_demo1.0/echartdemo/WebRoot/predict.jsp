<!DOCTYPE html>

<html>
<head>
    <meta name="viewport" content="width=device-width" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
      <link rel="stylesheet" type="text/css" href="css/bootstrap.css">
    <script src="http://code.jquery.com/jquery-1.8.2.min.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=KSOP9zkg1u2QCl4KYAEG4FWfYDmAaCUb"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/library/AreaRestriction/1.2/src/AreaRestriction_min.js"></script>
    <script type="text/javascript" src="http://lbsyun.baidu.com/custom/stylelist.js"></script>
    <script src="bootstrap.js"></script>
  
   
    <style type="text/css">
html, body {
       
            font-size: 15px;
          
            background: #34363A;
            color: #fff;
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
    <li ><a href="index1.jsp">首页</a></li>
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

    <li class="active"><a href="predict.jsp">交易量预测</a></li>
    
  </ul>
  </div>
</nav> 

   


 <table class="table"  style="margin: 0px 0px 0px 70px;width:1200px;text-align:center" >
	<thead>
	<tr>
	 <th >排名</th>
	 <th >变量名</th>
	 <th >变量标签</th>
	 <th >系数</th>
	 <th>显著性</th>
	</tr>
	</thead>
 </table>
<table class="table  table-hover"  style="margin: 0px 0px 0px 70px;width:1200px;text-align:center" >
		<tbody>
			<tr>
				<td>1</td>
				<td>visit</td>
				<td>网点访问量</td>
				<td>系数1</td>
				<td>显著性：***</td>
			</tr>
			<tr>
				<td>2</td>
				<td>is_trade_area</td>
				<td>商圈</td>
					<td>系数2</td>
				<td>显著性：***</td>
			</tr>
			<tr>
				<td>3</td>
				<td>is_vtm</td>
				<td>是否是VTM</td>
				<td>系数2</td>
				<td>显著性：**</td>
			</tr>
			
		
</tbody>
	</table>


</body>
</html>

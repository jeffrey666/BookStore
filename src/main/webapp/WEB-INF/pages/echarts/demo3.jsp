<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <!-- 引入 ECharts 文件 -->
    <script src="${pageContext.request.contextPath}/staticfile/js/echarts.js"></script>
    <script type="text/javascript"
            src="${pageContext.request.contextPath}/staticfile/js/jquery-1.6.2.js"></script>
</head>

<body>
<!-- 为 ECharts 准备一个具备大小（宽高）的 DOM -->
<div id="main" style="width: 600px; height: 400px;"></div>
<script type="text/javascript">
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var url = '${pageContext.request.contextPath}/GetAllData1';
    $.getJSON(url).done(function(json) {
        // 2.获取数据
        borrowVolume = json.borrowVolume;//借阅量
        searchVolume = json.searchVolume;//搜索量
        names = json.names;//书名

        // 3.更新图表myChart的数据
        var option = {
            title : {
                text : 'ECharts 入门示例'
            },
            tooltip : {},
            legend : {
                data : [ '借阅量' ],
                data : [ '搜索量' ]
            },
            xAxis : {
                data : names
            },
            yAxis : {},
            series : [ {
                name : '借阅量',
                type : 'bar',
                data : borrowVolume
            }, {
                name : '搜索量',
                type : 'line',
                data : searchVolume
            } ],
            toolbox : {
                show : true,
                feature : {
                    mark : {
                        show : true
                    },
                    dataView : {
                        show : true,
                        readOnly : false
                    },
                    magicType : {
                        show : true,
                        type : [ 'line', 'bar' ]
                    },
                    restore : {
                        show : true
                    },
                    saveAsImage : {
                        show : true
                    }
                }
            },
        }
        myChart.setOption(option);
    })
</script>

</body>

</html>
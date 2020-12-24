<%@page import="main.java.xxx30514.model.Bike"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>追風者｜地圖規劃</title>
<link rel="stylesheet" href="https://unpkg.com/leaflet@1.7.1/dist/leaflet.css" />
<script src="https://unpkg.com/leaflet@1.7.1/dist/leaflet.js"></script>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://maps.stamen.com/js/tile.stamen.js?v1.3.0"></script>
<script src="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet-control-geocoder/dist/Control.Geocoder.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/axios/0.20.0/axios.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.4.2/leaflet.draw.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet.draw/0.4.2/leaflet.draw.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/leaflet-plugins/3.3.2/layer/vector/KML.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.css" />
<script src="https://unpkg.com/leaflet-routing-machine@3.2.12/dist/leaflet-routing-machine.js"></script>
<script src="//api.tiles.mapbox.com/mapbox.js/plugins/leaflet-omnivore/v0.3.1/leaflet-omnivore.min.js"></script>
<script src="http://www.liedman.net/lrm-graphhopper/dist/lrm-graphhopper-1.2.0.min.js"></script>
<script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
<script src='//api.tiles.mapbox.com/mapbox.js/plugins/leaflet-image/v0.0.4/leaflet-image.js'></script>
<script src="https://cdn.bootcss.com/html2canvas/0.5.0-beta4/html2canvas.js"></script>
<%@ include file="/WEB-INF/pages/global/frontEnd_header.jsp"%>
<style>
body {
	font-family: "メイリオ", Meiryo, "ヒラギノ角ゴ Pro W3", "Hiragino Kaku Gothic Pro",
		"ＭＳ Ｐゴシック", "MS PGothic", Arial, Helvetica, sans-serif;
	color: #333333;
}

.carousel .carousel-item img {
	min-height: 200px;
	max-height: 500px;
	object-fit: cover;
}

#topimg img {
	min-height: 200px;
	max-height: 200px;
	object-fit: cover;
}

#top-block {
	height: 200px;
	width: 100%;
	background-color: #f5f5f5;
	top: 0;
	background-position: 50%;
	background-repeat: no-repeat;
	background-size: cover;
	overflow: hidden;
	position: relative;
	background-image: url("img/bikeroad/bike5.jpg");
}

#top-box {
	background-size: cover;
	overflow: hidden;
	position: absolute;
	width: 100%;
	height: 100%;
	top: 0px;
	left: 0px;
	display: block;
	background: rgba(0, 0, 0, 0.3);
	transition: opacity 0.5s ease-in-out;
	color: #FFF;
	text-align: center;
}

#title {
	position: relative;
	text-align: center;
	top: 50px;
	font-family: "Material Icons";
	font-size: 40px;
	color: #fff;
}

#bikemap {
	height: 700px;
	width: 100%;
}
</style>
<!-- <script src=”https://maps.googleapis.com/maps/api/js?key=AIzaSyAAZ_xmbACKfKX8y6OLzxhgV7b0ZksNoLI&libraries=places,drawing,geometry&v=3&callback=initMap”> -->
<!--  </script>  -->

</head>
<body id="body">
	<%@ include file="/WEB-INF/pages/global/frontEnd_top.jsp"%>
	<div id="top-block">
		<div id="top-box">
			<h1 id="title" class="align-middle">地圖規劃</h1>
		</div>
	</div>

	<!-- container -->
	<div class="container my-5">
		<div id="downloadbody">
			<canvas id="myCanvas" width="800" height="600" style="display: none;">
	</canvas>
			<div id="bikemap">
				<c:forEach var="search" items="${queryResult}">
					<%-- 	<input type="hidden" value="${search.latitude}" id="latitude"> --%>
					<%-- 	<input type="hidden" value="${search.longitude}" id="longitude"> --%>
					<%-- 	${search.latitude} --%>
					<%-- ${search.longitude} --%>
				</c:forEach>


			</div>
		</div>
		<button onclick="bikeRoadMarker();" class="btn btn-sm btn-primary m-2">圖標</button>
		<!-- 		<button id="export" class="btn btn-sm btn-primary m-2">下載</button> -->

		<!-- 				<button onclick="clear();" class="btn btn-sm btn-primary m-2">清除</button> -->
		<!-- 				<button id="do" onclick=" takeScreenShot()"  class="btn btn-sm btn-primary m-2">下載</button> -->

		<div id="map"></div>

	</div>
	<!-- 	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" -->
	<!-- 		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" -->
	<!-- 		crossorigin="anonymous"></script> -->
	<%@ include file="/WEB-INF/pages/global/frontEnd_footer.jsp"%>
	<script src="js/bike/html2canvas.js"></script>
	<!-- ///////////////////////////////////////////////////////////////////////////// -->
	<!-- 使用須知： -->
	<!-- 1.每一隻ajax記得url要改一下
			 2.check Login 裡的success改成自己需要判斷的按鈕(url也要改)
			 3.需要增加的屬性:
			 
			 愛心:  <a id="favorite" class="event-favorite btn float-right"> <i class="far fa-heart"></i></a>
			會員ID :<input id="memberId" value="${loginOK.memberId}" type="hidden">
			計數器:  <input id="favcounter" type="hidden" value="0">
			
			4. icon cdn加到head裡: <script src="https://kit.fontawesome.com/731d88c153.js" crossorigin="anonymous"></script>
		 -->
	<%@ page import="java.util.ArrayList"%>
	<%@ page import="java.util.List"%>
	<%@ page import="main.java.xxx30514.*"%>
	<script type="text/javascript">
// 	function initMap() {
// 		  const myLatLng = { lat: -25.363, lng: 131.044 };
// 		  const map = new google.maps.Map(document.getElementById("map"), {
// 		    zoom: 4,
// 		    center: myLatLng,
// 		  });
// 	}
function downloadMyAct() {
                    var filename ="img01";
                    Swal.fire({
                        title: "確認儲存行程表?",
                        icon: "question",
                        showCancelButton: true,
                        closeOnConfirm: false,
                        showLoaderOnConfirm: true,
                        confirmButtonClass: "btn-success",
                        confirmButtonText: "儲存",
                        cancelButtonText: "取消",
                    }).then((result) => {
                        if (result.isConfirmed) {
                            html2canvas(document.getElementById('downloadbody')).then(function(canvas) {
                                document.body.appendChild(canvas);
                                allowTaint: true;
                                useCORS:true;
                                var a = document.createElement('a');
                                a.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream");
                                a.download = filename + '.jpg';
                                a.click();
                            });
                            Swal.fire({
                                    title: "儲存成功",
                                    icon: "success",
                                    timer: 1000,
                                    showConfirmButton: false,
                                })
                                .then(() => {
                                    location.reload();
                                });
                        }
                    });

                }
		//fetch
		 let status = response => {
		        if (response.status >= 200 && response.status < 300) {
		            return Promise.resolve(response)
		        } else {
		            return Promise.reject(new Error(response.statusText))
		        }
		    }

		    let json = response => {
		        return response.json()
		    }
// 		(function initMap() {
// 			var latitude= ${search.latitude};
// 			var longitude= ${search.longitude};
		    var hereApiKey = '0GiRRucUCUQP_uqp9gy35YvOV68RZZNivZBiYmNUMw8';
		    var LMap = L.map(document.getElementById('bikemap'), {
            center: [23.5, 121],  // 中心點
            zoom: 8,  // 縮放層級
            crs: L.CRS.EPSG3857,  // 座標系統
            downloadable: true,
            attributionControl: false,
            preferCanvas: true
        });
		var googlemap = L.tileLayer('http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}', {
		    maxZoom: 20,
		    subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
		    	    	
		    }).addTo(LMap);  // 新增底圖  
		    L.Control.geocoder().addTo(LMap); //搜尋  
		 var hereTerrain = L.tileLayer(
		    	 'https://{s}.aerial.maps.ls.hereapi.com/maptile/2.1/maptile/newest/terrain.day/{z}/{x}/{y}/256/png8?lg=cht&ppi=72&pois&apiKey='+
		    	    hereApiKey, {
		    	        attribution: '© 2020 HERE',
		    	        subdomains: [1, 2, 3, 4]
		    	    }); // 地形圖		
		    	    	    
// 		    	    leafletImage(LMap, function(err, canvas) {
// 		    	        // now you have canvas
// 		    	        // example thing to do with that canvas:
// 		    	        var img = document.createElement('img');
// 		    	        var dimensions = LMap.getSize();
// 		    	        img.width = dimensions.x;
// 		    	        img.height = dimensions.y;
// 		    	        img.src = canvas.toDataURL();
// 		    	        document.getElementById('images').innerHTML = '';
// 		    	        document.getElementById('images').appendChild(img);
// 		    	    });
//         L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token=pk.eyJ1IjoibWFwYm94IiwiYSI6ImNpejY4NXVycTA2emYycXBndHRqcmZ3N3gifQ.rJcFIG214AriISLbB6B5aw', {
//             maxZoom: 18,
//             id: 'mapbox.streets'
//         }).addTo(LMap);  // 新增底圖 
// 			var str = "_p~iF~cn~U_ulLn{vA_mqNvxq`@";
//  			var latlngs = L.PolylineUtil.decode(str);
//  			L.polyline(latlngs, { color: 'red' }).addTo(LMap);
 			
//  			var kml = omnivore.kml('./bikeround.kml').addTo(LMap).bindPopup("<b>環島一號線</b><br>環島1號線是臺灣主要及政府規劃的環島自行車道路線，於2015年12月30日通車，可順時針或逆時針騎行，以省道台1線及台9線為主軸，全長939.5公里。");
//  						 omnivore.gpx('./bike1-1.gpx').addTo(LMap);
//  			 		  omnivore.kml('./bike1-1.kml').addTo(LMap);
//  			comune = omnivore.kml("<c:url value='/js/bike/1207.kml'/>").addTo(LMap);
//  			comune.on('ready', function() {
//  		        this.setStyle({color: "#FF0000"});
//  		    });
//  			omnivore.kml("<c:url value='/js/bike/bike001.kml'/>").addTo(LMap);
//  			omnivore.kml("<c:url value='/js/bike/bike03.kml'/>").addTo(LMap);
//  			not=omnivore.kml("<c:url value='/js/bike/not.kml'/>").addTo(LMap);
//  			not.on('ready', function() {
//  		        this.setStyle({color: "#28004D"});
//  		    });
//  			omnivore.kml("<c:url value='/js/bike/0.kml'/>").addTo(LMap);
 			
 			
//  			omnivore.kml('./bike01.kml').addTo(LMap);
// 				axios.get('./bikeround.kml').then(function (response) {
//             		let data = response.data;
//             		console.log(arguments);
//             		console.log(data);
           
//         		});
//  			 var kmlLayer;
//  	        axios.get('./bikeround.kml').then(function (response) {
//  	            let bounds;
//  	            let data = response.data;
//  	            const parser = new DOMParser();
//  	            const kmlData = parser.parseFromString(data, 'text/xml');  // 解析KML
 	            
//  	            kmlLayer = new L.KML(kmlData);  // KML套疊
//  	            LMap.addLayer(kmlLayer);
//  	            bounds = kmlLayer.getBounds();  // zoom至KML範圍
//  	            LMap.fitBounds(bounds);
//  	        });
         		
				L.control.scale({//比例尺
				    position: 'bottomleft'
				}).addTo(LMap);	
				        
        var redIcon = new L.Icon({//紅色圖釘
        	  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-red.png',
        	  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
        	  iconSize: [25, 41],
        	  iconAnchor: [12, 41],
        	  popupAnchor: [1, -34],
        	  shadowSize: [41, 41]
        	});
        var greenIcon = new L.Icon({//綠色圖釘
      	  iconUrl: 'https://raw.githubusercontent.com/pointhi/leaflet-color-markers/master/img/marker-icon-green.png',
      	  shadowUrl: 'https://cdnjs.cloudflare.com/ajax/libs/leaflet/0.7.7/images/marker-shadow.png',
      	  iconSize: [25, 41],
      	  iconAnchor: [12, 41],
      	  popupAnchor: [1, -34],
      	  shadowSize: [41, 41]
      	});
        var popup = L.popup();

        function onMapClick(e) {
          popup
            .setLatLng(e.latlng)
            .setContent("經緯度座標：" + e.latlng.toString())
            .openOn(LMap);
          LMap.flyTo(e.latlng,12,{
        	  animate: true,
              duration: 2
              });
        }
       
    	
        LMap.on('click', onMapClick);
<%--         <% List<Bike> list = (ArrayList)request.getAttribute("queryResult"); %> --%>
<%--       <% for (int i = 0; i < list.size(); i++) {%> --%>
// //       L.marker([23.5, 121]).addTo(LMap).bindPopup("<b>Title</b><br>Description");
// 			list.getlatitude.get(i);
// 			list.getlongitude.get(i);
<%-- 		<%}%> --%>
<%-- 		<%String latitude ="${search.latitude}"; %> --%>
<%-- 		<%String longitude ="${search.longitude}"; %> --%>
<%-- 		var  latitude =<%=latitude%>; --%>
<%-- 		var  longitude =<%=longitude%>; --%>
         //標記+按下去顯示說明文字  .openPopup()有這個屬性不用案就會直接顯示文字
		L.marker([24.967797, 121.191538], {icon: redIcon}).addTo(LMap).bindPopup("<b>資策會</b><br>追風者").openPopup();
		//路徑
		var routecontrol = L.Routing.control({
// 			  waypoints: [			  
// // 			    L.latLng(24.965546, 121.191022),
// // 			    L.latLng(24.95379, 121.225601)
// 			  ],
			   routeWhileDragging: true,
			    geocoder: L.Control.Geocoder.nominatim(),//搜尋列
			    reverseWaypoints:true,//反轉終點起點
			  //導航圖標
			  createMarker: function(i, wp, nWps) {
				    if (i === 0 || i === nWps - 1) {
				        return L.marker(wp.latLng, {icon: redIcon,draggable: true });
				    } else {
				        return L.marker(wp.latLng, {icon: greenIcon,draggable: true });
				    }
				},
			  //路線顏色
// 			  lineOptions: {
// 		            styles: [{ color: 'green', opacity: 1, weight: 5 }]
// 		          },
		 router: L.Routing.graphHopper('f4d3349a-97ed-4ad7-b677-c00a4bdd230c', {
		        urlParameters: {
		          vehicle: 'bike',
		       	  locale:'zh-TW',
		        }
		    })
			}).addTo(LMap);
		
// 		var map = L.mapbox.map('map', 'map').setView([38.9, -77.03], 14);
        //         L.marker([latitude, longitude]).addTo(LMap);
//         L.marker([${search.latitude}, ${search.longitude}]).addTo(LMap);
//         L.marker([${param.latitude}, ${param.longitude}]).addTo(LMap);

        var drawItem = new L.FeatureGroup();
        LMap.addLayer(drawItem);
        var option = {
                position: 'topleft',
                collapsed: true,
                edit: {
                    featureGroup: drawItem,
                },
            };
       		    
            var drawControl = new L.Control.Draw(option);
            LMap.addControl(drawControl);
            LMap.on('draw:created', function (e) {
                var layer = e.layer;
                console.log(arguments);
                drawItem.addLayer(layer);   
                var shape = layer.toGeoJSON()
                var shape_for_db = JSON.stringify(shape);
                console.log(layer);         
                console.log(shape);         
                console.log(shape_for_db);         
           });
//         	L.control.browserPrint().addTo(LMap);
           	 function afterRender(result){
					return result;
               	 }
           	function afterExport(result){
				return result;
           	 }
//             function downloadMap(caption) {
//                 var downloadOptions = {
//                   container: LMap._container,
//                   caption: {
//                     text: caption,
//                     font: '30px Arial',
//                     fillStyle: 'black',
//                     position: [100, 200]
//                   },
//                   exclude: ['.leaflet-control-zoom', '.leaflet-control-attribution'],
//                   format: 'image/png',
//                   fileName: 'Map.png',
//                   afterRender: afterRender,
//                   afterExport: afterExport
//                 };
//                 var promise = LMap.downloadExport(downloadOptions);
//                 var data = promise.then(function (result) {
//                   return result;
//                 });
//               }
// 			 function downloadMap() {
// 				 html2canvas(document.getElementById('bikemap')).then(function(canvas) {
// 			            document.body.appendChild(canvas);
// 			            var a = document.createElement('a');
// 			            a.href = canvas.toDataURL("image/jpeg").replace("image/jpeg", "image/octet-stream");
// 			            a.download = 'MyMap.jpg';
// 			            a.click();
// 		            });
// 			 }
// 			L.control.bigImage().addTo(LMap);

				
           function takePhoto() {
	    		html2canvas(document.getElementById('bikemap'), {
	        	onrendered: function(canvas) {
	        	console.log(canvas.toDataURL());//這是截圖的base64
	            document.body.appendChild(canvas);//這是有截圖的畫布
	        },
	    });
	} 
           var takeScreenShot = function() {
        	    var screenshot = {};
        	    html2canvas(document.getElementById('bikemap'), {
        	        useCORS: true,
        	        optimized: false,
        	        allowTaint: false,
        	        onrendered: function (canvas) {
        	            var tempcanvas=document.createElement('canvas');
        	            tempcanvas.width=1350;
        	            tempcanvas.height=700;
        	            var context=tempcanvas.getContext('2d');
        	            context.drawImage(canvas,0,0,1350,700,0,0,1350,700);
        	            var link=document.createElement("a");
        	            link.href=tempcanvas.toDataURL('image/jpg');   //function blocks CORS
        	            link.download = 'screenshot.jpg';
        	            link.click();
        	        }
        	    });
        	}
           var layerGroup = L.layerGroup()
           var group=null;
           var layers=new Array();
         
		 function bikeRoadMarker(){
 
			 		let url = "<c:url value='/bikeRoadMarker' />";

		        	fetch(url, {
		        	method: "get"
		       	 })
		        	.then(status)
		        	.then(json)
		        	.then(data => {
//		             	data中有兩個key
//		             	"userCoords" Map型態
//		             	"nearActs" List型態
		 				console.log(data);
		            	let bikeArray = data;
						console.log(data[0].latitude);
// 						 var layers=[];
		        		 for (var item in bikeArray) {
		        			var  marker = new L.marker([bikeArray[item].latitude,bikeArray[item].longitude]).addTo(LMap).bindPopup(
		                    "<b>"+bikeArray[item].name+"</b><br>縣市: "+bikeArray[item].city+"<br>經緯度:"+bikeArray[item].latitude+","+bikeArray[item].longitude);
// 		 					markerTest.openPopup();
							layers.push(marker);
							
		        		}
// 			        		group=L.layerGroup(layers).addTo(LMap);
// 		        		 var myGroup=L.layerGroup(layers);
// 		        		 LMap.addLayer(group);
						console.log(group);
// 		        		 console.log(markerTest);
// 		        		 console.log(layers);
					})	
			 }

		 var myGroup=L.layerGroup(layers);
		 LMap.addLayer(myGroup);		 
		 function clear(){
			 myGroup.clearLayers();
// 			 layerGroup.clearLayers();
// 			 console.log(group);
// 			 console.log(layers);
// 			 console.log(markerTest);
// 			 if(layerGroup!=null){
//     			 LMap.removeLayer(layerGroup);
//     			}
    		 }
		 
		 var bikeround = omnivore.kml("<c:url value='/js/bike/bikeround.kml'/>")	
		 var kml = omnivore.kml("<c:url value='/js/bike/not.kml'/>")//加上.addTo(LMap)會默認選定
		 var taipei = omnivore.kml("<c:url value='/js/bike/1.kml'/>")
		 var newtaipei= omnivore.kml("<c:url value='/js/bike/newtaipei.kml'/>")
		 var taoyuan = omnivore.kml("<c:url value='/js/bike/桃園市.kml'/>")
		 var hccity = omnivore.kml("<c:url value='/js/bike/新竹市.kml'/>")
		 var hccountry = omnivore.kml("<c:url value='/js/bike/新竹縣.kml'/>")
		 var miaoli = omnivore.kml("<c:url value='/js/bike/苗栗縣.kml'/>")
		 var taichung = omnivore.kml("<c:url value='/js/bike/臺中市.kml'/>")
		 var chunghwa = omnivore.kml("<c:url value='/js/bike/彰化縣.kml'/>")
		 var nantou = omnivore.kml("<c:url value='/js/bike/南投縣.kml'/>")
		 var yunlin = omnivore.kml("<c:url value='/js/bike/雲林縣.kml'/>")
		 var chiayicity = omnivore.kml("<c:url value='/js/bike/嘉義市.kml'/>")
		 var chiayicountry = omnivore.kml("<c:url value='/js/bike/嘉義縣.kml'/>")
		 var tainan = omnivore.kml("<c:url value='/js/bike/臺南市.kml'/>")
		 var kaohsiung = omnivore.kml("<c:url value='/js/bike/高雄市.kml'/>")
		 var pingtung = omnivore.kml("<c:url value='/js/bike/new.kml'/>")
		 var taitung = omnivore.kml("<c:url value='/js/bike/臺東縣.kml'/>")
		 var hualien = omnivore.kml("<c:url value='/js/bike/hualien.kml'/>")
		 var ilan = omnivore.kml("<c:url value='/js/bike/ilan.kml'/>")
		 var penghu = omnivore.kml("<c:url value='/js/bike/澎湖縣.kml'/>")
		 var kinmen = omnivore.kml("<c:url value='/js/bike/kinmen.kml'/>")
		 var test = omnivore.kml("<c:url value='/js/bike/河濱自行車道.kml'/>")
		 var mar = omnivore.kml("<c:url value='/js/bike/marker.kml'/>")
		  kml.on('ready', function() {
	 		        this.setStyle({color: "#28004D"});
	 		    });	
		  taipei.on('ready',function() {
					this.setStyle({color:"#FFAE00"});
			  });
		  newtaipei.on('ready',function() {  
				this.setStyle({color:"#467500"});
		  });
		  taoyuan.on('ready',function() { 
				this.setStyle({color:"#6C3365"});
		  });
		var baseLayers = {
    						'環島一號線': bikeround,
    						'不適合騎行路線': kml,
    						'台北市': taipei,
    						'新北市': newtaipei,
    						'桃園市': taoyuan,
    						'新竹市': hccity,
    						'新竹縣': hccountry,
    						'苗栗縣': miaoli,
    						'台中市': taichung,
    						'彰化縣': chunghwa,
    						'南投縣': nantou,
    						'雲林縣': yunlin,
    						'嘉義市': chiayicity,
    						'嘉義縣': chiayicountry,
    						'台南市': tainan,
    						'高雄市': kaohsiung,
    						'屏東縣': pingtung,
    						'台東縣': taitung,
    						'花蓮縣': hualien,
    						'宜蘭縣': ilan,
    						'澎湖縣': penghu,
    						'金門縣': kinmen,
    						'圖標': mar,
						};	
		var maplays={
					'地圖':googlemap,
					'地形圖':hereTerrain,
				}		
		 var control = L.control.layers(maplays,baseLayers,{position: 'topleft'});
		 control.addTo(LMap);
		 function bikeRound(){
			 var kml = omnivore.kml('./bikeround.kml').addTo(LMap).bindPopup("<b>環島一號線</b><br>環島1號線是臺灣主要及政府規劃的環島自行車道路線，於2015年12月30日通車，可順時針或逆時針騎行，以省道台1線及台9線為主軸，全長939.5公里。");
// 				LMap.removeLayer(not);
			 }
		 function nobike(){
			 var kml = omnivore.kml("<c:url value='/js/bike/1.kml'/>").addTo(LMap).bindPopup("<b>不適合騎行路段</b>");
			 kml.on('ready', function() {
	 		        this.setStyle({color: "#28004D"});
	 		    });
// 				LMap.removeLayer(not);
			 }
// 		 function resetMarker(){
//  					LMap.removeLayers(markerTest);
//      		}   
//測試點擊導航
// 				function createButton(label, container) {
//     				var btn = L.DomUtil.create('button', '', container);
//     				btn.setAttribute('type', 'button');
//     				btn.innerHTML = label;
//     				return btn;
// 				}
				
// 				LMap.on('click', function(e) {
//     				var container = L.DomUtil.create('div'),
//     				startBtn = createButton('起點', container),
//         			destBtn = createButton('終點', container);

//     				L.popup()
//         			.setContent(container)
//         			.setLatLng(e.latlng)
//                     .openOn(LMap);
//     				console.log(e.latlng);
// 				});

// 				 L.DomEvent.on(startBtn, 'click', function() {
// // 					 routecontrol.getWaypoints();
// 				        routecontrol.spliceWaypoints(0, 1, e.latlng);
// 				        map1.closePopup();
// 				    });
// 				  L.DomEvent.on(destBtn, 'click', function() {
// 					  routecontrol.getWaypoints();
// 				        routecontrol.spliceWaypoints(control.getWaypoints().length - 1, 1, e.latlng);
// 				        map1.closePopup();
// 				    }); 

			$("#export").click(function(){
          setTimeout(function(){
	       var canvasImgSizeArr = [ $('#bikemap')[0].offsetWidth, $('#bikemap')[0].offsetHeight ];
		   html2canvas($('#bikemap')[0], {
		      useCORS:true,//保证跨域图片的显示，如果为不添加改属性，或者值为false,地图底图不显示
		     x:window.pageXOffset, //页面在水平方向的滚动距离
		     y:window.pageYOffset,//页面在垂直方向的滚动距离
		     onrendered: function (canvas) {
		     var img = new Image();
		     var canvas2 = document.getElementById("myCanvas");
		     var ctx = canvas2.getContext('2d');
		    ctx.fillStyle="#FFFFFF";//画布填充色    	                                    ctx.fillRect(0,0,canvasImgSizeArr[0],canvasImgSizeArr[1]);
		    ctx.lineWidth="1";
		    ctx.rect(20,30,canvas2.width-40,canvas2.height-60);//矩形距离画布左上角水平和垂直距离，矩形的宽高
		    ctx.stroke();
		    img.src = canvas.toDataURL(); 
		                                	  
		    img.onload=function(){
		         // 绘制图片
		          ctx.drawImage(img,24,34,canvas2.width-48,canvas2.height-68);    //图片距离画布左上角水平和垂直距离，图片的宽高
		          // 绘制水印
		          ctx.font="15pt Arial";  //水印文字添加
		          ctx.fillStyle = "#000000"; //设置画布背景色
		          var text = "全国省级边界图";
		          ctx.textBaseline = 'bottom';
		          ctx.fillText(text,(canvas2.width/2-ctx.measureText(text).width/2), 27);//文字的位置
			      var a = document.createElement("a");
			      a.setAttribute("id", "download3");
			      document.body.appendChild(a);
			       //以下代码为下载此图片功能
			      var triggerDownload = $("#download3").attr("href", canvas2.toDataURL()).attr("download", "专题图.png");
			      triggerDownload[0].click();
			       //移除下载a标签
			      document.body.removeChild(a);
		        }
		      }
		                                  
		 });	     
	                              
	              },500);
   })
				 
			/* check login */
			/* jackey/controller/EventPageController --> checkLogin */
			
			$(function(){
				$.ajax({
                    url: 'checkLogin',
                    type: 'post',
                    dataType: 'json',
                    success: function(res) {
                        /* 從這開始改自己想要增加的按鈕 */
                        $("#errorreport").prop("href","bikeErrorInsertEntry.controller");
                        console.log(res);
                        if (res.login == false){
                            //沒登入案愛心導向登入頁
                            $("#errorreport").prop("href","loginPage");
                            $("#errorreport").click(function(){
								alert("請先登入會員");
                            })
                        }
                    }
                });
			});
		</script>
	<!-- <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyD5v5CjTEgBm2yqpNlh8yUXWt7SfHHiLgY&callback=initMap" -->
	<!--   type="text/javascript"> -->
	<!--     </script> -->
</body>


</html>
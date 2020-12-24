<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.lp {
            width: 600px;
            border: 2px solid rgb(47, 238, 88);
            border-collapse: collapse; /*拿掉column間隔*/
        }
	td,tr{
            border:2px solid rgb(47, 238, 88);
        }

</style>
</head>
<body>
<c:import url="/WEB-INF/pages/hotel/Top.jsp"/>
	<div align="center">
	<form action="sixsix.Home.controller" method="GET">
	<table class="lp">
		<h2>輸入的民宿資料表(已新增完成)</h2>
		
		<tr>
		    <label>民宿名稱： ${InsertDataNew.name}</label><br>
		</tr>
		<tr>
			<label>民宿簡介：${InsertDataNew.description}</label><br>
		</tr>
		<tr>
			<label>民宿地址：${InsertDataNew.add}</label><br>
		</tr>	
		<tr>
			<label>民宿電話：${InsertDataNew.tellphone}</label><br>
		</tr>
		<tr>
			<label>民宿所在縣：${InsertDataNew.region}</label><br>
		</tr>
		<tr>
			<label>民宿所在市：${InsertDataNew.town}</label><br>
		</tr>
		<tr>
			<label>民宿圖片網址(請插入圖檔網址)：${InsertDataNew.picturel}</label><br>
		</tr>
		<tr>
			<label>民宿特殊設備：${InsertDataNew.serviceinfo}</label><br>
		</tr>
		<tr>
			<label>民宿車位：${InsertDataNew.parkinginfo}</label><br>
		</tr>
		<tr>
			<label>民宿經度：${InsertDataNew.px}</label><br>
		</tr>
		<tr>
			<label>民宿緯度：${InsertDataNew.py}</label><br>
		</tr>
	</table>
	<div align="center">
    	     	<input type="hidden" name="opendata">
            	<input type="submit" value="返回主頁面">
			</div>
			</form>
	
	</div>
</body>
</html>
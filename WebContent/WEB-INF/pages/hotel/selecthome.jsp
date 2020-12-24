<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
        td,th{
            border:2px solid rgb(47, 238, 88);
        }
        img {
        	width: 200px;
        	height: 200px;
        }
    </style>
</head>
<body>

	<div style="height:600px">
								
        <c:forEach var="x" items="${ADDD}">
        <form action="<c:url value='/TadsasRT'/>" method="POST">
	<table class="lp"  align="center">       
        <tbody>
            <tr>
                <td colspan="3">${x.name}</td>
                <c:choose>     
                <c:when test="${empty x.picturel}">
                	<td colspan="2" rowspan="2"><img src="https://imgur.dcard.tw/qNU5LUj.gif"></td>
                </c:when>
                <c:otherwise>
                	<td colspan="2" rowspan="2"><img src="${x.picturel}"></td>
            	</c:otherwise>
            	</c:choose>
            </tr>
            <tr>
                <td>${x.add}</td>
                <td>${x.tellphone}</td>    
            </tr>
            <tr>
                <td colspan="5">
                    ${x.description}
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    	<h4>特殊設施及服務：<h4> ${x.serviceinfo}	
                </td>
            </tr>
            <tr>
                <td colspan="5">
                    	${x.parkinginfo}	
                </td>
            </tr>
                  
            
        </tbody>
			
    </table>
    	     <div align="center">
    	     	<input type="hidden" name="homename" value="${x.name}">
            	<input type="submit" value="修改">
				<input type="reset" value="取消">
			</div>
			</form>
    <br>
        </c:forEach>
	
	</div>
	
	
</body>
</html>
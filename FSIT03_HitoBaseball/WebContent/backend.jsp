<%@page import="fsit03_HitoBasebal.TeamModel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%

TeamModel team =(TeamModel) request.getAttribute("team");

%>
    
<!DOCTYPE html>
<html>
<head>
    <title>後台主頁</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel='stylesheet' href='css/modal.css'>
    <link rel="stylesheet" href="css/backend.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
</head>

<body>
<div class="w3-container front_10"> 
  <p></p> 
  <div class="w3-dropdown-hover"> 
   <span style=" color: white; font-size: 48px; font-weight: bold; letter-spacing: -0.05em; "> 
   <img alt="menu" src="imgs/ball03_512px_LOGO.png" style=" width: 72px; margin-right: -10px; "> 
   HitoBaseball</span> 
   <div class="w3-dropdown-content w3-bar-block w3-border"> 
    <a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon01_512px.png" style=" width: 24px; ">&nbsp;Hito首頁</a> 
    <a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon02_512px.png" style=" width: 24px; ">&nbsp;建立球隊</a> 
    <a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;編輯球隊</a> 
    <a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon04_512px.png" style=" width: 24px; ">&nbsp;造訪球隊</a> 
    <a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon05_512px.png" style=" width: 24px; ">&nbsp;快速登入</a> 
   </div> 
  </div> 
 </div>
 
<div class="container">
<div class="w3-container w3-half "></div>
<div class="w3-container w3-half ">
<form action="AddTeam" class="w3-container w3-card-4" style="margin: 100px auto 45px auto ; background-color: white;">
  <h2 class="w3-text-blue">建立我的球隊</h2>
  <p>Create My Team</p>
	  <p>      
	  <label class="w3-text-blue"><b>球隊名稱</b></label>
	  <input type="text" placeholder="E-mail" name="teamName" required class="w3-input w3-border">
	  </p>
	  
	  <p>      
	  <label class="w3-text-blue"><b>FB網址</b></label>
	  <input type="text" placeholder="FB網址" name="fb" class="w3-input w3-border">
	  </p>
	  
	  <p>      
	  <label class="w3-text-blue"><b>聯絡E-mail</b></label>
	  <input type="email" placeholder="E-mail" name="email" class="w3-input w3-border"></p>
	  <p>       
  	  
  	  <button class="w3-btn w3-blue" type="submit">確定</button></p>
</form>
</div>
</div><!--ALL-div-->

<div style=" text-align: center; background-color: #203562; color: white ">
   <p>Footer Text</p> 
   <p>Footer Text</p> 
   <p>Footer Text</p> 
</div> 

</body>

</html>
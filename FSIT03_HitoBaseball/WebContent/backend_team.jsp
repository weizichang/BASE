<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="fsit03_HitoBasebal.TeamModel"%>
<%@page import="fsit03_HitoBasebal.Teams"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

session = request.getSession();
String teamId = (String)session.getAttribute("teamId");

if(teamId==null){
	response.sendRedirect("check.jsp");
}else{
	
}

TeamModel team =(TeamModel) request.getAttribute("team");

%>


<!DOCTYPE html>
<html>
<head>
    <title>後台-球隊頁</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta charset="utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
    <link rel="stylesheet" href="css/backend_team.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel='stylesheet' href='css/modal.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.2.1.js"></script>
    
    <!--api-->
    <link rel="stylesheet" href="css/api_bootstrap-3.3.2.min.css" type="text/css"/>
    <script type="text/javascript" src="js/bootstrap-3.3.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-2.1.3.min.js"></script>
    <script type="text/javascript" src="js/bootstrap-multiselect.js"></script>
    <link rel="stylesheet" href="css/api_bootstrap-multiselect.css" type="text/css"/>
    
<style>
	body {
		font-family: Helvetica, Arial, "文泉驛正黑", "WenQuanYi Zen Hei", "儷黑 Pro", "LiHei Pro", Meiryo, "微軟正黑體", "Microsoft JhengHei", sans-serif;
		}
</style>  

</head>



<body>
<div class="play"><!--ALLdiv-->
<!--頁籤 -->
<nav class="navbar navbar-inverse">
      		<div class="collapse navbar-collapse" id="myNavbar">
				<div>
					<img alt="menu" src="imgs/ball03_512px_LOGO.png" style= "width: 32px;">
					<span style=" color: white; font-size: 28px ">HitoBaseball</span>
						<div class="w3-dropdown-content w3-bar-block w3-border">
							<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon01_512px.png" style=" width: 24px; ">&nbsp;Hito首頁</a>
							<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon02_512px.png" style=" width: 24px; ">&nbsp;建立球隊</a>
							<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon03_512px.png" style=" width: 24px; ">&nbsp;編輯球隊</a>
							<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon04_512px.png" style=" width: 24px; ">&nbsp;造訪球隊</a>
							<a href="#" class="w3-bar-item w3-button" style=" font-size: 16px; ">&nbsp;<img src="imgs/menuicon05_512px.png" style=" width: 24px; ">&nbsp;快速登入</a>
						</div>
				</div>
      		</div>
   </nav>
    
<!--ALLdiv-->
<div class="container">
<!--我的球隊圖片，圖片及資料要變更-->
<div class="myTeamArea">
	 <div class="responsive">
    	<div class="gallery">
    		<!--照片位置-->
	    	<div class="image-container_logo">
	    		<img src="upload/<%= team.getTeamId() %>_logo.png" alt="logo" style="width:200px" >
			   </div>
                 
            <!--上傳logo按鈕-->
			<div class="logophotoArea">
	    		<div class="teamimg" id="add">
	        		<button style="font-size:10px" class="addLogoButton" style="width:auto;" id="demo">
	        		<i class="fa fa-hand-o-right"></i>編輯球隊logo</button><!--待處理-->
	    		</div>
	  		</div>
	    </div>
	</div>
		
<!--彈出視窗按鈕-->
	<div class="w3-modal" id="newteam">
		<div class="container_m">
			<section id="content">		
				<span class="w3-button w3-display-topright w3-large" 
			      onclick="document.getElementById('newteam').style.display='none'">&times;</span>	
				<form action="LogoUpload" enctype="multipart/form-data" method="post">
					<h1>編輯球隊logo</h1>
					<div class="logoupload">
						<input type="file"  title="上傳球隊logo" name="logo" data-filename-placement="inside" >
					</div>
					<div>
						<input type="submit" value="設定為球隊logo" class="w3-button With w3-small w3-green">
					</div>					
				</form>
			</section>
		</div>	
	</div>
	    
<!--顯示球隊訊息-->
	<div class="team">
		<p><%= team.getTeamname() %><br>
		   FB網址：<%= team.getFb() %><br>
		   E-mail：<%= team.getEmail() %>
		</p>
	</div>
</div>
	   
	  
<!--頁籤-->
<nav class="navbar navbar-inverse bg-inverse">
  <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#listbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
  </div>
      
	<div class="collapse navbar-collapse" id="listbar">
	    <ul class="nav navbar-nav">
	        <li class="active"><a href="MyTeam" >編輯球隊資料</a></li>
	        <li><a lass="nav-link" href="backend_players.jsp">編輯球員資料</a></li>
	        <li><a lass="nav-link" href="">賽程查詢/預排</a></li>
	        <li><a lass="nav-link" href="">紀錄查詢/修改</a></li>
	        <li><a lass="nav-link" href="">Preview</a></li>
	    </ul>
</div>
</nav>


<!--可修改球隊資料的內容-->
<div id="team">
	<form action="UpdateTeam">
	  <table id="miyazaki">
	    <tr id="tablenone">
	      <th>球隊名稱</th>
	      <th>FB網址</th></th>
	      <th>E-mail</th>
	    </tr>
	  
	    <tr>
	      <td><!--球隊名稱-->
	      <input name="teamName" type="text" class="inputA" value=<%= team.getTeamname() %>>
	      </td>
	        
	      <td><!--FB網址-->
	      <input name="fb" type="text" class="inputB" value=<%= team.getFb() %>>
	      </td>
	        
	      <td><!--聯絡E-mail-->
	      <input name="email" type="text" class="inputB" value=<%= team.getEmail() %>>
	      </td>
	    </tr>
	      
	  </table>
	
	  <div class="scbutton">
	    <button type="submit" class="saveButton">儲存變更</button>
		<!--<button onclick="cancel()" class="cancelButton">取消</button> -->
	  </div>
	  
	</form>
</div>


<hr>  

<!--幻燈照片區-->
<div class="teamImg">
  <P><img src="upload/baseball.png" width="80px">球隊活動照片 </p>
</div>
    
<!--上傳幻燈照片-->
  <div class="photoArea">
    <div class="teamimg">
        <button style="font-size:30px" class="addButton" style="width:auto;" id="demo2">上傳照片</button>
    </div>
  </div>

<!--彈出上傳活動照片視窗-->

<div class="w3-modal" id="newteam2">
	<div class="container_m">
		<section id="content">		
			<span class="w3-button w3-display-topright w3-large" 
		     onclick="document.getElementById('newteam2').style.display='none'">&times;</span>	
			<form action="PhotoUpload" enctype="multipart/form-data" method="post" id="my">
                <h1>新增照片</h1>
                <div class="logoupload">
	                <input type="file" id="myFile" title="上傳照片" name="p1" data-filename-placement="inside">
			        <input type="file" id="myFile" title="上傳照片" name="p2" data-filename-placement="inside">
			        <input type="file" id="myFile" title="上傳照片" name="p3" data-filename-placement="inside">
			        <input type="file" id="myFile" title="上傳照片" name="p4" data-filename-placement="inside">
		        </div>
		        <input type="submit" value="執行上傳" class="w3-button With w3-small w3-green">
        	</form>
		</section>
	</div>	
</div>

<div class="teamImgArea">

  <div class="responsive" >
    <div class="gallery" >
        <div class="image-container"><img src="upload\<%= team.getTeamId() %>_0_slides.png" alt="尚未上傳圖片"></div>
        <form action="PhotoDelete" enctype="multipart/form-data" id="myp">
        	<button class="imgDelete" type="submit" name="photo" value="p0">刪除</button>
        </form>
    </div>
  </div>

  <div class="responsive">
    <div class="gallery">
        <div class="image-container"><img src="upload\<%= team.getTeamId() %>_1_slides.png" alt="尚未上傳圖片"></div>
        <form action="PhotoDelete" enctype="multipart/form-data" id="myp">
        	<button type="submit" class="imgDelete" name="photo" value="p1">刪除</button>
        </form>
        
        <form action="photoUpload.jsp" enctype="multipart/form-data" method="post" id="myp">
        </form>
    </div>
  </div>

  <div class="responsive">
    <div class="gallery">
        <div class="image-container"><img src="upload\<%= team.getTeamId() %>_2_slides.png" alt="尚未上傳圖片"></div>
       <form action="PhotoDelete" enctype="multipart/form-data"  id="myp">
        	<button class="imgDelete" name="photo" value="p2">刪除</button>
        </form>
    </div>
  </div>

  <div class="responsive">
    <div class="gallery">
        <div class="image-container"><img src="upload\<%= team.getTeamId() %>_3_slides.png" alt="尚未上傳圖片"></div>
       <form action="PhotoDelete" enctype="multipart/form-data"  id="myp">
        	<button class="imgDelete" name="photo" value="p3">刪除</button>
        </form>
    </div>
  </div>
</div>
</div>
</div><!--ALL-div-->


<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>
</body>

<script>

function addteam(){
	  document.getElementById('id01').style.display='block';
	}

//open the LoginModal
var demo = document.getElementById("demo");
var demomodal = document.getElementById("newteam");
var demo2 = document.getElementById("demo2");

	demo.onclick = function() { 
		newteam.style.display = "block";
		console.log("newteam open");
	}
	demo2.onclick = function() { 
		newteam2.style.display = "block"; 
		console.log("demo2 open");
	}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == newteam) {
    	newteam.style.display = "none";
    	console.log("newteam close");
    }else if (event.target == newteam2) {
    	newteam2.style.display = "none";
    	console.log("demo2 close");
    }
}


//上傳按鈕API
/*
Bootstrap - File Input
======================
This is meant to convert all file input tags into a set of elements that displays consistently in all browsers.
Converts all
<input type="file">
into Bootstrap buttons
<a class="btn">Browse</a>
*/

(function($) {
$.fn.bootstrapFileInput = function() {
  this.each(function(i,elem){
    var $elem = $(elem);

    // Maybe some fields don't need to be standardized.
    if (typeof $elem.attr('data-bfi-disabled') != 'undefined') {
      return;
    }

    // Set the word to be displayed on the button
    var buttonWord = 'Browse';

    if (typeof $elem.attr('title') != 'undefined') {
      buttonWord = $elem.attr('title');
    }

    var className = '';

    if (!!$elem.attr('class')) {
      className = ' ' + $elem.attr('class');
    }

    // Now we're going to wrap that input field with a Bootstrap button.
    // The input will actually still be there, it will just be float above and transparent (done with the CSS).
    $elem.wrap('<a class="file-input-wrapper btn btn-default ' + className + '"></a>').parent().prepend($('<span></span>').html(buttonWord));
  })

  // After we have found all of the file inputs let's apply a listener for tracking the mouse movement.
  // This is important because the in order to give the illusion that this is a button in FF we actually need to move the button from the file input under the cursor. Ugh.
  .promise().done( function(){

    // As the cursor moves over our new Bootstrap button we need to adjust the position of the invisible file input Browse button to be under the cursor.
    // This gives us the pointer cursor that FF denies us
    $('.file-input-wrapper').mousemove(function(cursor) {
      var input, wrapper,
        wrapperX, wrapperY,
        inputWidth, inputHeight,
        cursorX, cursorY;

      // This wrapper element (the button surround this file input)
      wrapper = $(this);
      // The invisible file input element
      input = wrapper.find("input");
      // The left-most position of the wrapper
      wrapperX = wrapper.offset().left;
      // The top-most position of the wrapper
      wrapperY = wrapper.offset().top;
      // The with of the browsers input field
      inputWidth= input.width();
      // The height of the browsers input field
      inputHeight= input.height();
      //The position of the cursor in the wrapper
      cursorX = cursor.pageX;
      cursorY = cursor.pageY;

      //The positions we are to move the invisible file input
      // The 20 at the end is an arbitrary number of pixels that we can shift the input such that cursor is not pointing at the end of the Browse button but somewhere nearer the middle
      moveInputX = cursorX - wrapperX - inputWidth + 20;
      // Slides the invisible input Browse button to be positioned middle under the cursor
      moveInputY = cursorY- wrapperY - (inputHeight/2);

      // Apply the positioning styles to actually move the invisible file input
      input.css({
        left:moveInputX,
        top:moveInputY
      });
    });

    $('body').on('change', '.file-input-wrapper input[type=file]', function(){

      var fileName;
      fileName = $(this).val();

      // Remove any previous file names
      $(this).parent().next('.file-input-name').remove();
      if (!!$(this).prop('files') && $(this).prop('files').length > 1) {
        fileName = $(this)[0].files.length+' files';
      }
      else {
        fileName = fileName.substring(fileName.lastIndexOf('\\') + 1, fileName.length);
      }

      // Don't try to show the name if there is none
      if (!fileName) {
        return;
      }

      var selectedFileNamePlacement = $(this).data('filename-placement');
      if (selectedFileNamePlacement === 'inside') {
        // Print the fileName inside
        $(this).siblings('span').html(fileName);
        $(this).attr('title', fileName);
      } else {
        // Print the fileName aside (right after the the button)
        $(this).parent().after('<span class="file-input-name">'+fileName+'</span>');
      }
    });

  });

};

// Add the styles before the first stylesheet
// This ensures they can be easily overridden with developer styles
var cssHtml = '<style>'+
  '.file-input-wrapper { overflow: hidden; position: relative; cursor: pointer; z-index: 1; }'+
  '.file-input-wrapper input[type=file], .file-input-wrapper input[type=file]:focus, .file-input-wrapper input[type=file]:hover { position: absolute; top: 0; left: 0; cursor: pointer; opacity: 0; filter: alpha(opacity=0); z-index: 99; outline: 0; }'+
  '.file-input-name { margin-left: 8px; }'+
  '</style>';
$('link[rel=stylesheet]').eq(0).before(cssHtml);

})(jQuery);

$('input[type=file]').bootstrapFileInput();
$('.file-inputs').bootstrapFileInput();


// function addimg() {
// 	  var objdiv = document.getElementById("addModal");
// var x = document.createElement("input");
// //x.setAttribute("type", "file");
// x.setAttribute("class", "w3-section w3-padding");
// x.setAttribute("id", "myFile");
// x.setAttribute("title", "上傳照片");
// x.setAttribute("data-filename-placement", "inside");
// objdiv.appendChild(x);
// } 

</script>
</html>
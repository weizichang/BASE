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
    
<div class="container">

<!--我的球隊新增-->
  <div class="myTeamArea">
    <div class="teamimg" id="add">
        <button style="font-size:30px" class="addButton"onclick="addteam()" style="width:auto;" id="demo">
        <i class="fa fa-hand-o-right"></i>建立新球隊</button>
    </div>
  </div>

<br>

<!--頁籤-->
<nav class="navbar navbar-default" style="background-color: #d4e7f4;">
  <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#listbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span> 
  </div>
      
<div class="collapse navbar-collapse" id="listbar">
    <ul class="nav navbar-nav">
        <li ><a href="backend_team.jsp" >編輯球隊資料</a></li>
        <li><a lass="nav-link" href="backend_players.jsp">編輯球員資料</a></li>
        <li><a lass="nav-link" href="">賽程查詢/預排</a></li>
        <li><a lass="nav-link" href="">紀錄查詢/修改</a></li>
        <li><a lass="nav-link" href="">Preview</a></li>
    </ul>
</div>
</nav>

<div class="w3-modal" id="newteam">
		
	<div class="container_m">
		<section id="content">		
			<span class="w3-button w3-display-topright w3-large" 
		     onclick="document.getElementById('newteam').style.display='none'">&times;</span>	
				
			<form action="AddTeam">
				<h1>新增我的球隊</h1>
					<div>
						<input type="text" placeholder="球隊名稱" name="teamName" required/>
					</div>
					
					<div>
						<input type="text" placeholder="FB網址" name="fb" />
					</div>	
					
					<div>
						<input type="email" placeholder="E-mail" name="email" />
					</div>	
					
					<div>
						<input type="submit" value="確定" />
					</div>									
			</form>
				
		</section>
	</div>	
  			
</div>


<footer class="container-fluid text-center">
  <p>Footer Text</p>
</footer>

</div><!--ALL-div-->
</body>



<script>
//新增球隊按鈕
// function addteam(){
//   document.getElementById('id01').style.display='block';
// }

//open the Modal
var demo = document.getElementById("demo");
var demomodal = document.getElementById("newteam");

	demo.onclick = function() { 
	newteam.style.display = "block"; 
}

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == newteam) {
    	newteam.style.display = "none";
    }
}

//送出球隊按鈕
// function addOK(){
// 	 var x = document.getElementById("myp").innerHTML;
// 	 document.getElementById("add").innerHTML = x;
// }


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

</script>
</html>
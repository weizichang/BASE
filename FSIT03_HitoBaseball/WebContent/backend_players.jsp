<%@page import="com.mysql.jdbc.ResultSetRow"%>
<%@page import="fsit03_HitoBasebal.PlayerModel"%>
<%@page import="java.sql.*"%>
<%@page import="java.util.*"%>
<%@page import="fsit03_HitoBasebal.Teams"%>
<%@page import="fsit03_HitoBasebal.TeamModel"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="javax.servlet.http.HttpSession"%>

<%

session = request.getSession();
String teamId = (String)session.getAttribute("teamId");
LinkedList sqlplayers = (LinkedList)session.getAttribute("sqlplayers");

if(sqlplayers == null){
	response.sendRedirect("check.jsp");
}

if(teamId == null){
	response.sendRedirect("check.jsp");
}

Class.forName("com.mysql.jdbc.Driver");
Properties prop = new Properties();
prop.setProperty("user", "root");
prop.setProperty("password", "root");
	
Connection conn = DriverManager.getConnection("jdbc:mysql://127.0.0.1/hitobaseball", prop);
	
Statement stmt = conn.createStatement();
String sql ="select * from teams where teamId=" + teamId;
ResultSet rs =  stmt.executeQuery(sql);
TeamModel team = new TeamModel();
	
if(rs.next()) {
	team.setTeamId(teamId);
	team.setTeamname(rs.getString("teamname"));
	team.setFb(rs.getString("fb"));
	team.setEmail(rs.getString("email"));
	}

%>
    
<!DOCTYPE html>
<html>
<head>
    <title>後台-球員頁</title>
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
<!--ALLdiv-->
<div class="play">
  <!--navBar-->
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


<div class="container"><!--container-->
	<div class="myTeamArea"><!--myTeamArea-->
		<div class="responsive"><!--responsive-->
	    	<div class="gallery"><!--gallery-->
	    	
		    	<div class="image-container_logo"><!--logo照片-->
		    		<img src="upload/<%= team.getTeamId() %>_logo.png" alt="logo" style="width:200px" >
				</div><!--logo照片-->
	            
				<div class="logophotoArea"><!--上傳logo按鈕-->
	        		<button style="font-size:10px" class="addLogoButton" style="width:auto;" id="demo">
	        		<i class="fa fa-hand-o-right"></i>編輯球隊logo</button><!--待處理-->
		  		</div><!--上傳logo按鈕-->
		  		
		    </div><!--gallery-->
		</div><!--responsive-->
		
	<!--彈出視窗-->
	<div class="w3-modal" id="newteam"><!--w3-modal-->
		<div class="container_m"><!--container_m-->
			<section id="content">	
				
				<!--彈出視窗打X-->
				<span class="w3-button w3-display-topright w3-large" 
			      	  onclick="document.getElementById('newteam').style.display='none'">&times;
			    </span>	
			    
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
		</div><!--container_m-->	
	</div><!--w3-modal-->
	    
	<!--顯示球隊訊息-->
	<div class="team">
		<p><%= team.getTeamname() %><br>
		   FB網址：<%= team.getFb() %><br>
		   E-mail：<%= team.getEmail() %>
		</p>
	</div>
	
	</div><!--myTeamArea-->
	   
	  
	<!--頁籤-->
	<nav class="navbar navbar-inverse bg-inverse"><!--nav-->
	  <div class="navbar-header"><!--navbar-header-->
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#listbar">
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span> 
	  </div><!--navbar-header-->
	    
	    <!--頁籤-->
		<div class="collapse navbar-collapse" id="listbar"><!--頁籤-->
		    <ul class="nav navbar-nav">
		        <li><a href="MyTeam" >編輯球隊資料</a></li>
		        <li><a lass="nav-link" href="backend_players.jsp">編輯球員資料</a></li>
		        <li><a lass="nav-link" href="">賽程查詢/預排</a></li>
		        <li><a lass="nav-link" href="">紀錄查詢/修改</a></li>
		        <li><a lass="nav-link" href="">Preview</a></li>
		    </ul>
		</div><!--頁籤-->
	</nav><!--nav-->
		
	<!--從資料庫列出多筆資料-->
	<div><!--從資料庫列出多筆資料-->
		<table id="playertable">
		 
		 <% 
		 if(sqlplayers.size() >0){%>
		   <tr>
		     <th>背號</th>
		     <th>姓名</th></th>
		     <th>守備位置</th>
		     <th>打擊</th>
		     <th>投球</th>
		     <th>身高</th>
		     <th>體重</th>
		     <th>生日</th>
		     <th>照片</th>
		     <th></th>
		   </tr>
		 <%
		 
		 for(int i=0;i<sqlplayers.size();i++){
		 	PlayerModel player = (PlayerModel)sqlplayers.get(i);
		 %>
		 
		    <tr>
		      <td>
		      	<input name="teamName" type="text" class="inputA" value=<%= player.getNumber() %>>
		      </td>
		        
		      <td>
		      	<input type="text" class="inputB" value=<%= player.getName() %>>
		      </td>
		        
		      <td>
		      	<input type="text" class="inputC" value=<%= player.getPosition() %>>
		      </td>
		      
		      <td>
		      	<input type="text" class="inputD" value=<%= player.getHit() %>>
		      </td>
		      
		      <td>
		      	<input type="text" class="inputE" value=<%= player.getThr() %>>
		      </td>
		      
		      <td>
		      	<input type="text" class="inputF" value=<%= player.getHeight() %>>
		      </td>
		      
		      <td>
		      	<input type="text" class="inputG" value=<%= player.getWeight() %>>
		      </td>
		      
		      <td>
		      	<input type="text" class="inputH" value=<%= player.getBirthday() %>>
		      </td>
		      
		      <td class="photo_td">
		      	<img src="upload\<%= team.getTeamId() %>_logo.png" alt="photo" style="width:50px" >
		      </td>
		      
		      <td>
		      	<input type="button" class="deleteButton" value="刪除">
		      </td>
		      
		    </tr>
		    <% }}%>
		</table>
	</div><!--從資料庫列出多筆資料-->  

	<!--儲存變更按鈕--> 
 	<div class="scbutton">
    	<button type="submit" class="saveButton">儲存變更</button>
 	</div>

<hr>
	<!--儲存變更按鈕--> 
	<form action="AddPlayer2" enctype="multipart/form-data" method="GET">
		<div id="table" class=" w3-container w3-card-4 w3-light-grey w3-text-blue w3-margin"><!--id="table"--> 
			<div class="tabless"><!--tabless-->
	  		
	  		<!--新增球員按鈕-->
		  	<div class="w3-container w3-blue"><i class="fa fa-address-card" ></i>
		    </div>
	  		
	  		<div class="w3-row w3-section">
	  		<div class="w3-row-padding" >
	  		<!--背號-->
	  		<div class="w3-half">
			    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>
				<div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="背號" name="number01"/></div>
			</div>
		
			<!--姓名-->
			<div class="w3-half">
			    <div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>
				<div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="姓名" name="name01"/></div>
			</div>
			</div><!--w3-half-->
			</div>
			
			<div class="w3-row w3-section">
			<div class="w3-row-padding">
			<!--身高-->
			<div class="w3-quarter">
				<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>
				<div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="身高" name="height01"/></div>
			</div>
			    
			<!--體重-->    
			<div class="w3-quarter">
				<div class="w3-col" style="width:50px"><i class="w3-xxlarge fa fa-user" style="font-size:30px"></i></div>     
			    <div class="w3-rest"><input type="text" class="w3-input w3-border" placeholder="體重" name="weight01"/></div>
			</div> 
			
			    
			<!--生日-->
			<div class="w3-quarter">
				<div class="w3-col" style="width:50px"><i class="fa fa-calendar " style="font-size:30px"></i></div>                
				<div class="w3-rest">生日：<input type="date" class="w3-input w3-border" placeholder="生日" name="birthday01"/></div> 
			</div>
		  
		  	 <!--球員照片上傳-->
			 <div class="w3-quarter">
			 	<div class="w3-col" style="width:50px"><i class="fa fa-file-image-o " style="font-size:30px"></i></div> 
		        <div class="w3-rest">球員照片：<input title="球員照片上傳" type="file" data-filename-placement="inside"/></div> <!--照片-->
		     </div>
		     </div>
		     </div>
	   		 
	   		 <div class="w3-row">
	   		 <!--投-->
	   		 <div class="w3-col" style="width:25%">
	            <p>投球方式：
	            	<input class="w3-radio" type="radio" name="hit01" value="R"/><label>R</label>
	            	<input class="w3-radio" type="radio" name="hit01" value="L"/><label>L</label>
	            	<input class="w3-radio" type="radio" name="hit01" value="R/L"/><label>R/L</label>
	            </p>
		     </div>
	         
	          <!--打--> 
	          <div class="w3-col" style="width:25%">
	            <p>打擊方式：
		            <input class="w3-radio" type="radio" name="thr01" value="R"/><label>R</label>
		            <input class="w3-radio" type="radio" name="thr01" value="L"/><label>L</label>
		            <input class="w3-radio" type="radio" name="thr01" value="R/L"/><label>R/L</label>
		        </p>
		      </div> 
		      </div>
		      
		      <div class="w3-row">
	      	  <!--守備位置-->
		      <div class="w3-col" style="width:100%">
		          <p>守備位置：
			          <input class="w3-check" type="checkbox" name="position01" value="投手"/>投手
			          <input class="w3-check" type="checkbox" name="position01" value="捕手"/>捕手
			          <input class="w3-check" type="checkbox" name="position01" value="一壘手"/>一壘手
			          <input class="w3-check" type="checkbox" name="position01" value="二壘手"/>二壘手
			          <input class="w3-check" type="checkbox" name="position01" value="三壘手"/>三壘手
			          <input class="w3-check" type="checkbox" name="position01" value="游擊手"/>游擊手
			          <input class="w3-check" type="checkbox" name="position01" value="右外野"/>右外野
			          <input class="w3-check" type="checkbox" name="position01" value="中外野"/>中外野
			          <input class="w3-check" type="checkbox" name="position01" value="左外野"/>左外野
		          </p>
		      </div>
		      </div>
	          
	          <!--隱藏欄位-->
	      	  <div><input type="hidden" name="hidden" vale="hidden"/></div>
	      
	           <!--刪除表單-->
		       <div> 
		          <button class="w3-button w3-blue w3-round" >刪除</button>
		       </div><br>
		
			</div><!--tabless-->
		</div><!--id="table"--> 
	
	    <!--兩個案鈕-->
		<button class="addbutton " type="submit">儲存新增</button>
		<button class="addsection">多筆新增</button> 
	</form>

</div><!--container-->

	<footer class="container-fluid text-center">
	  <p>Footer Text</p>
	</footer>

</div><!--ALL-div-->


<script>
//open the LoginModal
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

//var original = $('.tabless').last().find(':checked');
var template = $('#table .tabless:first').clone();
var sectionsCount = 1;

	$('body').on('click', '.addsection', function() {
    	sectionsCount++;
   	 var section = template.clone().find(':input').each(function(){
   	 var newId = this.id + sectionsCount;
    	if(newId < 10){
    		newId = "0" + (newId).toString();
    	}
    	console.log(newId);
        $(this).attr('for', newId);
        
        //name++
	    if ($(this).attr('type') == 'radio'&& $(this).prop('name') == 'hit01') {
	        $(this).prop('name',"hit"+newId);
	    } else if ($(this).attr('type') == 'radio'&& $(this).prop('name') == 'thr01'){
	    	$(this).prop('name',"thr"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'number01'){
	    	$(this).prop('name',"number"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'name01'){
	    	$(this).prop('name',"name"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'height01'){
	    	$(this).prop('name',"height"+newId);
	    } else if ($(this).attr('type') == 'text'&& $(this).prop('name') == 'weight01'){
	    	$(this).prop('name',"weight"+newId);
	    } else if ($(this).attr('type') == 'date'&& $(this).prop('name') == 'birthday01'){
	    	$(this).prop('name',"birthday"+newId);
	    } else if ($(this).attr('type') == 'checkbox'&& $(this).prop('name') == 'position01'){
	    	$(this).prop('name',"position"+newId);
	    } else{
	        $(this).val('');
	    }
    	}).end().appendTo('#table');
   		 return false;
	});

//remove
$('#table').on('click', '.remove', function() {
    //fade out section
    $(this).parent().fadeOut(100, function(){
        //remove parent element (main section)
        $(this).parent().parent().empty();
        return false;
    });
    return false;
});

</script>

<!--checkboxAPI-->
<script type="text/javascript">

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

</body>
</html>
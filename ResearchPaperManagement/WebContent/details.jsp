<html>
<head>
	<meta charset="UTF-8">
	
	<link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/style_from.css" type="text/css">
</head>
<body>
	<div class="border">
		<div id="bg" style="background-size:75% 100%; ">
			background
		</div>
		<div class="page">
			<div class="sidebar">
				<a href="http://localhost:8080/ResearchPaperManagement/index.jsp" id="logo"><img src="images/logo.png" alt="logo"></a>
				<ul>
					<li class="selected">
						<a href="http://localhost:8080/ResearchPaperManagement/index.jsp">Home</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/details.jsp">Add Details</a>
					</li>
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/browse.jsp">Browse</a>
					</li>
					
					<li>
						<a href="http://localhost:8080/ResearchPaperManagement/admin.jsp">Admin</a>
					</li>
					
					<%
						for (Cookie cookie : request.getCookies()) {
							if(cookie.getName().equals("username")) {
					%>
					<li>
						<a href="redirect.jsp">Logout</a>
					</li>
					<% } } %>
				</ul>
				
			</div>
			<div class="body">
				<div class="about">
					<h2>Add Details</h2>
                    
                     <form action="Fetch" method="post" enctype="multipart/form-data">
      
        <h1>Paper/Book Details</h1>
        
        <fieldset>
          <legend><span class="number">1</span>Personal info</legend>
          
            <label for="Academic_year" >Academic Year:</label>
            <select id="year" name="academic_year"></select>
            <label>Are You A Faculty??</label>

			<input type="checkbox" class="chkbox" id="f" onchange="myfucntion()" value="faculty" name="isfaculty"><label class="light" for="yes">Yes</label>
            <input type="checkbox" class="chkbox" id="s" onchange="myfucntion()" value="student" name="isfaculty"><label class="light" for="no">No</label><br>
                     
            <label  id="number"></label>
          <input type="number" name="number">
            <label  id="designation"></label>
          <input type="text" name="designation">
           <label  id="name"></label>
          <input type="text" name="name">
        </fieldset>
        
        <fieldset>
        
          <legend><span class="number">2</span>Paper Details</legend>
          
          <label for="bio">Paper Title</label>
	          <input id="" type="text" name="papertilte" />
	        <label for="job">Level:</label>
	       
	            <input type="checkbox" id="" value="National" name="level"><label class="light" for="">NATIONAL</label><span>    </span>
	            <input type="checkbox" id="" value="International" name="level"><label class="light" for="">INTERNATIONAL</label><br>
	          
	        <br>
	          <label>Type:</label>
	          <input type="checkbox" value="Journal"  name="type"><label class="light" >Journal</label>
	            <input type="checkbox" value="Conference" name="type"><label class="light" >Conference</label>
	          <input type="checkbox" value="Book" name="type"><label class="light" >Book</label><br><br>
	             <label >Name of Conference/Journal.</label>
	          <input id="" type="text" name="conf/journal"><br>
	            <label >Location.</label>
	          <input id="" type="text" name="Location"><br>
	            <label >Date.</label>
	          <input id="" type="date" name="date"><br>
	            <label >Domain.</label>
	         <select name="domain">
	             <option>Image Processing</option>
	             <option>Artificial Intelligence and Soft Computing</option>
	             <option>Cyber and Network Security</option>
	             <option>Cloud Computing</option>
	             <option>Software Engineering</option>
	             <option>Web Technology</option>
	                     
	            </select><br>
	            <label >Issue.</label>
	          <input id="" type="text" name="issue"><br>
	            <label >Volume.</label>
	          <input id="" type="text" name="volume"><br>
	            <label >ISSN/ISBN.</label>
	          <input id="" type="text" name="issn/isbn"><br>
	          <label >Pages.</label>
	          <input id="" type="number" name="pages"><br>
	            
	        </fieldset>
	        <fieldset>
	        
	            <legend><span class="number">3</span>Upload</legend>
	            <label >Select a file(.pdf):</label><br>
	          <input type="file" name="paper"/>
	            <br>
	        <button type="submit">Submit</button>
	        </fieldset>
	      </form> 
					</div>
				</div>
			</div>
		</div>
	</body>
	       <script >
	           
	        var start = 2000;
	var end = 2050;
	var options = "";
	for(var year = start ; year <=end; year++){
	  options += "<option>"+ year+"-"+(year+1) +"</option>";
	}
	document.getElementById("year").innerHTML = options;
	        console.log(options);
	                     
	    </script>
	    <script type="text/javascript">
	    function myfucntion()
        {    console.log("yolo");
     
               var checkedValue = document.querySelector('.chkbox:checked').value; 
                if(checkedValue=='faculty')
             {
                	document.getElementById("s").checked = false;
                	document.getElementById("f").checked = true;
                	document.getElementById("number").innerHTML="Faculty No.";
              document.getElementById("designation").innerHTML="Designation.";   
              document.getElementById("name").innerHTML="Faculty Name.";
              
             }
                if(checkedValue=='student')
             {
                	document.getElementById("f").checked = false;
                	document.getElementById("s").checked = true;

               document.getElementById("number").innerHTML="GR no.";
              document.getElementById("designation").innerHTML="Year(SE/TE/BE).";
              document.getElementById("name").innerHTML="Student Name.";
             }
             if(checkedValue==null)
             {
               document.getElementById("number").innerHTML="";
              document.getElementById("designation").innerHTML="";       
             }
        }

	    </script>
	    <script>
	    	function validateForm() {
	    	var x = document.forms["myForm"]["fname"].value;
	    	if (x == null || x == "") {
	        	alert("Name must be filled out");
	        return false;
	    }
	}
	     </script>
	</html>
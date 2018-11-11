	var jun_editor = document.getElementsByClassName("jun_editor");
	var jun_width = 500;
	var jun_height = 500;
	var image_index = 1;
	jun_editor[0].style.width = jun_width+"px";
	jun_editor[0].style.height = jun_height+"px";
	
	var image_upload_html = "";	// 이미지 업로드 팝업창
	image_upload_html += "<div id='image_upload_body' style='width:800px; height:600px; display:none; background:white; position:fixed; top:10%; left:20%; border:2px solid black; outline:0; padding:0; margin:0;'>";
 	image_upload_html += 	"<div style='width:100%; height:30px; background:blue; position:relative; top:0; right:0;'>";
	image_upload_html += 		"<div style='position:absolute; right:0; width:30px; height:30px; color:white; font-weight:bolder; line-height:30px	'>";
	image_upload_html += 			"X";
	image_upload_html += 		"</div>";
	image_upload_html += 	"</div>"; 
	image_upload_html += 	"<h1>이미지 업로드</h1>"; 
	image_upload_html += 	"<div id='add_image_body' style='width:90%; height:400px; border:1px solid black; position:relative; left:5%; text-align:left;'>";
	image_upload_html += 		"<input type='file' name='image_file' id='image_file"+image_index+"' class='image_file' param='"+image_index+"' style='display:none;'>";
	image_upload_html +=		"<label id='image_file_label"+image_index+"' for='image_file"+image_index+"' param='"+image_index+"' style='width:70px; height:70px; display:inline-block; position:relative; border:1px solid black; line-height:70px; text-align:center; margin:5px 5px; cursor:pointer'>";
	image_upload_html +=			"이미지 추가";
	image_upload_html +=		"</label>";
	image_upload_html += 	"</div>";
	image_upload_html += 	"<div style='width:100%; height:170px;'>";
	image_upload_html += 		"<input type='button' value='이미지 등록' id='btn' class='st_button'>";
	image_upload_html += 	"";
	image_upload_html += 	"";
	image_upload_html += 	"";
	image_upload_html += 	"</div>";
	image_upload_html += "</div>";
	
	  
	var jun_editor_html = "";	// textarea
	jun_editor_html += "<div id='add_image_btn' style='width:"+jun_width+"px; height:"+(jun_height-470)+"px; border:1px solid black;'>";
	jun_editor_html += 		"<div style='width:30px; height:100%; cursor:pointer'>사진첨부</div>";
	jun_editor_html += "";
	jun_editor_html += "";
	jun_editor_html += "";
	jun_editor_html += "</div>";
	jun_editor_html += "<div contentEditable='true'style='width:"+jun_width+"px; height:"+jun_height+"px; border:1px solid black; overflow-y:scroll;'>";
	jun_editor_html += 		"";
	jun_editor_html +=	 	"";
	jun_editor_html +=		"";
	jun_editor_html += "</div>";
	
	var last_html = image_upload_html+jun_editor_html
	jun_editor[0].innerHTML = last_html
	
	//이미지 업로드 이벤트 시작
	
	var image_arr = new Array();
	document.getElementById("add_image_btn").addEventListener('click',function(){	//이미지 업로드 팝업 띄우기
		document.getElementById("image_upload_body").style.display = "block";
	})
	document.getElementById("image_file_label"+image_index).addEventListener('click',function(){
		var exit = 0;
		var param = this.getAttribute("param")
		for(var i=0; i<image_arr.length; i++){
			if(image_arr[i]==param){
				exit = 1;
				console.log("!!!")
				return false;
				
			}
		}
		if(exit == 1){
			return false;
		}
	})
	function change_method(){		// 파일 선택했을때 실행되는 메소드
		document.getElementById("image_file"+image_index).addEventListener('change',function(){		// 이미지 선택시
			var param = this.getAttribute("param")
			console.log(param)
			var url = URL.createObjectURL(event.target.files[0])
			var html = "";
			document.getElementById("image_file_label"+param).setAttribute("for","x")
			html += "<img src='"+url+"' style='width:100%; height:100%;'>";
			html += "<div style='width:100%; height:10px; position:absolute; top:0; right:0; color:white; background:rgba(0,0,0,0.5); cursor:pointer;'>";
			html += 	"<div id='view_image"+param+"' class='view_image' param='"+param+"' style='width:10px; height:10px; position:absolute; right:0; top:0; line-height:10px; font-weight:bolder;'>";
			html += 		"X";
			html += 	"</div>";
			html += "</div>";
			document.getElementById("image_file_label"+param).innerHTML = html
			image_arr.push(param)
			image_index++;

			var add_file = document.createElement("input");
			add_file.setAttribute("type","file")
			add_file.id = "image_file"+image_index;
			add_file.className = "image_file";
			add_file.name= " image_file";
			add_file.setAttribute("param",image_index);
			add_file.style = "display:none;"
			document.getElementById("add_image_body").appendChild(add_file)
			
			var add_file_label = document.createElement("label")
			add_file_label.setAttribute("for","image_file"+image_index);
			add_file_label.className = "image_file_label";
			add_file_label.setAttribute("param",image_index);
			add_file_label.style = "width:70px; height:70px; display:inline-block; position:relative; border:1px solid black; line-height:70px; text-align:center; margin:5px 5px; cursor:pointer"
			document.getElementById("add_image_body").appendChild(add_file_label)
			console.log("~~")
			view_image_delete()
		})
	}
	
	function view_image_delete(){		// 이미지에서 x버튼 눌렀을때 실행되는 메소드
		var view_image = document.getElementsByClassName("view_image")
		for(var i=0; i<view_image.length; i++){
			view_image[i].addEventListener('click',function(){
				var param = this.getAttribute("param");
				document.getElementById("image_file_label"+param).remove();   
				document.getElementById("image_file"+param).remove();
			})
		}
	}
	function ggg(){
		document.getElementById("image_file"+image_index).addEventListener('change',function(){		// 이미지 선택시
			alert("~~~")
			var param = this.getAttribute("param")
			console.log(param)
			var url = URL.createObjectURL(event.target.files[0])
			var html = "";
			document.getElementById("image_file_label"+param).setAttribute("for","x")
			html += "<img src='"+url+"' style='width:100%; height:100%;'>";
			html += "<div style='width:100%; height:10px; position:absolute; top:0; right:0; color:white; background:rgba(0,0,0,0.5); cursor:pointer;'>";
			html += 	"<div id='view_image"+param+"' class='view_image' param='"+param+"' style='width:10px; height:10px; position:absolute; right:0; top:0; line-height:10px; font-weight:bolder;'>";
			html += 		"X";
			html += 	"</div>";
			html += "</div>";
			document.getElementById("image_file_label"+param).innerHTML = html
			image_arr.push(param)
			image_index++;
			var add_file = document.createElement("input");
			add_file.setAttribute("type","file")
			add_file.id = "image_file"+image_index;
			add_file.className = "image_file";
			add_file.name= " image_file";
			add_file.setAttribute("param",image_index);
			add_file.style = "display:none;"
			document.getElementById("add_image_body").appendChild(add_file)
			
			var add_file_label = document.createElement("label")
			add_file_label.setAttribute("for","image_file"+image_index);
			add_file_label.className = "image_file_label";
			add_file_label.id = "image_file_label";
			add_file_label.setAttribute("param",image_index);
			add_file_label.style = "width:70px; height:70px; display:inline-block; position:relative; border:1px solid black; line-height:70px; text-align:center; margin:5px 5px; cursor:pointer"
			document.getElementById("add_image_body").appendChild(add_file_label)
			alert("~~~")
			view_image_delete()
		})
	}
	document.getElementById("image_file"+image_index).addEventListener('change',function(){		// 이미지 선택시
		alert("~~~")
		var param = this.getAttribute("param")
		console.log(param)
		var url = URL.createObjectURL(event.target.files[0])
		var html = "";
		document.getElementById("image_file_label"+param).setAttribute("for","x")
		html += "<img src='"+url+"' style='width:100%; height:100%;'>";
		html += "<div style='width:100%; height:10px; position:absolute; top:0; right:0; color:white; background:rgba(0,0,0,0.5); cursor:pointer;'>";
		html += 	"<div id='view_image"+param+"' class='view_image' param='"+param+"' style='width:10px; height:10px; position:absolute; right:0; top:0; line-height:10px; font-weight:bolder;'>";
		html += 		"X";
		html += 	"</div>";
		html += "</div>";
		document.getElementById("image_file_label"+param).innerHTML = html
		image_arr.push(param)
		image_index++;
		var add_file = document.createElement("input");
		add_file.setAttribute("type","file")
		add_file.id = "image_file"+image_index;
		add_file.className = "image_file";
		add_file.name= " image_file";
		add_file.setAttribute("param",image_index);
		add_file.style = "display:none;"
		document.getElementById("add_image_body").appendChild(add_file)
		
		var add_file_label = document.createElement("label")
		add_file_label.setAttribute("for","image_file"+image_index);
		add_file_label.className = "image_file_label";
		add_file_label.id = "image_file_label";
		add_file_label.setAttribute("param",image_index);
		add_file_label.style = "width:70px; height:70px; display:inline-block; position:relative; border:1px solid black; line-height:70px; text-align:center; margin:5px 5px; cursor:pointer"
		document.getElementById("add_image_body").appendChild(add_file_label)
		alert("~~~")
		ggg()
		view_image_delete()
	})

		document.getElementById("btn").addEventListener('click',function(){
			var f = document.getElementsByClassName("image_file")
			for(var i=0; i<f.length; i++){
				var k = f[i].value
				console.log(k)
				alert(k)
			}
		})

		

/**
 * 
 */

	function isNull(param){					//파라미터 값이 null일때 true 반환
		if(!param || param=='' || param== null || param=='undefind'){
			return true;
		}else{
			return false;
		}
	}
	function isEmpty(param){
		var exit = 1;
		$.each(param,function(i){
			var arr_el = param[i];
			if(exit == 1){
				if(isNull(arr_el[0].val())){
					if(arr_el[2] == 'text'){
						var html = arr_el[1]+" 입력해주세요.";
					}else if(arr_el[2] == 'select'){
						var html = arr_el[1]+" 선택해주세요.";
					}
					
					alert(html);
					arr_el[0].focus();
					exit = 0;						//빈값일 경우 exit 변수 값 0으로 아래 if문 때문에 모든 each를 빠져나간다.
					return false;
				}else{
					exit = 1;
				}
			}

		})
		if(exit == 1){
			return false					//false일떄 submit
		}else{
			return true
		}
		
	}
	
	function isEmpty2(jsonData){
		var exit = 1;
		$.each(jsonData, function(i){
			var arr_el = jsonData[i];
			if(!arr_el[0].val()){
				if(arr_el[1] == 'text'){
					var html = "필수입력 사항을 입력해주세요.";
				}else if(arr_el[1] == 'select'){
					var html = "필수 사항을 선택해주세요.";
				}
				
				alert(html);
				arr_el[0].focus();
				exit = 0;
				return false;
			}else{
				exit = 1;
			}
		})
		if(exit == 1){
			return true;
		}else{
			return false;
		}
	}
	
	function ajax(url,type,jsonData,dataType,success){
		$.ajax({
			url : url,
			type : type,
			data : jsonData,
			dataType : dataType,
			success : function(data){
				success
			}
		})
	}
	
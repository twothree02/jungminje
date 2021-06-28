function daumPost() {
		//new daum.Postcode().open();	//창을 띄워주는 역할만 함
		new daum.Postcode({
			oncomplete:function(data){
				//도로명일 경우 R, 지번을 경우 J의 값을 지니고 있음
				console.log('data.userSelectedType : ' + data.userSelectedType);	//타입
				console.log('data.roadAddress : ' + data.roadAddress);				//도로명주소
				console.log('data.jibunAddress : ' + data.jibunAddress);			//지번주소
				console.log('data.zoncode : ' + data.zonecode);						//우편번호
				
				var addr = "";
				if(data.userSelectedType == 'R') {	//도로명일 경우 R
					addr = data.roadAddress;
				}
				else {	//지번일 경우 J
					addr = data.jibunAddress;
				}
				document.getElementById("zone").value = data.zonecode;
				$("#addr2").val(addr);
				$("#addr3").focus();
			}
		}).open();
	}

function check(){
	var f = document.frm;

	if(f.custname.value.length == 0){
		alert("이름을 입력해주세요!");
		f.custname.focus(); //name=custname 에 커서창이 가게한다.
		return false;
	}
	if(f.phone.value.length < 13){
		alert("핸드폰 번호를 입력해주세요!");
		f.phone.focus();
		return false;
	}
	if(f.joindate.value.length < 10){
		alert("날짜를 입력해주세요.");
		f.joindate.focus();
		return false;
	}
	if(f.grade.value.length == 0){
		alert("고객등급을 입력해주세요.");
		f.grade.focus();
		return false;
	}
	if(f.city.value.length == 0){
		alert("도시코드를 입력하세요");
		f.city.focus();
		return false;
	}
	f.submit();
}
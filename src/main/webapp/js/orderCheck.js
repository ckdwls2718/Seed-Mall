function order_check() {
	if (!$('#oname').val()) {
		alert('받는분을 입력하세요.');
		$('#oname').focus();
		return false;
	}
	if (!$('#ohp1').val()) {
		alert('연락처를 입력하세요.');
		$('#ohp1').focus();
		return false;
	}
	if (!$('#ohp2').val()) {
		alert('연락처를 입력하세요.');
		$('#ohp2').focus();
		return false;
	}
	if (!$('#ohp3').val()) {
		alert('연락처를 입력하세요.');
		$('#ohp3').focus();
		return false;
	}
	if (!$('#oaddr1').val()) {
		alert('주소를 입력하세요.');
		$('#oaddr1').focus();
		return false;
	}
	return true;
}




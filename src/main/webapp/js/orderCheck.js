function order_check() {
	if (!isKor(frm.oname)) {
		alert('이름은 한글이름만 가능해요');
		frm.oname.select();
		return;
	}
	if (!isMobile(frm.ohp1, frm.ohp2, frm.ohp3)) {
		alert('형식에 맞지 않습니다.');
		frm.hp1.select();
		return;
	}
	frm.submit();
}

function isKor(input) {
	let val = input.value;
	let pattern = /^[가-힣]+$/; // ^ : 시작, $ : 끝, + : 패턴이 한 번 이상 반복된다는 뜻
	let b = pattern.test(val); // 정규식 패턴에 맞으면 true, 틀리면 false

	return b;
}

function isMobile(input1, input2, input3) {
	let val = input1.value + "-" + input2.value + "-" + input3.value;
	let pattern = /\b(010|011)[-]\d{3,4}[-]\d{4}\b/;
	let b = pattern.test(val);

	return b;
}
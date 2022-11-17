$(document).ready(function() {
	var exp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/ // ^ : 시작, $ : 끝
	$("#sendBtn").click(function() {

		if ($("#name").val() == "") {
			alert("이름을 입력하세요.");
			$("#name").focus();
			return false;
		}

		if ($("#userid").val() == "") {
			alert("아이디를 입력하세요.");
			$("#userid").focus();
			return false;
		}

		if ($("#pwd").val() == "") {
			alert("비밀번호를 입력하세요.");
			$("#pwd").focus();
			return false;
		}

		if ($("#pwd").val() != $("#pwd_check").val()) {
			alert("비밀번호가 일치하지 않습니다.")
			$("#pwd_check").focus();
			return false;
		}

		if ($("#email").val() == "") {
			alert("이메일을 입력하세요.");
			$("#email").focus();
			return false;
		}
		/*if(!$("#phone").val().match(exp)){
			alert("전화번호 형식이 맞지 않습니다.");
			$("#phone").focus();
			return false;
		}*/ // exp 함수를 뒤에 쓸 경우

		if (!exp.test($("#phone").val())) {
			alert("전화번호 형식이 맞지 않습니다.");
			$("#phone").focus();
			return false;
		} // exp 함수를 앞에 쓸 경우

		$("#frm").submit();
	}) // sendBtn

	$("#idCheckBtn").click(function() {
		window.open("idCheck.jsp", "", "width=700 height=400");
	}) // "idCheckBtn" 클릭하면 팝업인 idCheck.jsp 띄우기

	$("#idUseBtn").click(function() {
		if ($("#userid").val() == "") {
			alert("아이디를 입력하세요.");
			return;
		}
		$.ajax({
			type: 'post',
			url: "idCheckPro.jsp",
			data: { "userid": $("#userid").val() },
			success: function(resp) {
				if (resp.trim() == "yes") {
					alert("사용 가능한 아이디입니다.")
					$(opener.document).find("#userid").val($("#userid").val())
					self.close()
				} else {
					alert("사용 불가능한 아이디입니다.")
					$("#userid").val("")
					$("#userid").focus()
				}
			},
			error: function(e) {
				alert(e + "error")
			}
		})
	})
}) // document

// 삭제
function del(userid,mode) {
	if(mode == "관리자"){
		alert("관리자는 삭제할 수 없습니다.")
		return;
	}
	if (confirm('정말 삭제할까요?')) {
		$.getJSON("memberDeletePro.jsp", {
			"userid": userid
		}, function(resp) {
			// alert(resp.countObj.count)
			var str = "";
			var str2 = "";
			$.each(resp.jarrObj, function(key, val) {
				if (val.admin == 0) {
					str2 = "일반회원";
					str += "<tr>"
					str += "<td>" + val.name + "</td>"
					str += "<td>" + val.userid + "</td>"
					str += "<td>" + val.phone + "</td>"
					str += "<td>" + val.email + "</td>"
					str += "<td>" + str2 + "</td>"
					str += "<td><a href = javascript:del('" + val.userid + "')>삭제</a></td>"
					str += "</tr>"
				} else {
					str2 = "관리자";
					str += "<tr>"
					str += "<td>" + val.name + "</td>"
					str += "<td>" + val.userid + "</td>"
					str += "<td>" + val.phone + "</td>"
					str += "<td>" + val.email + "</td>"
					str += "<td>" + str2 + "</td>"
					str += "<td></td>"
					str += "</tr>"
				}
			}) // callback 함수에서도 관리자를 삭제하지 못하게 함.
			
			/*
			var str = "";
			$.each(resp.jarrObj, function(key, val) {				
					str += "<tr>"
					str += "<td>" + val.name + "</td>"
					str += "<td>" + val.userid + "</td>"
					str += "<td>" + val.phone + "</td>"
					str += "<td>" + val.email + "</td>"
					str += "<td>" + val.admin + "</td>"
					str += "<td><a href = javascript:del('" + val.userid + "','" + val.admin+"')>삭제</a></td>"
					str += "</tr>"
				} callback 함수에서도 관리자를 삭제하지 못하게 하는 또다른 방법.*/


			$("table tbody").html(str);
			$("#cntSpan").text(resp.countObj.count)
		} // callback 함수
		); // getJSON
	} //if
} // del





















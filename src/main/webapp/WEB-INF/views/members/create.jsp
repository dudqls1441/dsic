<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="user-scalable=yes, initial-scale=1.0, maximum-scale=3.0, width=device-width" />
<title>Insert title here</title>
<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<!-- Favicon-->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script type="text/JavaScript">
	var idFlag = false;
	$(function() { // 자동 실행
		// id가 'btn_checkID'인 태그를 찾아 'click' 이벤트 처리자(핸들러)로 checkID 함수를 등록
		$('#btnCheckID').on('click', checkID);
		$('#btnSend').on('click', send);
		$('#btnDaumPostcode').on('click', DaumPostcode); // 다음 우편 번호
	});

	function checkID() {
		console.log("버튼 눌림");
		var frm = $('#frm'); // id가 frm인 태그 검색
		var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
		var params = '';
		var msg = '';
		console.log(id);

		if ($.trim(id).length == 0) { // id를 입력받지 않은 경우
			msg = '· ID를 입력하세요.<br>· ID 입력은 필수 입니다.<br>· ID는 3자이상 권장합니다.';
			 $('#modal_content').attr('class', 'alert alert-danger'); // Bootstrap CSS 변경
			 $('#modal_title').html('ID 중복 확인'); // 제목 
			 $('#modal_content').html(msg); // 내용
			 $('#btn_close').attr("data-focus", "id"); // 닫기 버튼 클릭시 id 입력으로 focus 이동
			 $('#modal_panel').modal(); // 다이얼로그 출력 
			console.log("mse  : " + msg);
			return false;
		} else {
			params = "id="+ id;
			$.ajax({
				url : './checkId.do', // spring execute
				type : 'get', // post
				cache : false, // 응답 결과 임시 저장 취소
				async : true, // true: 비동기 통신
				dataType : 'json', // 응답 형식: json, html, xml...
				data : params, // 데이터
				success : function(rdata) { // 서버로부터 성공적으로 응답이 온경우
					// alert(rdata);
					var msg = "";
					if (rdata.cnt > 0) {
						idFlag = false;
						console.log("idFlag--->  : " +idFlag);
						$('#modal_content').attr('class',
								'alert alert-danger'); // Bootstrap CSS 변경
						msg = "이미 사용중인 ID 입니다.";
						$('#btn_close').attr("data-focus", "id"); // id 입력으로 focus 이동
					} else {
						idFlag = true;
						console.log("idFlag--->  : " +idFlag);
						$('#modal_content').attr('class',
								'alert alert-success'); // Bootstrap CSS 변경
						msg = "사용 가능한 ID 입니다.";
						$('#btn_close').attr("data-focus", "pw"); // pw 입력으로 focus 이동
						// $.cookie('checkId', 'TRUE'); // Cookie 기록
					}
					$('#modal_title').html('ID 중복 확인'); // 제목 
					$('#modal_content').html(msg); // 내용
					$('#modal_panel').modal(); // 다이얼로그 출력
				},
				// Ajax 통신 에러, 응답 코드가 200이 아닌경우, dataType이 다른경우 
				error : function(request, status, error) { // callback 함수
					console.log(error);
				}
			});
		}
	}

	function send() { // 회원 가입 처리
		if(!validation()){
			return false;
		}else{
			console.log("send 눌림2");
			$('#frm').submit();
		}
		console.log("send 눌림");
		$('#frm').submit();
	}
	function validation() {
		var frm = $('#frm'); // id가 frm인 태그 검색
		var id = $('#id', frm).val(); // frm 폼에서 id가 'id'인 태그 검색
		var name = $('#name', frm).val(); 
		var pw = $('#pw', frm).val(); 
		var nickname = $('#nickname', frm).val(); 
		var phone = $('#phone', frm).val(); 
		if(id.length == 0){
			console.log("ID를 입력해주세요 ");
			msg = 'ID를 입력해주세요 .<br>';
			$('#modal_title').html('ID 입력 확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			$('#id').focus();
			return false;
		}
		if(name.length == 0){
			console.log("성명을 입력해주세요 ");
			msg = '성명을 입력해주세요 .<br>';
			$('#modal_title').html('성명 입력 확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			$('#name').focus();
			return false;
		}
		if(nickname.length == 0){
			console.log("닉네임을 입력해주세요 ");
			msg = '닉네임을 입력해주세요 .<br>';
			$('#modal_title').html('닉네임 입력 확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			$('#nickname').focus();
			return false;
		}
		if(phone.length == 0){
			console.log("전화번호를 입력해주세요 ");
			msg = '전화번호를 입력해주세요 .<br>';
			$('#modal_title').html('전화번호 입력 확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			$('#phone').focus();
			return false;
		}
		if(idFlag == false){
			console.log("ID중복확인해주세요 ");
			msg = 'ID중복확인해주세요.<br>';
			$('#modal_title').html('ID 중복확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			$('#id').focus();
			return false;
		}
		if(pw.length == 0){
			console.log("패스워드를 입력해주세요 ");
			msg = '패스워드를 입력해주세요.<br>';
			$('#modal_title').html('패스워드 입력 확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			$('#pw').focus();
			return false;
		}
		// 패스워드를 정상적으로 2번 입력했는지 확인
		if ($('#pw').val() != $('#pw2').val()) {
			console.log("패스워드가 다릅니다.");
			msg = '입력된 패스워드가 일치하지 않습니다.<br>';
			msg += "패스워드를 다시 입력해주세요.<br>";
			$('#modal_title').html('패스워드 일치 여부  확인'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경
			return false; // submit 중지
		}
		if(!checkPw()){
			console.log("비밀번호 정규식");
			msg = '비밀번호 정규식을 맞추세요<br>';
			$('#modal_title').html('비밀번호 정규식'); // 제목 
			$('#modal_content').html(msg); // 내용
			$('#modal_panel').modal(); // 다이얼로그 출력
			$('#modal_content').attr('class', 'alert alert-danger'); // CSS 변경	
			return false;
		}
		
		return true;
	}
	function checkPw() {
		var frm = $('#frm'); 
		var pw = $('#pw', frm).val();
		var flag = false;
		// 비밀번호 규칙 정규식
		// : 숫자, 특문 각 1회 이상, 영문은 2개 이상 사용하여 8자리 이상 입력
		var regExpPw = /(?=.*\d{1,50})(?=.*[~`!@#$%\^&*()-+=]{1,50})(?=.*[a-zA-Z]{2,50}).{8,50}$/;
		if(pw.match(regExpPw) == null){
			console.log("비밀번호 정규식 위반");
			return false;
		}else{
			console.log("비밀번호 정규식 통과");
			return true;
		}
	}
	function keyevent() {
		var targetId = event.target.id;
		var id = $('#id').val();
		var pw = $('#pw').val();
		var pw2 = $('#pw2').val();
		
		switch (targetId) {
		case "id":
			console.log("id눌림");
			idFlag = false;
			break;
		case "pw":
			console.log("pw2 눌림");
			checkPw();
			break;
		case "pw2":
			console.log("pw2 눌림");
			if(pw == pw2){
				console.log("pw pw2 같음");
			}else{
				console.log("pw pw2 다름");
			}
			break;
		}
	}
	</script>
</head>
<body>
	<!-- ******************** Modal 알림창 시작 ******************** -->
	<div id="modal_panel" class="modal fade" role="dialog">
		<div class="modal-dialog">
			<!-- Modal content-->
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal">×</button>
					<h4 class="modal-title" id='modal_title'></h4>
					<!-- 제목 -->
				</div>
				<div class="modal-body">
					<p id='modal_content'></p>
					<!-- 내용 -->
				</div>
				<div class="modal-footer">
					<button type="button" id="btnClose" data-focus=""
						class="btn btn-default" data-dismiss="modal">닫기</button>
				</div>
			</div>
		</div>
	</div>
	<!-- ******************** Modal 알림창 종료 ******************** -->
	<DIV class='title_line'>회원 가입</DIV>

	<DIV class='content_body'>

		<ASIDE class="aside_right">
			<A href="javascript:location.reload();">새로고침</A> <span
				class='menu_divide'>│</span> <A href='./create.do'>회원 가입</A> <span
				class='menu_divide'>│</span> <A href='./list.do'>목록</A>
		</ASIDE>

		<div class='menu_line'></div>
		<FORM name='frm' id='frm' method='POST' action='./create.do'
			class="form-horizontal">

			<div class="form-group">
				<label for="id" class="col-md-2 control-label"
					style='font-size: 0.9em;'>아이디*</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='id' id='id' value=''
						required="required" style='width: 30%;' placeholder="아이디"
						onkeyup="keyevent(this);" autofocus="autofocus">
					<button type='button' id="btnCheckID" class="btn btn-info btn-md">중복확인</button>
					<SPAN id='id_span'></SPAN>
					<!-- ID 중복 관련 메시지 -->
				</div>
			</div>

			<div class="form-group">
				<label for="pw" class="col-md-2 control-label"
					style='font-size: 0.9em;'>패스워드*</label>
				<div class="col-md-10">
					<input type='password' class="form-control" name='pw' id='pw'
						value='' maxlength="20" onkeyup="keyevent(this);"
						required="required" style='width: 30%;' placeholder="패스워드">
				</div>
			</div>

			<div class="form-group">
				<label for="pw2" class="col-md-2 control-label"
					style='font-size: 0.9em;'>패스워드 확인*</label>
				<div class="col-md-10">
					<input type="password" class="form-control" name='pw2' id='pw2'
						value='' maxlength="40" onkeyup="keyevent(this);"
						required="required" style='width: 30%;' placeholder="패스워드">
				</div>
			</div>

			<div class="form-group">
				<label for="name" class="col-md-2 control-label"
					style='font-size: 0.9em;'>성명*</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='name' id='name'
						maxlength="10" value='' required="required" style='width: 30%;'
						placeholder="성명">
				</div>
			</div>

			<div class="form-group">
				<label for="nickname" class="col-md-2 control-label"
					style='font-size: 0.9em;'>닉네임*</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='nickname'
						id='nickname' maxlength="40" value='' required="required"
						style='width: 30%;' placeholder="닉네임">
				</div>
			</div>

			<div class="form-group">
				<label for="phone" class="col-md-2 control-label"
					style='font-size: 0.9em;'>전화번호*</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='phone' id='phone'
						maxlength="40" value='' required="required" style='width: 30%;'
						placeholder="전화번호"> 예) 010-0000-0000
				</div>
			</div>


			<div class="form-group">
				<label for="housecode" class="col-md-2 control-label"
					style='font-size: 0.9em;'>우편번호</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='housecode'
						maxlength="5" id='housecode' value='' style='width: 30%;'
						placeholder="우편번호">
					<button type="button" id="btnDaumPostcode"
						class="btn btn-info btn-md">우편번호 찾기</button>
				</div>
			</div>

			<div class="form-group">
				<label for="address1" class="col-md-2 control-label"
					style='font-size: 0.9em;'>주소</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='address1'
						maxlength="100" id='address1' value='' style='width: 80%;'
						placeholder="주소">
				</div>
			</div>

			<div class="form-group">
				<label for="address2" class="col-md-2 control-label"
					style='font-size: 0.9em;'>상세 주소</label>
				<div class="col-md-10">
					<input type='text' class="form-control" name='address2'
						maxlength="50" id='address2' value='' style='width: 80%;'
						placeholder="상세 주소">
				</div>
			</div>

			<div class="form-group">
				<div class="col-md-12">

					<!-- ------------------------------ DAUM 우편번호 API 시작 ------------------------------ -->
					<div id="wrap"
						style="display: none; border: 1px solid; width: 500px; height: 300px; margin: 5px 110px; position: relative">
						<img
							src="//i1.daumcdn.net/localimg/localimages/07/postcode/320/close.png"
							id="btnFoldWrap"
							style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1"
							onclick="foldDaumPostcode()" alt="접기 버튼">
					</div>

					<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
					<script>
						// 우편번호 찾기 화면을 넣을 element
						var element_wrap = document.getElementById('wrap');
						function foldDaumPostcode() {
							// iframe을 넣은 element를 안보이게 한다.
							element_wrap.style.display = 'none';
						}
						function DaumPostcode() {
							// 현재 scroll 위치를 저장해놓는다.
							var currentScroll = Math.max(
									document.body.scrollTop,
									document.documentElement.scrollTop);
							new daum.Postcode(
									{
										oncomplete : function(data) {
											// 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
											// 각 주소의 노출 규칙에 따라 주소를 조합한다.
											// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
											var fullAddr = data.address; // 최종 주소 변수
											var extraAddr = ''; // 조합형 주소 변수
											// 기본 주소가 도로명 타입일때 조합한다.
											if (data.addressType === 'R') {
												//법정동명이 있을 경우 추가한다.
												if (data.bname !== '') {
													extraAddr += data.bname;
												}
												// 건물명이 있을 경우 추가한다.
												if (data.buildingName !== '') {
													extraAddr += (extraAddr !== '' ? ', '
															+ data.buildingName
															: data.buildingName);
												}
												// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
												fullAddr += (extraAddr !== '' ? ' ('
														+ extraAddr + ')'
														: '');
											}
											// 우편번호와 주소 정보를 해당 필드에 넣는다.
											$('#housecode').val(data.zonecode); // 5자리 새우편번호 사용 ★
											$('#address1').val(fullAddr); // 주소 ★
											// iframe을 넣은 element를 안보이게 한다.
											// (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
											element_wrap.style.display = 'none';
											// 우편번호 찾기 화면이 보이기 이전으로 scroll 위치를 되돌린다.
											document.body.scrollTop = currentScroll;
											$('#address2').focus();
										},
										// 우편번호 찾기 화면 크기가 조정되었을때 실행할 코드를 작성하는 부분. iframe을 넣은 element의 높이값을 조정한다.
										onresize : function(size) {
											element_wrap.style.height = size.height
													+ 'px';
										},
										width : '100%',
										height : '100%'
									}).embed(element_wrap);
							// iframe을 넣은 element를 보이게 한다.
							element_wrap.style.display = 'block';
						}
					</script>
					<!-- ------------------------------ DAUM 우편번호 API 종료 ------------------------------ -->

				</div>
			</div>

			<div class="form-group">
				<div class="col-md-offset-2 col-md-10">
					<button type="button" id='btnSend' class="btn btn-primary btn-md">가입</button>
					<button type="button" onclick="history.back()"
						class="btn btn-primary btn-md">취소</button>

				</div>
			</div>
		</FORM>
	</DIV>
</body>
</html>
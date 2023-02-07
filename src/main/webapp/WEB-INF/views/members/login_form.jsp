<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<script type="text/JavaScript"
	src="http://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript">
	$(function() { // 자동 실행
		$('#btnToCreate').on('click', function() {
			location.href = '/members/toCreate.do';
		});
	});
	</script>
</head>
<body>
  <DIV class='content_body'> 
    <DIV style='width: 80%; margin: 0px auto;'>
      <FORM name='frm' method='POST' action='./login.do' class="form-horizontal">
      
        <div class="form-group">
          <label class="col-md-4 control-label" style='font-size: 0.8em;'>아이디</label>    
          <div class="col-md-8">
            <input type='text' class="form-control" name='id' id='id' 
                       value='' required="required" 
                       style='width: 30%;' placeholder="아이디" autofocus="autofocus">
          </div>
     
        </div>   
     
        <div class="form-group">
          <label class="col-md-4 control-label" style='font-size: 0.8em;'>패스워드</label>    
          <div class="col-md-8">
            <input type='pw' class="form-control" name='pw' id='pw' 
                      value='' required="required" style='width: 30%;' placeholder="패스워드">
    
          </div>
        </div>   
     
        <div class="form-group">
          <div class="col-md-offset-4 col-md-8">
            <button type="submit" class="btn btn-primary btn-md">로그인</button>
            <button type='button' id='btnToCreate' class="btn btn-primary btn-md">회원가입</button>
          </div>
        </div>   
        
      </FORM>
    </DIV>
  </DIV> <%-- <DIV class='content_body'> END --%>
 
</body>
</html>
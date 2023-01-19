<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="top.jsp"%>

<!doctype html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>게스트예약정보</title>
    <link href="resources/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  </head>
  <style>
  .float-right-blue{
  color:blue;
  }
  </style>
<body>
<script type="text/javascript">
	function checkDel(res_no){
		var isDel = window.confirm("정말로 취소하시겠습니까?")
		if (isDel){
			document.cr.res_no.value = res_no
			document.cr.submit()
		}
	}
</script>
<br><br><br>
<div class="container">
<div class="row">
		
	<div class="col-md-3 mb-4">
		<div class="col-md ">
			<div class="list-group">
				  <a href="guest_my_info.do" class="list-group-item list-group-item-action">내 정보</a>
				  <a href="guest_my_passwd_edit.do" class="list-group-item list-group-item-action">비밀번호 수정</a>
				  <a href="guest_reservelist.do" class="list-group-item list-group-item-action">예약리스트</a>
				  <a href="guest_my_review.do" class="list-group-item list-group-item-action">내 리뷰</a>
				  <a href="guest_dibs.do" class="list-group-item list-group-item-action">찜목록</a>
			</div>
		</div>
	</div>

<div class="col-md-9 ">		
<div class="col-md-10 ">
	<c:if test="${empty reserveList}">
			예약 내역이 없습니다.
	</c:if>
<c:forEach var="dto" items="${reserveList}">		
<div class="card mb-3" >
  <h5 class="card-header">
    <b>${dto.pay_date}</b>
  </h5>
  <div class="card-body">
  	<div class="row">
  		<div class="col-4 align-self-center p-0">
  			<img class="img-fluid rounded" src="resources/img/${dto.room_img1}" alt="...">
  		</div>
  		<div class="col-8">
		    <h5 class="card-title"><b>${dto.room_nm}</b></h5>
		    <span class="float-left">예약자 명</span><span class="float-right">${dto.res_nm}</span><br>
		    <span class="float-left">사용 날짜</span><span class="float-right">${dto.use_dt}</span><br>
		    <span class="float-left">사용 시간</span><span class="float-right">${dto.use_time}</span><br>
		    <span class="float-left">사용 인원</span><span class="float-right">${dto.res_personnel}명</span><br>
		    <span class="float-left">예약 금액</span><span class="float-right">${dto.pay_pr}원</span><br>
		    <c:if test="${dto.pay_m ==1}">
		    <span class="float-left">결제 방식</span><span class="float-right">현장결제</span><br>
		    </c:if>
		    <c:if test="${dto.pay_m ==2}">
		    <span class="float-left">결제 방식</span><span class="float-right">무통장입금</span><br>
		    <c:if test="${dto.pay_st ==0}">
		    <span class="float-left">결제 상태</span><span class="float-right" style="color:red;">입금대기중</span><br>
		    </c:if>
		    <c:if test="${dto.pay_st ==1}">
		    <span class="float-left">결제 상태</span><span class="float-right" style="color:blue;">입금완료</span><br>
		    </c:if>
		    </c:if>
  		</div>
  	</div>
  </div>
  <div class="card-footer py-2">
    <div class="row">
    <div class="col text-center">
    <a href="guest_reserve_view.do?member_no=${dto.member_no}&res_no=${dto.res_no}" class="btn btn-info mx-1" style="width:130;">예약상세보기</a>
    <a href="javascript:checkDel(${dto.res_no})" class="btn btn-info mx-1"  style="width:130;">예약취소</a>
    
    
    
    <c:if test="${empty dto.rev_no}" >
    	<a href="guest_review_write.do?res_no=${dto.res_no}" class="btn btn-info mx-1" style="width:130;">리뷰 쓰기</a>
    </c:if>
    <c:if test="${not empty dto.rev_no}" >
    	<a href="#" class="btn btn-info mx-1" style="width:130;">리뷰 완료</a>
    </c:if>
   	 <a href="guest_spaceview.do?sn=${dto.room_no}" class="btn btn-info mx-1" style="width:130;">방 상세보기</a>
  		</div>
  	</div>
  </div>
</div>
</c:forEach>
	<form name="cr" action="cancleReserve.do" method="post">
		<input type="hidden" name="res_no"/>
	</form>

</div>

</div>
</div>
</div>
</body>
<%@ include file="bottom.jsp"%>
</html>
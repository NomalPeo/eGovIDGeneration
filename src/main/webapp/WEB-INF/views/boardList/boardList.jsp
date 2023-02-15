<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function allChecked(target){

    //전체 체크박스 버튼
    const checkbox = document.getElementById('allCheckBox');

    //전체 체크박스 버튼 체크 여부
    const is_checked = checkbox.checked;

    //전체 체크박스 제외한 모든 체크박스
    if(is_checked){
        //체크박스 전체 체크
        chkAllChecked()
    }

    else{
        //체크박스 전체 해제
        chkAllUnChecked()
    }
}

//자식 체크박스 클릭 이벤트
function chkClicked(){

    //체크박스 전체개수
    const allCount = document.querySelectorAll(".chk").length;

    //체크된 체크박스 전체개수
    const query = 'input[name="chk"]:checked'
    const selectedElements = document.querySelectorAll(query)
    const selectedElementsCnt = selectedElements.length;

    //체크박스 전체개수와 체크된 체크박스 전체개수가 같으면 전체 체크박스 체크
    if(allCount == selectedElementsCnt){
         document.getElementById('allCheckBox').checked = true;
    }

    //같지않으면 전체 체크박스 해제
    else{
        document.getElementById('allCheckBox').checked = false;
    }
}

//체크박스 전체 체크
function chkAllChecked(){
    document.querySelectorAll(".chk").forEach(function(v, i) {
        v.checked = true;
    });
}

//체크박스 전체 체크 해제
function chkAllUnChecked(){
    document.querySelectorAll(".chk").forEach(function(v, i) {
        v.checked = false;
    });
}
</script>
</head>
<body>
	<form action="boarddel.do" method="post">
	<table border="1">
		<tr>
			<td><label class="checkbox-inline"> <input
					type="checkbox" id="allCheckBox" onclick="allChecked()">
			</label></td>
			<th>idGeneraion</th>
			<th>title</th>
			<th>content</th>
		</tr>
		<c:forEach var="boardlist" items="${list}">
			<tr>
				<td><label class="checkbox-inline"> <input
						type="checkbox" name="chk" class="chk" onclick="chkClicked()"
						value="${boardlist.boardSeq}">
				</label></td>
				<td><c:out value="${boardlist.boardSeq}" /></td>
				<td><c:out value="${boardlist.boardTitle}" /></td>
				<td><c:out value="${boardlist.boardContent}" /></td>
			</tr>
		</c:forEach>
		<tr>
			<td colspan="4">
				<input type="submit" value="글삭제"/>
				<button type="button" onclick="location='boardwrite.do';">글작성</button>

			</td>
		</tr>
	</table>
	</form>
</body>
</html>
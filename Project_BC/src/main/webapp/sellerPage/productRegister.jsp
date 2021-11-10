<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%
 String sId = (String)session.getAttribute("sId");
 %>
<!DOCTYPE html>
<html>
<title>집밥선생 </title>
<script src="js/jquery-3.6.0.js"></script>
<script type="text/javascript">
var count=0;
var imgcount=1;

$(document).ready(function () {
	$('#tagplus').click(function () {		
		count++;
		imgcount++;
		
		if(count>10){
			alert('더 추가할수 없습니다.');
			count=10;
			return;
		}
		var plus = "<tr><td>이미지추가</td><td><input type='file' name='product_original_img"+imgcount+"' size=10></td><td><select name='imgValue"+imgcount+"'><option value='1'>주 이미지</option><option value='2'>상세 이미지</option></select></td></tr>"   
			   $('tbody').append(plus);
		
	});
});
$(document).ready(function () {
	$('#tagminus').click(function () {
		count--;
		imgcount--;
		if(count<0){
			alert('더이상 태그를 지울수 없습니다');
			count=0;
			return;
		}
		$('tbody > tr:last').remove();	
	});
       
});


function category(e){
	
	var sideDish = ["side","meat","fish"];
	var soup=["soup"];
	var kimchi=["kimchi"];
	
	var target = document.getElementById("select");

	
	
	if(e.value == "SideDish") var changeItem = sideDish;
	else if(e.value == "Soup") var changeItem = soup;
	else if(e.value == "Kimchi") var changeItem = kimchi;
	
	target.options.length = 0;
	
	for(var x in changeItem){
		var opt = document.createElement("option");
		opt.value = changeItem[x];
		opt.innerHTML = changeItem[x];
		target.appendChild(opt);
	}
	

}
function sendForm() {
	var item = document.getElementById("product_category2");
	if(!document.product.product_category2.value){		
		alert('카테고리를 선택해주세요');
		return false;
	}	
}


</script>
 
  <head>
      
        
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@latest/dist/style.css" rel="stylesheet" />
        <link href="CSS/styles.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        </head>
    
    
    <body class="sb-nav-fixed">
        <jsp:include page="../inc/dashBoard_top.jsp"/>
           
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">상품등록</h1>
                      
              
                        <div class="card mb-4"  style="width:600px">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                          상품등록
                            </div>
                            <div class="card-body">
                            <form name="product" action="ProductWritePro.ad" method="POST" enctype="multipart/form-data" onsubmit="return sendForm()">
                                <table class="table table-bordered talbe-light" >
                                 		<tr><td>상품명</td><td colspan="2"><input type="text" name = "product_name" size=10 required="required"></td></tr>
										<tr><td>판매자 명</td><td colspan="2"><input type="text" name = "seller_id" value="<%=sId %>" size=10 readonly="readonly"></td></tr>
                                        <tr><td>카테고리</td><td colspan="2"><select onchange="category(this) " name = "product_category">                                                                                
                                                                                <option value="SideDish" selected="selected">반찬</option>
                                                                                <option value="Soup">국</option>
                                                                                <option value="Kimchi">김치</option>
                                                                            </select> 
                                                                            <select id="select" name = "product_category2"  id="product_category2"><option value="">소분류</option>
                                                                            </select></td></tr>
										<tr><td>상품가격</td><td colspan="2"><input type="number" name = "product_price" size=10 required="required"></td></tr>
										<tr><td>제품무게</td><td colspan="2"><input type="number" name = "product_weight" size=10 required="required"></td></tr>
										<tr><td>제품총재고</td><td colspan="2"><input type="number" name = "product_stock" size=10 required="required"></td></tr>
										<tr><td>제품할인률</td><td colspan="2"><input type="number" name = "product_discount" size=10 required="required"></td></tr>
										<tr><td>제품 유통기한</td><td colspan="2"><input type="text" name = "product_expiration_date" size=10 required="required"></td></tr>
										<tr><td>제품보관방법</td><td colspan="2"><textarea rows="5" cols="30" name="product_handling" required="required"></textarea></td></tr>
										<tr><td>제품원재료명 및 함량</td><td colspan="2"><textarea rows="5" cols="30" name="product_material" required="required"></textarea></td></tr>
<!-- 										<tr><td>제품품목</td><td colspan="2"><input type="text" name = product_category size=10></td></tr> -->
									    <tr>
									    	<td>이미지추가</td><td><input type="file" name="product_original_img1" size=10></td>									    
										    <td>				    
										   		<select name="imgValue1">
										   			<option  value="1">주 이미지</option>
										   			<option value="2">상세 이미지</option>
										   		</select>
										   	</td>
										</tr>
                                </table>
                                <button type="button" id="tagplus" >태그추가</button>&nbsp;<button type="button" id="tagminus" >태그삭제</button>
                                <section id= commandCell>
															<input type="submit" value=등록>
															<input type="reset" value="취소">
									</section>
								</form>
                                
                            </div>
                        </div>
                    </div>
                </main>
                <jsp:include page="../inc/dashBoard_bottom.jsp"/>
            </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/assets/demo/scripts2.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@latest" crossorigin="anonymous"></script>
        <script src="js/assets/demo/datatables-simple-demo.js"></script> 
        <script src="js/assets/demo/datatables-simple-demo.js"></script>

    </body>



</html>



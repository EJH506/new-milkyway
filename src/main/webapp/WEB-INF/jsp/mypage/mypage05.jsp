<%request.setCharacterEncoding("utf-8");%>
<%@ page import="beans.BookBean"%>
<%@ page import="beans.WishBean"%>
<%@ page import="beans.BookBean"%>
<%@ page import="java.util.Vector"%>
<%@ page import="beans.CartBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="myMgr" class="myPage.MyPageMgr" />
<%
	String userId = (String) session.getAttribute("idKeyS");
	String pageVisible = (String) request.getParameter("pageVisible");
%>

	<%
	//페이징 기법
	int totalRecordCart = myMgr.getTotalMyCartCount(Integer.parseInt(userId)); // 전체 레코드 수
	// int totalRecord = 51;
	int numPerPageCart = 5; // 페이지당 레코드 수
	int pagePerBlockCart = 10; // 블럭당 페이지 수
	
	int totalPageCart = (totalRecordCart + numPerPageCart - 1) / numPerPageCart; // 전체 페이지 수
	int totalBlockCart = (totalPageCart + pagePerBlockCart - 1) / pagePerBlockCart; // 전체 블록 수
	
	int nowPageCart = 1; // 현재 페이지
	if(request.getParameter("nowPageCart") != null){
		nowPageCart = Integer.parseInt(request.getParameter("nowPageCart"));
	}
	
	int nowBlockCart = (nowPageCart - 1) / pagePerBlockCart + 1; // 현재 블록 번호
	
	int startCart = (nowPageCart * numPerPageCart) - numPerPageCart; // DB의 셀렉트 시작번호
	int endCart = numPerPageCart; // 시작번호로 부터 가져올 셀렉트의 갯수
	
	int listSizeCart = 0; //현재 읽어온 게시물의 수
	%>
      
	<script>
	<%--
	alert("<%=pageVisible%>");
	alert("<%=totalBlock%>");
	--%>
	function pagingCart(page, cart) {
		document.readFrm.nowPageCart.value = page;
		document.readFrm.pageVisible.value = cart;
		document.readFrm.submit();
	}
	
	function blockCart(valueCart, cart) {
	    // 블록 번호를 기준으로 시작 페이지 계산
	    const pagePerBlockCart = <%=pagePerBlockCart%>;
	    const newPageCart = pagePerBlockCart * (valueCart - 1) + 1;
	    document.readFrm.nowPageCart.value = newPageCart;
	    document.readFrm.pageVisible.value = cart;
	    document.readFrm.submit();
	} 
	</script>
	
	
	<%
	//페이징 기법
	int totalRecordWish = myMgr.getTotalMyWishCount(Integer.parseInt(userId)); // 전체 레코드 수
	// int totalRecord = 51;
	int numPerPageWish = 5; // 페이지당 레코드 수
	int pagePerBlockWish = 10; // 블럭당 페이지 수
	
	int totalPageWish = (totalRecordWish + numPerPageWish - 1) / numPerPageWish; // 전체 페이지 수
	int totalBlockWish = (totalPageWish + pagePerBlockWish - 1) / pagePerBlockWish; // 전체 블록 수
	
	int nowPageWish = 1; // 현재 페이지
	if(request.getParameter("nowPageWish") != null){
		nowPageWish = Integer.parseInt(request.getParameter("nowPageWish"));
	}
	
	int nowBlockWish = (nowPageWish - 1) / pagePerBlockWish + 1; // 현재 블록 번호
	
	int startWish = (nowPageWish * numPerPageWish) - numPerPageWish; // DB의 셀렉트 시작번호
	int endWish = numPerPageWish; // 시작번호로 부터 가져올 셀렉트의 갯수
	
	int listSizeWish = 0; //현재 읽어온 게시물의 수
	%>
      
	<script>
		<%--
		alert("<%=totalRecord%>");
		alert("<%=totalBlock%>");
		--%>
		function pagingWish(page, wish) {
			document.readFrm.nowPageWish.value = page;
			document.readFrm.pageVisible.value = wish;
			document.readFrm.submit();
		}
		
		function blockWish(value, wish) {
		    // 블록 번호를 기준으로 시작 페이지 계산
		    const pagePerBlockWish = <%=pagePerBlockWish%>;
		    const newPageWish = pagePerBlockWish * (value - 1) + 1;
		    document.readFrm.nowPageWish.value = newPageWish;
		    document.readFrm.pageVisible.value = wish;
		    document.readFrm.submit();
		} 
		
		function pageVisibleSet(section) {
			document.readFrm.pageVisible.value = section;
			document.readFrm.submit();
		}
	</script>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>mypage05</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/reset.css?after" />
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/mypage.css?after" />
  <script defer src="https://kit.fontawesome.com/9ad59cd5cc.js" crossorigin="anonymous"></script>
  <script defer src="${pageContext.request.contextPath}/js/myPage05.js?after"></script>
</head>

<body>

  <div id="wrap">

    <jsp:include page="../components/header.jsp" />

    <section  class="myPage05">
      <h2 class="sr-only">회원페이지</h2>
      
       <jsp:include page="../components/myPageSectionHead.jsp" />

      <div class="mainContainer">
      	
        <h3 class="visible" onClick="pageVisibleSet('cart')">장바구니</h3><h3 onClick="pageVisibleSet('wish')">관심목록</h3>
        
        <form name="cartFrm" method="post" action="/procs/moveToWish">
	        <ul class="shoppingCart list visible">
	        	<li>
	        		<input type="checkbox" name="cartAll" />일관선택
	        	</li>
		        <%
		        Vector<CartBean> myCartList = myMgr.getMyCartList(Integer.parseInt(userId), startCart, endCart);
	   	        for(int i=0; i<myCartList.size(); i++) {
	   	        	CartBean myCBean = myCartList.get(i);
	   	        	int bookId = myCBean.getBookid();
	   	        	BookBean myBBean = myMgr.getMyBookInfo(bookId);
		        	%>
	   	          	<li>
			           <input type="checkbox" name="cart" value="<%=myCBean.getCartid()%>" />
			           <img src="/image?bookid=<%=bookId%>" alt="<%=myBBean.getTitle()%>" />
			           <div class="bookInfo">
			             <p class="title"><%=myBBean.getTitle()%></p>
			             <p class="author"><%=myBBean.getAuthor()%></p>
			             <p class="price"><%=myBBean.getPrice()%>원</p>
			           </div>
			           
			           <div class="content">
			             <button type="button" onClick="delCartCheck(<%=myCBean.getCartid()%>)">삭제하기</button>
			             <button type="button" class="buyNow cart" onClick="javascript:location.href='/buy/buy01?bookId=<%=bookId%>'">바로구매</button>
			             <button type="button" onClick="javascript:location.href='/shop/shop02?bookId=<%=bookId%>'">
			               <i class="fa-solid fa-magnifying-glass"></i>
			               상세보기
			             </button>
			             <button type="button" onClick="moveToWish(<%=myCBean.getCartid()%>,'<%=myBBean.getTitle()%>')">관심목록으로 이동</button>
			           </div>
			         </li>
		        	 <%
	        	}//for
	        	%>
	          
				<li class="chkPrinter">
				  <p class="mainDescript">총 구매금액 : </p>
				  <p class="totalPrice">00000원</p>
				  <button type="button" class="buying">일괄구매</button>
				  <button type="button" class="moveTo" onClick="moveListsToWish()">관심목록이동</button>
				</li>
	        </ul>
			<input type="hidden" name="nowPageCart" value="<%= nowPageCart %>" />
			<input type="hidden" name="nowPageWish" value="<%= nowPageWish %>" />
		</form>
        
        <!-- 레코드 출력 종료 -->

		<!-- 페이지 및 블럭 처리 시작 -->
        
        <ul class="listSeletor visible">
			<%
			int pageStartCart = (nowBlockCart - 1)*pagePerBlockCart + 1;
			// 하단 페이지 시작번호
			int pageEndCart = (pageStartCart + pagePerBlockCart) <= totalPageCart ? pageStartCart + pagePerBlockCart : totalPageCart + 1;
			// 하단 페이지 끝 번호
			if(totalPageCart != 0){
				if(nowBlockCart > 1){
					%>
					<li>
						<a href="javascript:blockCart('<%=nowBlockCart - 1%>','cart')">prev</a>
					</li>
					<%
				}//if(nowBlock > 1)	
				for( ; pageStartCart<pageEndCart; pageStartCart++){
					if(pageStartCart==nowPageCart){
						%>
						<li class="on">
							<a href="javascript:pagingCart('<%=pageStartCart%>','cart')">
							[<%=pageStartCart%>]
							</a>
						</li>
						<%
					}else{
						%>
						<li>
							<a href="javascript:pagingCart('<%=pageStartCart%>','cart')">
							[<%=pageStartCart%>]
							</a>
						</li>
						<%
					}
				}//for( ; pageStart<pageEnd; pageStart++)
													
				if (totalBlockCart > nowBlockCart ) {
					%>
					<li>
						<a href="javascript:blockCart('<%=nowBlockCart + 1%>','cart')">next</a>
					</li>
					<%
				}//if(totalBlock > nowBlock )
			}//if(totalPage != 0)
			%>
        </ul>


   	    <form name="wishFrm"  method="get" action="/procs/moveToCart">
	        <ul class="wishList list">
				<li>
	        		<input type="checkbox" name="wishAll" />일관선택
	        	</li>
	       		<%
	       		Vector<WishBean> myWishList = myMgr.getMyWishList(Integer.parseInt(userId), startWish, endWish);       		       			        
		        for(int i=0; i<myWishList.size(); i++) {
		        	WishBean myWBean = myWishList.get(i);
		        	int bookId = myWBean.getBookid();
		        	BookBean myBBean = myMgr.getMyBookInfo(bookId);
	       			%>
	   	          	<li>
						<input type="checkbox" name="wish" value="<%= myWBean.getWishid() %>" />
						<img src="/image?bookid=<%= bookId %>" alt="<%= myBBean.getTitle() %>" />
						<div class="bookInfo">
						  <p class="title"><%=myBBean.getTitle() %></p>
						<p class="author"><%=myBBean.getAuthor() %></p>
						<p class="price"><%=myBBean.getPrice() %>원</p>
						</div>
			           
			            <div class="content">
			            <button type="button" onClick="delWishCheck(<%=myWBean.getWishid()%>)">삭제하기</button>
			             <button type="button" class="buyNow wish" onClick="javascript:location.href='/buy/buy01?bookId=<%=bookId %>'">바로구매</button>
			              <button type="button" onClick="javascript:location.href='/shop/shop02?bookId=<%=bookId %>'">
			                <i class="fa-solid fa-magnifying-glass"></i>
			                상세보기
			              </button>
			              <button type="button" onClick="moveToCart(<%=myWBean.getWishid()%>,'<%=myBBean.getTitle()%>')">장바구니로 이동</button>
			            </div>
			         </li>
		        	 <%
		        }//for
		        %>
		        
				<li class="chkPrinter">
				  <p class="mainDescript">총 구매금액 : </p>
				  <p class="totalPrice">00000원</p>
				  <button type="button" class="buying">일괄구매</button>
				  <button type="button" class="moveTo" onClick="moveListsToCart()">장바구니로이동</button>
				</li>
	        </ul>
			<input type="hidden" name="nowPageCart" value="<%= nowPageCart %>" />
			<input type="hidden" name="nowPageWish" value="<%= nowPageWish %>" />
		</form>
        
        <!-- 레코드 출력 종료 -->

		<!-- 페이지 및 블럭 처리 시작 -->
		
        <ul class="listSeletor">
            <%
        	int pageStartWish = (nowBlockWish - 1)*pagePerBlockWish + 1;
			// 하단 페이지 시작번호
			int pageEndWish = (pageStartWish + pagePerBlockWish) <= totalPageWish ? pageStartWish + pagePerBlockWish : totalPageWish + 1;
			// 하단 페이지 끝 번호
			if(totalPageWish != 0){
				if(nowBlockWish > 1){
					%>
					<li>
						<a href="javascript:blockWish('<%= nowBlockWish - 1 %>','wish')">prev</a>
					</li>
					<%
				}//if(nowBlock > 1)
				
				for( ; pageStartWish<pageEndWish; pageStartWish++){
					if(pageStartWish==nowPageWish){
						%>
						<li class="on">
							<a href="javascript:pagingWish('<%= pageStartWish %>','wish')">
							[<%= pageStartWish %>]
							</a>
						</li>
						<%
					}else{
						%>
						<li>
							<a href="javascript:pagingWish('<%= pageStartWish %>','wish')">
							[<%= pageStartWish %>]
							</a>
						</li>
						<%
					}
				}//for( ; pageStart<pageEnd; pageStart++)
							
				if (totalBlockWish > nowBlockWish ) {
					%>
					<li>
						<a href="javascript:blockWish('<%= nowBlockWish + 1%>','wish')">next</a>
					</li>
					<%
				}//if(totalBlock > nowBlock )
			}//if(totalPage != 0)
      		%>
        </ul>
      </div>
      
        <form name="readFrm" method="get">
			<input type="hidden" name="nowPageCart" value="<%= nowPageCart %>" />
			<input type="hidden" name="nowPageWish" value="<%= nowPageWish %>" />
			<input type="hidden" name="pageVisible" value="<%= pageVisible %>" />
		</form>
		
    </section>


	<jsp:include page="../components/footer.jsp" />

	<jsp:include page="../components/aside.jsp" />

  </div>

<script>
	function delCartCheck(cartid) {
		if(confirm("정말로 리스트를 영구히 삭제하시겠습니까?\n삭제된 리스트는 다시 불러올 수 없습니다.")) {
			location.href = "/procs/delMyCart?nowPageCart=<%=nowPageCart%>&nowPageWish=<%=nowPageWish%>&cartid=" + cartid;
		}else{
			return;
		}
	}
	function delWishCheck(wishid) {
		if(confirm("정말로 리스트를 영구히 삭제하시겠습니까?\n삭제된 리스트는 다시 불러올 수 없습니다.")) {
			location.href = "/procs/delMyWish?nowPageCart=<%=nowPageCart%>&nowPageWish=<%=nowPageWish%>&wishid=" + wishid;
		}else{
			return;
		}
	}
	
	function moveToCart(wishid, title) {
		if(confirm(title+"를 장바구니로 이동합니다.")) {
			location.href = "/procs/moveToCart?nowPageCart=<%=nowPageCart%>&nowPageWish=<%=nowPageWish%>&wishid=" + wishid;
		}else{
			return;
		}
	}
	
	function moveToWish(cartid, title) {
		if(confirm(title+"를 관심목록으로 이동합니다.")) {
			location.href = "/procs/moveToWish?nowPageCart=<%=nowPageCart%>&nowPageWish=<%=nowPageWish%>&cartid=" + cartid;
		}else{
			return;
		}
	}
	
	function moveListsToWish() {
		if(confirm("선택하신 대상을 관심목록으로 일괄 이동합니다.")) {
			document.cartFrm.submit();
		}else{
			return;
		}
	}
	
	function moveListsToCart() {
		if(confirm("선택하신 대상을 장바구니로 일괄 이동합니다.")) {
			document.wishFrm.submit();
		}else{
			return;
		}
	}
</script>

</body>

</html>
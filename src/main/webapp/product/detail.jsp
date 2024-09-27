<%@ page import="com.jhta.afterpay.util.DaoHelper" %>
<%@ page import="com.jhta.afterpay.util.RowMapper" %>
<%@ page import="java.sql.ResultSet" %>

<%@ page import="java.util.List" %>
<%@ page import="com.jhta.afterpay.product.*" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>AFTER PAY</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@400..900&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-YvpcrYf0tY3lHB60NNkmXc5s9fDVZLESaAA55NDzOxhy9GkcIdslK1eN7N6jIeHz" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="/common/css/style.css">
</head>
<body class="d-flex flex-column min-vh-100 ">
<%--
    요청 파라미터 정보
    pno = 해당 상품 번호
    page = 페이지 번호
--%>
<%
    String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<%
    if (request.getParameter("error") != null) {
%>
<div class="alert alert-danger">
    수정/삭제는 게시글 작성자만 가능합니다.
</div>
<%
    }
%>

<%
    // 1. 요청 파라미터 정보와 세션 객체의 사용자 정보 가져오기
    int productNo = Integer.parseInt(request.getParameter("pno")); // 상품 번호
    String loginedUserId = (String) session.getAttribute("USERID"); // 사용자 아이디

    // 2. 상품의 정보 가져오기
    // 상품 번호로 상품(productNo=?)의 모든 정보 반환
    ProductDao productDao = new ProductDao();
    Product product = productDao.getProductByNo(productNo);

    // 상품 번호로 상품(productNo=?)의 재고 상황 반환
    List<Stock> stocks = productDao.getAllStocksByNo(productNo);

    // 상품 번호로 상품(productNo=?)의 모든 리뷰 반환
    ReviewDao reviewDao = new ReviewDao();
    List<Review> reviews = reviewDao.getAllReviewsByNo(productNo);

    // 상품 번호로 상품(productNo=?)의 모든 사진 반환
    List<Image> images = productDao.getAllImagesByNo(productNo);
%>
<div class="container" style="margin-top: 100px;">
    <div class="row mb-3">
        <%--상품의 사진을 화면에 표시한다.--%>
        <div class="col-4">
            <div class="mb-3">
                <img src="/common/images/<%=images.get(0).getName()%>" id="big" class="img-thumbnail"/>
            </div>
            <div>
                <%
                    for (Image image : images) {
                %>
                        <img src="/common/images/<%=image.getName() %>" width="60" height="90" onmouseenter="changeBigImage(event)" />
                <%
                    }
                %>
            </div>
        </div>

        <%--상품의 상세 정보(상품 이름, 상품 가격, 상품 설명)를 화면에 표시한다.--%>
        <div class="col-8">
            <div class="row mb-3">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>상품 상세 정보</h4>
                        </div>
                        <div class="card-body">
                            <table class="table">
                                <colgroup >
                                    <col width="15%" />
                                    <col width="35%" />
                                    <col width="15%" />
                                    <col width="35%" />
                                </colgroup>
                                <tr>
                                    <th>상품이름</th><td><%=product.getName() %></td>
                                    <th>상품가격</th><td><%=product.getPrice() %></td>
                                </tr>
                                <tr>
                                    <th>상품설명</th>
                                    <td colspan="3"><%=product.getContent()%></td>
                                </tr>
                            </table>
                        </div>
                  </div>
                </div>
            </div>

            <%--상품의 재고가 존재한다면, 상품의 사이즈와 수량을 선택하여 장바구니 담기 버튼 혹은 지금 구매하기 버튼을 클릭한다.
                장바구니 버튼 클릭 -> 장바구니에 상품을 추가(로그인) / 로그인 폼으로 이동(로그아웃)
                지금 구매하기 버튼 클릭 -> 주문 폼으로 이동(로그인) / 로그인 폼으로 이동(로그아웃) --%>
            <%
                if (!stocks.isEmpty()) {
            %>
                <div class="row mb-3">
                    <div class="col-12 text-end">
                        <div class="d-flex justify-content-between border p-3 bg-light">
                            <p class="fw-bold pt-2">사이즈, 수량 선택</p>
                            <form id="frm" class="row row-cols-lg-auto g-3 align-items-center">
                                <input type="hidden" name="productNo" value="<%=productNo %>">
                                <div class="col-12">
                                    <div >
                                        <%
                                            for (Stock stock : stocks) {
                                        %>
                                            <div class="form-check form-check-inline">
                                                <input class="form-check-input" type="radio" name="stockNo" value="<%=stock.getNo()%>"
                                                    <%=stock.getSize().equals("M") ? "checked" : ""%>
                                                    onchange="showAmountField('<%=stock.getSize()%>')" >
                                                <label class="form-check-label" ><%=stock.getSize()%></label>
                                            </div>
                                        <%
                                          }
                                        %>
                                    </div>
                                </div>
                                <%
                                    for (Stock stock : stocks) {
                                %>
                                    <div class="col-12">
                                      <input type="number" class="form-control <%=stock.getSize().equals("M") ? "" : "d-none"%>"
                                             name="amount" id="amount-<%=stock.getSize()%>" value="1"
                                             min="1" max="<%=stock.getAmount() %>"
                                            <%=stock.getSize().equals("M") ? "" : "disabled"%> >
                                    </div>
                                <%
                                    }
                                %>
                                <div class="col-12 text-end">
                                    <div>
                                        <button type="submit" class="btn btn-outline-primary btn-sm <%=loginedUserId != null ? "active" : "disabled" %>" onclick="wish()">위시리스트</button>
                                        <button type="submit" class="btn btn-outline-primary btn-sm <%=loginedUserId != null ? "active" : "disabled" %>" onclick="addCart()">장바구니</button>
                                        <button type="submit" class="btn btn-outline-primary btn-sm <%=loginedUserId != null ? "active" : "disabled" %>" onclick="order()">구매</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                      </div>
                </div>
            <%
                } else {
            %>
                <div class="card-body">
                  <p class="card-text">재고가 없습니다.</p>
                </div>
            <%
              }
            %>
          </div>
    </div>

    <div class="row mb-3">
        <div class="col-12">
            <div class="card">
                <div class="card-header" id="review">
                    리뷰 목록
                    <%--리뷰 작성하기 버튼 클릭 -> 리뷰 작성 폼으로 이동(로그인) / 로그인 폼으로 이동(로그아웃) --%>
                    <a href="../review/review-form.jsp?pno=<%=productNo %>"
                        class="btn btn-outline-primary float-end btn-sm <%=loginedUserId != null ? "active" : "disabled" %>">리뷰 작성하기</a>
                </div>
                <%--리뷰가 없으면, "리뷰가 없습니다"를 화면에 표시한다. --%>
                <%
                    if (reviews.isEmpty()) {
                %>
                    <div class="card-body">
                        <p class="card-text">리뷰가 없습니다.</p>
                    </div>
                <%
                    } else {
                %>
                    <div class="list-group">
                        <%--상품에 대해 작성한 리뷰 목록을 화면에 표시한다.--%>
                        <%
                            for (Review review : reviews) {
                        %>
                                <a href="#" class="list-group-item list-group-item-action " aria-current="true">
                                    <div class="d-flex w-100 justify-content-between border-bottom">
                                        <h5 class="mb-1 p-2 fw-bolder"><%=review.getTitle() %> <span class="badge text-bg-primary small"><%=review.getRating()%></span></h5>
                                        <div>
                                            <span class="small"><%=review.getUser().getName() %></span>
                                            <span class="small"><%=review.getCreatedDate() %></span>
                                        </div>
                                    </div>
                                    <p class="mb-1 small p-2"><%=review.getContent() %></p>
                                </a>

                                <%--로그인한 사용자와 리뷰를 작성한 사용자와 동일하다면, 리뷰를 수정 및 삭제할 수 있다.--%>
                                <%
                                    boolean canModify = false; // 수정 가능 여부

                                    if (loginedUserId != null) {
                                        int loginedUserNo = (Integer) session.getAttribute("USERNO"); // 사용자 번호

                                        if (loginedUserNo == review.getUser().getNo()) {
                                          canModify = true;
                                        }
                                    }

                                    if (canModify) {
                                %>
                                    <div class="text-end p-3">
                                        <a href="../review/modify-form.jsp?rno=<%=review.getNo() %>" class="btn btn-warning btn-sm">수정</a>
                                        <a href="../review/delete.jsp?rno=<%=review.getNo() %>" class="btn btn-danger btn-sm">삭제</a>
                                    </div>
                                <%
                                    } else {
                                %>
                                    <div class="text-end p-3">
                                        <a href="" class="btn btn-secondary disabled btn-sm">수정</a>
                                        <a href="" class="btn btn-secondary disabled btn-sm">삭제</a>
                                    </div>
                                <%
                                    }
                                %>
                        <%
                            }
                        %>
                    </div>
                  <%
                    }
                  %>
            </div>
        </div>
    </div>
</div>
<%@ include file="../common/footer.jsp" %>
<script type="text/javascript">
    // 4개의 이미지 중 하나에 마우스 커서를 대면, 해당 이미지를 화면에 크게 표시한다.
    function changeBigImage(event) {
        let thumbImg = event.target;
        thumbImg.style.opacity = "1.0"; // opacity : 투명도 설정

        let imagePath = thumbImg.getAttribute("src");
        document.getElementById('big').setAttribute("src", imagePath);
    }

    // 사이즈를 클릭하면, 해당 사이즈의 최대 재고수량만큼 선택할 수 있다.
    function showAmountField(size) {
        let input1 = document.getElementById("amount-S");
        let input2 = document.getElementById("amount-M");
        let input3 = document.getElementById("amount-L");

        if (size === "S") {
            input1.classList.remove("d-none")
            input2.classList.add("d-none");
            input3.classList.add("d-none");

            input1.disabled = false;
            input2.disabled = true;
            input3.disabled = true;
        } else if (size === "M") {
            input1.classList.add("d-none")
            input2.classList.remove("d-none");
            input3.classList.add("d-none");

            input1.disabled = true;
            input2.disabled = false;
            input3.disabled = true;
        } else if (size === "L") {
            input1.classList.add("d-none")
            input2.classList.add("d-none");
            input3.classList.remove("d-none");

            input1.disabled = true;
            input2.disabled = true;
            input3.disabled = false;
        }
    }

    // 위시리스트 추가 버튼을 클릭하면, 위시리스트에 물품을 추가하고 위시리스트 목록 페이지로 이동한다.
    function wish() {
        alert("위시리스트에 물품을 담았습니다! (단, 위시리스트에 동일한 물품이 존재할 경우 추가되지 않습니다)")
        document.getElementById("frm").setAttribute("action", "../wish/add-wish.jsp");
        document.getElementById("frm").submit();
    }

    // 장바구니 담기 버튼을 클릭하면, 장바구니에 물품을 추가하고 장바구니 목록 페이지로 이동한다.
    function addCart() {
        alert("장바구니에 물품을 담았습니다!")
        document.getElementById("frm").setAttribute("action", "../user/cart-add.jsp");
        document.getElementById("frm").submit();
    }

    // 지금 구매하기 버튼을 클릭하면, 주문 폼으로 이동한다.
    function order() {
        document.getElementById("frm").setAttribute("action", "../order/order-form.jsp")
        document.getElementById("frm").submit();
    }
</script>
</body>
</html>

<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<%
    String userID = (String) session.getAttribute("USERID");
%>

<nav class="navbar bg-body-tertiary fixed-top">
    <div class="container-fluid">
        <a class="navbar-brand" href="/index.jsp">AFTER PAY</a>
        <div class="nav-box">
            <button type="button" class="btn btn-outline-secondary">
                <%
                    if (userID == null) {
                %>
                <a href="/login-form.jsp">
                        <%
            } else {
        %>
                    <a class="nav-link" href="../user/wish-list.jsp">
                        <%
                            }
                        %>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-heart fs-5"
                             viewBox="0 0 16 16">
                            <path d="m8 2.748-.717-.737C5.6.281 2.514.878 1.4 3.053c-.523 1.023-.641 2.5.314 4.385.92 1.815 2.834 3.989 6.286 6.357 3.452-2.368 5.365-4.542 6.286-6.357.955-1.886.838-3.362.314-4.385C13.486.878 10.4.28 8.717 2.01zM8 15C-7.333 4.868 3.279-3.04 7.824 1.143q.09.083.176.171a3 3 0 0 1 .176-.17C12.72-3.042 23.333 4.867 8 15"/>
                        </svg>
                    </a>
            </button>
            <button type="button" class="btn btn-outline-secondary">
                <%
                    if (userID == null) {
                %>
                <a href="/login-form.jsp">
                        <%
            } else {
        %>
                    <a class="nav-link" href="../user/cart.jsp">
                        <%
                            }
                        %>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-bag fs-5"
                             viewBox="0 0 16 16">
                            <path d="M8 1a2.5 2.5 0 0 1 2.5 2.5V4h-5v-.5A2.5 2.5 0 0 1 8 1m3.5 3v-.5a3.5 3.5 0 1 0-7 0V4H1v10a2 2 0 0 0 2 2h10a2 2 0 0 0 2-2V4zM2 5h12v9a1 1 0 0 1-1 1H3a1 1 0 0 1-1-1z"/>
                        </svg>
                    </a>
            </button>
            <button type="button" class="btn btn-outline-secondary">
                <%
                    if (userID == null) {
                %>
                <a href="/login-form.jsp">
                        <%
              } else {
          %>
                    <a class="nav-link" href="../user/mypage.jsp">
                        <%
                            }
                        %>
                        <svg xmlns="http://www.w3.org/2000/svg" fill="currentColor" class="bi bi-person fs-5"
                             viewBox="0 0 16 16">
                            <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6m2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0m4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4m-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10s-3.516.68-4.168 1.332c-.678.678-.83 1.418-.832 1.664z"/>
                        </svg>
                    </a>
            </button>
        </div>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasNavbar"
                aria-controls="offcanvasNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end" tabindex="-1" id="offcanvasNavbar" aria-labelledby="offcanvasNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasNavbarLabel">AFTER PAY</h5>
                <button type="button" class="btn-close" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-end flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/product/best.jsp">베스트</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            남성
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=10">전체보기</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=11">상의</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=12">하의</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=13">슈즈</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=14">가방</a></li>

                        </ul>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            여성
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=20">전체보기</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=21">상의</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=22">하의</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=23">슈즈</a></li>
                            <li><a class="dropdown-item" href="/product/list.jsp?cat_no=24">가방</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="#">비전</a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown"
                           aria-expanded="false">
                            서포트
                        </a>
                        <ul class="dropdown-menu">
                            <li><a class="dropdown-item" href="/common/delivery.jsp">배송 안내</a></li>
                            <li><a class="dropdown-item" href="/common/sizeGuide.jsp">사이즈 가이드</a></li>
                            <li><a class="dropdown-item" href="/common/productCare.jsp">제품 관리</a></li>
                            <li><a class="dropdown-item" href="/common/memberShip.jsp">멤버십</a></li>
                        </ul>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/notice/list.jsp">공지사항</a>
                    </li>
                    <%
                        if (userID != null) {
                    %>
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="/logout.jsp">로그아웃</a>
                    </li>
                    <%
                        }
                    %>
                </ul>
                <form class="d-flex mt-3" role="search">
                    <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                    <button class="btn btn-outline-success" type="submit">검색</button>
                </form>
            </div>
        </div>
    </div>
</nav>
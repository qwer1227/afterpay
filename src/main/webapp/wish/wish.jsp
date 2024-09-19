<%@ page import="product.WishDao" %>
<%@ page import="java.util.List" %>
<%@ page import="product.Wish" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="utf-8" %>
<!DOCTYPE html>
<html lang="en">
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
<%
  String menu = "홈";
%>
<%@ include file="../common/nav.jsp" %>
<%
  // 1. 로그인하지 않은 경우, 로그인 폼으로 이동한다.
//  if (session.getAttribute("USERID") == null) {
//    response.sendRedirect("login-form.jsp");
//    return;
//  }

  // 2. 사용자 번호를 조회한다.
  // int userNo = (Integer) session.getAttribute("USERNO"); // 사용자 번호
  int userNo = 8;

  // 3. 사용자의 모든 위시리스트 목록을 가져온다.
  WishDao wishDao = new WishDao();
  List<Wish> wishes = wishDao.getWishesByUserNo(userNo);
%>
<div class="container">
  <div class="row mb-5">
    <div class="col-12">
      <h4>위시리스트 상품 목록</h4>
      <table class="table">
        <colgroup >
          <col width="15%" />
          <col width="35%" />
          <col width="*" />
        </colgroup>
        <thead>
          <tr>
            <th>상품이름</th>
            <th>상품가격</th>
          </tr>
        </thead>
        <tbody>
        <%
          for (Wish wish : wishes) {
        %>
          <td><a href="../product/detail.jsp?productNo=<%=wish.getProduct().getNo()%>"><%=wish.getProduct().getName() %></a></td>
          <td><%=wish.getProduct().getPrice() %></td>
          <td class="text-end">
            <a href="delete-wish.jsp?wishNo=<%=wish.getNo() %>" class="btn btn-outline-danger btn-sm">
              삭제
            </a>
          </td>
        <%
          }
        %>
        </tbody>
      </table>
    </div>
  </div>
</div>
<%@ include file="../common/footer.jsp" %>
</body>
</html>
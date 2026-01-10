<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="vn">
<head>
	<meta charset="UTF-8">
	<title>${titlePage} | Movie369</title> <link rel="stylesheet" href="style.css">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/boxicons@latest/css/boxicons.min.css">
</head>
<body>

<jsp:include page="header.jsp"/>

<section class="all-movies">
	<div class="phimle-header">
		<h2 class="heading-title">${titlePage}</h2>

		<div class="phimle-filter">
			<c:set var="formAction" value="${activeType == 'genre' ? 'filter' : 'listMovie'}" />

			<form action="${formAction}" method="get">

				<c:choose>
					<c:when test="${activeType == 'genre'}">
						<input type="hidden" name="genreId" value="${genreId}">
					</c:when>
					<c:otherwise>
						<input type="hidden" name="type" value="${activeType}">
					</c:otherwise>
				</c:choose>

				<span>Sắp xếp:</span>
				<select name="sort" onchange="this.form.submit()" style="padding: 5px; border-radius: 4px; border: none; outline: none;">
					<option value="newest" ${activeSort == 'newest' ? 'selected' : ''}>Mới nhất</option>
					<option value="views" ${activeSort == 'views' ? 'selected' : ''}>Xem nhiều nhất</option>
					<option value="rating" ${activeSort == 'rating' ? 'selected' : ''}>Đánh giá cao</option>
				</select>
			</form>
		</div>
	</div>

	<div class="phimle-grid">

		<c:if test="${empty listMovies}">
			<p style="color: white;">Hiện chưa có phim nào trong mục này.</p>
		</c:if>

		<c:forEach items="${listMovies}" var="m">
			<div class="movie-box">
				<a href="detail?id=${m.id}" class="movie-box-link">
					<div class="movie-img-wrapper">
						<c:if test="${m.premium}">
							<span class="vip-badge">
								<i class='bx bxs-crown'></i> VIP
							</span>
						</c:if>
						<img src="${m.posterUrl.startsWith('http') ? m.posterUrl : pageContext.request.contextPath.concat('/').concat(m.posterUrl)}"
							 alt="${m.title}"
							 class="movie-box-img">
					</div>
					<div class="box-text">
						<h3 class="movie-title">${m.title}</h3>
						<span class="movie-type">
							<c:choose>
								<c:when test="${m.series}">
									Tập ${m.lastestEp}
								</c:when>
								<c:otherwise>
									${m.releaseYear}
								</c:otherwise>
							</c:choose>
						</span>
					</div>
				</a>
			</div>
		</c:forEach>

	</div>
	<div class="pagination">
	</div>

</section>

<jsp:include page="footer.jsp" />

</body>
</html>
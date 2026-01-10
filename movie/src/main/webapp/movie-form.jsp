<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="vi">
<head>
    <meta charset="UTF-8">
    <title>${movie != null ? 'Cập Nhật Phim' : 'Thêm Phim Mới'}</title>
    <link rel="stylesheet" href="style.css">
</head>
<body style="background: #020307;">

<div class="form-container">
    <h2 style="margin-bottom: 20px; text-align: center; color: var(--main-color);">
        ${movie != null ? 'CẬP NHẬT PHIM' : 'THÊM PHIM MỚI'}
    </h2>

    <form action="movie-form" method="post">
        <c:if test="${movie != null}">
            <input type="hidden" name="id" value="${movie.id}">
        </c:if>

        <div class="form-group">
            <label>Tên phim</label>
            <input type="text" name="title" value="${movie.title}" required>
        </div>

        <div class="form-group">
            <label>Mô tả</label>
            <textarea name="description" rows="4">${movie.description}</textarea>
        </div>

        <div style="display: flex; gap: 20px;">
            <div class="form-group" style="flex: 1;">
                <label>Năm phát hành</label>
                <input type="number" name="year" value="${movie.releaseYear != 0 ? movie.releaseYear : 2024}">
            </div>
            <div class="form-group" style="flex: 1;">
                <label>Thời lượng (phút)</label>
                <input type="number" name="duration" value="${movie.durationMinutes}">
            </div>
        </div>

        <div class="form-group">
            <label>Link Poster (Ảnh bìa)</label>
            <input type="text" name="posterUrl" value="${movie.posterUrl}">
        </div>

        <div class="form-group">
            <label>Link Video (Full HD)</label>
            <input type="text" name="videoUrl" value="${movie.movieUrl}">
        </div>

        <div class="form-group">
            <label>Link Trailer (Youtube ID/Link)</label>
            <input type="text" name="trailerUrl" value="${movie.trailerUrl}">
        </div>

        <div style="display: flex; gap: 20px;">
            <div class="form-group" style="flex: 1;">
                <label>Loại phim</label>
                <select name="isSeries">
                    <option value="false" ${movie.series == false ? 'selected' : ''}>Phim Lẻ</option>
                    <option value="true" ${movie.series == true ? 'selected' : ''}>Phim Bộ</option>
                </select>
            </div>
            <div class="form-group" style="flex: 1;">
                <label>Gói xem</label>
                <select name="isPremium">
                    <option value="false" ${movie.premium == false ? 'selected' : ''}>Miễn phí (Free)</option>
                    <option value="true" ${movie.premium == true ? 'selected' : ''}>VIP (Premium)</option>
                </select>
            </div>
            <div class="form-group" style="flex: 1;">
                <label>Trạng thái</label>
                <select name="status">
                    <option value="1" ${movie.status == '1' ? 'selected' : ''}>Hiển thị</option>
                    <option value="0" ${movie.status == '0' ? 'selected' : ''}>Ẩn</option>
                </select>
            </div>
        </div>

        <div style="text-align: center; margin-top: 20px;">
            <button type="submit" class="btn-submit">LƯU LẠI</button>
            <a href="admin" style="color: #888; margin-left: 15px; text-decoration: none;">Hủy bỏ</a>
        </div>
    </form>
</div>
</body>
</html>

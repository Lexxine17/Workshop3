<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/users/header.jsp" %>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Szczegóły użytkownika</h6>
            </div>
            <div class="card-body">
                <c:if test="${not empty user}">
                    <table class="table table-striped">
                            <tr>
                                <td>ID</td>
                                <td>${user.id}</td>
                            </tr>
                        <tr>
                            <td>Nazwa użytkowika</td>
                            <td>${user.username}</td>
                        </tr>
                        <tr>
                            <td>email</td>
                            <td>${user.email}</td>
                        </tr>

                    </table>
                </c:if>

                <c:if test="${empty user}">
                    <p>Brak użytkowników do wyświetlenia.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<%@ include file="/users/footer.jsp" %>

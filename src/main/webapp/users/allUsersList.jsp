<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/users/header.jsp" %>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Lista użytkowników</h6>
            </div>
            <div class="card-body">
                <c:if test="${not empty users}">
                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Nazwa użytkownika</th>
                                <th>Email</th>
                                <th>Akcja</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${users}" var="user">
                                <tr>
                                    <td>${user.id}</td>
                                    <td>${user.username}</td>
                                    <td>${user.email}</td>
                                    <td>
                                        <a href="/user/delete?id=${user.id}">Usuń</a> <a href="/user/edit?id=${user.id}">Edytuj</a> <a href="/user/show?id=${user.id}">Pokaż</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </c:if>

                <c:if test="${empty users}">
                    <p>Brak użytkowników do wyświetlenia.</p>
                </c:if>
            </div>
        </div>
    </div>
</div>

<%@ include file="/users/footer.jsp" %>

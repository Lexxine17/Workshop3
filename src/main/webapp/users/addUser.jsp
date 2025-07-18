<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/users/header.jsp" %>

<div class="row justify-content-center">
    <div class="col-lg-8">
        <div class="card shadow mb-4 mt-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Dodaj użytkownika</h6>
            </div>
            <div class="card-body">
                <form action="/user/add" method="post">
                    <label for="name">Nazwa</label>
                    <input type="text" name="username" placeholder="Nazwa użytkownika" class="form-control"><br>
                    <label for="name">Email</label>
                    <input type="email" name="email" placeholder="Email użytkownika" class="form-control"><br>
                    <label for="password">Hasło</label>
                    <input type="password" name="password" placeholder="Hasło użytkownika" class="form-control"><br>
                    <input type="submit" value="Zapisz" class="btn btn-primary">
                </form>
            </div>
        </div>
    </div>
</div>

<%@ include file="/users/footer.jsp" %>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Calcula</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }

        .campo {
            margin-bottom: 8px;
        }

        label {
            display: inline-block;
            width: 70px;
        }

        input[type="text"] {
            width: 120px;
        }

        .erro {
            color: red;
            margin-left: 10px;
        }

        .resultado {
            color: red;
            margin: 10px 0;
        }
    </style>
</head>
<body>
    <%
        String erroValor1 = (String) request.getAttribute("erroValor1");
        String erroValor2 = (String) request.getAttribute("erroValor2");
        String erroDivisao = (String) request.getAttribute("erroDivisao");
        String resultado = (String) request.getAttribute("resultado");

        String val1 = request.getParameter("valor1") != null ? request.getParameter("valor1") : "";
        String val2 = request.getParameter("valor2") != null ? request.getParameter("valor2") : "";
        String op = request.getParameter("op") != null ? request.getParameter("op") : "+";
    %>

    <form action="Calculo" method="post">
        <div class="campo">
            <label for="valor1">Valor 1:</label>
            <input id="valor1" type="text" name="valor1" value="<%= val1 %>">
            <% if (erroValor1 != null) { %>
                <span class="erro"><%= erroValor1 %></span>
            <% } %>
        </div>

        <div class="campo">
            <label for="valor2">Valor 2:</label>
            <input id="valor2" type="text" name="valor2" value="<%= val2 %>">
            <% if (erroValor2 != null) { %>
                <span class="erro"><%= erroValor2 %></span>
            <% } %>
            <% if (erroDivisao != null) { %>
                <span class="erro"><%= erroDivisao %></span>
            <% } %>
        </div>

        <div class="campo">
            <label for="op">Op:</label>
            <select id="op" name="op">
                <option value="+" <%= "+".equals(op) ? "selected" : "" %>>+</option>
                <option value="-" <%= "-".equals(op) ? "selected" : "" %>>-</option>
                <option value="*" <%= "*".equals(op) ? "selected" : "" %>>*</option>
                <option value="/" <%= "/".equals(op) ? "selected" : "" %>>/</option>
            </select>
        </div>

        <% if (resultado != null) { %>
            <div class="resultado">Expressão: <%= resultado %></div>
        <% } %>

        <input type="submit" value="Calcula">
    </form>
</body>
</html>

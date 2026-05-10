package br.edu;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.Locale;

@WebServlet("/Calculo")
public class Calculo extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");

        String sValor1 = request.getParameter("valor1");
        String sValor2 = request.getParameter("valor2");
        String op = request.getParameter("op");

        Float valor1 = converterValor(sValor1);
        Float valor2 = converterValor(sValor2);

        if (valor1 == null) {
            request.setAttribute("erroValor1", "Valor 1 inválido");
        }

        if (valor2 == null) {
            request.setAttribute("erroValor2", "Valor 2 inválido");
        }

        if (valor1 != null && valor2 != null) {
            if ("/".equals(op) && valor2 == 0f) {
                request.setAttribute("erroDivisao", "Divisão por zero");
            } else {
                float resultado = calcular(valor1, valor2, op);
                String expressao = String.format(
                        Locale.US,
                        "%f %s %f = %f",
                        valor1,
                        op,
                        valor2,
                        resultado);
                request.setAttribute("resultado", expressao);
            }
        }

        request.getRequestDispatcher("calcula.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("calcula.jsp").forward(request, response);
    }

    private Float converterValor(String valor) {
        if (valor == null || valor.trim().isEmpty()) {
            return null;
        }

        try {
            return Float.parseFloat(valor.trim().replace(",", "."));
        } catch (NumberFormatException e) {
            return null;
        }
    }

    private float calcular(float valor1, float valor2, String op) {
        return switch (op) {
            case "-" -> valor1 - valor2;
            case "*" -> valor1 * valor2;
            case "/" -> valor1 / valor2;
            default -> valor1 + valor2;
        };
    }
}

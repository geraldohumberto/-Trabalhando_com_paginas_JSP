# Projeto: Calculadora JSP + Servlet

## Visão Geral

Aplicação web Java com uma página JSP de formulário e um Servlet para processar cálculos. O usuário informa dois valores reais e uma operação (`+`, `-`, `*`, `/`). O sistema exibe o resultado ou mensagens de erro ao lado dos campos.

## Estrutura de Arquivos

```text
.
├── pom.xml
└── src/
    └── main/
        ├── java/
        │   └── br/
        │       └── edu/
        │           └── Calculo.java
        └── webapp/
            ├── calcula.jsp
            └── WEB-INF/
                └── web.xml
```

## `src/main/webapp/calcula.jsp`

A página JSP monta o formulário, mantém os valores digitados e exibe condicionalmente os erros e o resultado recebidos do Servlet.

```jsp
<form action="Calculo" method="post">
    <input type="text" name="valor1">
    <input type="text" name="valor2">
    <select name="op">
        <option value="+">+</option>
        <option value="-">-</option>
        <option value="*">*</option>
        <option value="/">/</option>
    </select>
    <input type="submit" value="Calcula">
</form>
```

O arquivo completo está em `src/main/webapp/calcula.jsp`.

## `src/main/java/br/edu/Calculo.java`

O Servlet recebe os parâmetros do formulário, valida cada campo individualmente, impede divisão por zero e encaminha a resposta para `calcula.jsp`.

Principais atributos enviados para a JSP:

- `erroValor1`: mensagem exibida ao lado do primeiro campo.
- `erroValor2`: mensagem exibida ao lado do segundo campo.
- `erroDivisao`: mensagem específica para divisão por zero.
- `resultado`: expressão completa do cálculo.

## `src/main/webapp/WEB-INF/web.xml`

Define `calcula.jsp` como página inicial da aplicação.

## `pom.xml`

Configura o projeto como aplicação web Maven (`war`), usando Java 17 e `jakarta.servlet-api` com escopo `provided`, pois o Tomcat fornece essa API em tempo de execução.

## Compilação

```bash
mvn clean package
```

Resultado esperado:

```text
target/CalcWeb.war
```

## Cenários de Teste

| Situação | Valor 1 | Valor 2 | Op | Resultado esperado |
|---|---|---|---|---|
| Campos vazios | vazio | vazio | + | `Valor 1 inválido` e `Valor 2 inválido` |
| Valores com letras | a | b | + | Erros nos dois campos |
| Valor 2 inválido | 10 | b | + | Apenas `Valor 2 inválido` |
| Divisão por zero | 10 | 0 | / | `Divisão por zero` |
| Cálculo válido | 10 | 2.3 | * | `10.000000 * 2.300000 = 23.000000` |

## Evidências Para o Trabalho

1. `PRINT1_campos_vazios.png`
2. `PRINT2_valores_invalidos.png`
3. `PRINT3_valor2_invalido.png`
4. `PRINT4_divisao_zero.png`
5. `PRINT5_calculo_valido.png`
6. `PRINT6_estrutura_projeto.png`
7. `PRINT7_servlet_calculo.png`
8. `PRINT8_jsp_calcula.png`

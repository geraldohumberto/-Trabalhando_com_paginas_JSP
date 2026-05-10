# Calculadora Web com JSP e Servlet

Aplicação web acadêmica desenvolvida em Java com **JSP**, **Servlet**, **Apache Tomcat 10** e **Maven**. O sistema recebe dois valores reais, uma operação aritmética e exibe o resultado ou as mensagens de validação correspondentes.

## Tecnologias Utilizadas

- Java 17
- Jakarta Servlet 5
- JSP
- Apache Tomcat 10
- Maven
- HTML5 + CSS3

## Estrutura do Projeto

```text
.
├── pom.xml
├── src/
│   └── main/
│       ├── java/
│       │   └── br/
│       │       └── edu/
│       │           └── Calculo.java
│       └── webapp/
│           ├── calcula.jsp
│           └── WEB-INF/
│               └── web.xml
├── PROJETO_CALCULA.md
├── INSTRUCOES_PASSO_A_PASSO.txt
└── Trabalho_Academico_JSP_Servlet.docx
```

## Funcionalidades

- Soma, subtração, multiplicação e divisão.
- Validação de campos vazios.
- Validação de valores não numéricos.
- Tratamento de divisão por zero.
- Preservação dos valores digitados após o envio do formulário.
- Exibição da expressão matemática com seis casas decimais.

## Arquitetura

A página `src/main/webapp/calcula.jsp` é responsável pela interface, formulário e exibição das mensagens. O Servlet `src/main/java/br/edu/Calculo.java` recebe a requisição, valida os dados, executa o cálculo e encaminha os atributos de resultado ou erro para a JSP.

## Como Executar

Clone o repositório e entre na pasta:

```bash
git clone https://github.com/geraldohumberto/-Trabalhando_com_paginas_JSP.git
cd -Trabalhando_com_paginas_JSP
```

Compile o projeto:

```bash
mvn clean package
```

O arquivo de deploy será gerado em:

```text
target/CalcWeb.war
```

Copie `target/CalcWeb.war` para a pasta `webapps` do Tomcat 10 ou faça o deploy pelo VS Code. Depois acesse:

```text
http://localhost:8080/CalcWeb/calcula.jsp
```

## Testes Esperados

| Situação | Valor 1 | Valor 2 | Op | Resultado esperado |
|---|---:|---:|:---:|---|
| Campos vazios | vazio | vazio | + | `Valor 1 inválido` e `Valor 2 inválido` |
| Valores inválidos | a | b | + | Mensagens de erro nos dois campos |
| Apenas Valor 2 inválido | 10 | b | + | `Valor 2 inválido` |
| Divisão por zero | 10 | 0 | / | `Divisão por zero` |
| Cálculo válido | 10 | 2.3 | * | `10.000000 * 2.300000 = 23.000000` |

## Entrega Acadêmica

O arquivo `Trabalho_Academico_JSP_Servlet.docx` contém a estrutura do trabalho escrito. Após executar a aplicação, insira no documento os prints indicados no guia `INSTRUCOES_PASSO_A_PASSO.txt`.

## Autor

Geraldo Humberto

## Licença

Projeto desenvolvido para fins educacionais.

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Navbar */
        nav {
            background-color: #333;
            overflow: hidden;
        }

        nav a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        nav a:hover {
            background-color: #ddd;
            color: black;
        }

        /* Main content */
        main {
            padding: 20px;
            text-align: center;
        }

        main h1 {
            color: #333;
        }

        main p {
            color: #666;
            font-size: 18px;
        }

        /* Footer */
        footer {
            background-color: #333;
            color: white;
            text-align: center;
            padding: 10px;
            position: fixed;
            left: 0;
            bottom: 0;
            width: 100%;
        }
    </style>



</head>
<body>
     <!-- Navbar -->
     <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Prato</a>
        <a href="cardapio">Ver os pratos</a>
        <a href="cadastroFornecedores">Cadastrar um novo fornecedor</a>
        <a href="Fornecedores">Fornecedor</a>
    </nav>

    <!-- Main content -->
    <main>
        <h1>Bem-vindo ao Sistema</h1>
        <p>Este é o seu sistema de gestão, onde você pode gerenciar pedidos, visualizar produtos e muito mais.</p>
    </main>

    <!-- Footer -->
    <footer>
        <p>© 2024 - Sistema de Gestão de Pedidos</p>
    </footer>
    
</body>
</html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            height: 50vw;
        }

        /* Navbar */
        nav {
            background-color: #0E0E0E;
            overflow: hidden;
            padding: 20px;
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
            color: #FFCC00;
        }

        /* Main content */
        main {
            display: flex;
            flex-direction: column;
            justify-content: center;            
            height: 50vh;
            gap: 0.2rem;
            padding: 2rem;
        }

        main h1 {
            color: #FFCC00;
            font-size: 5rem;
            margin: 0;
        }

        main p {
            color: #666;
            font-size: 2rem;
        }

        /* Footer */
        footer {
            background-color: #0e0e0e;
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
        <h1>Restaurante da Gula</h1>
        <p>Este é o seu sistema de gestão, para gerenciar pedidos, visualizar produtos e muito mais.</p>
    </main>

    <!-- Footer -->
    <footer>
        <p>© 2024 - Restaurante da Gula</p>
    </footer>
    
</body>
</html>
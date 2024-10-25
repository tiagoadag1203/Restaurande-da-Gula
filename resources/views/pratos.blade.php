<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Meu Restaurante</title>
        <!-- Adicionando Google Fonts e ícones sem Materialize -->
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

        <!-- CSS Personalizado -->
        <link href="{{ asset('css/pratos.css') }}" rel="stylesheet"> 


    </head>
    <body class="font-sans antialiased">

    <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Produto</a>
        <a href="cardapio">Ver os pratos</a>
        <a href="#contato">Contato</a>
    </nav>

        <h1>Produtos disponíveis</h1>

        <div class="container">
            <div class="row">
                @foreach($listaProdutos as $prd)
                <div class="card">
                    <img src="images/office.jpg" alt="Imagem do produto">
                    <div class="card-content">
                        <span class="card-title">{{$prd->nome_produto}} <i class="material-icons">more_vert</i></span>
                        <p><a href="#">Comprar</a></p>
                    </div>
                    <div class="card-reveal">
                        <span class="card-title">{{$prd->nome_produto}}<i class="material-icons">close</i></span>
                        <p>{{$prd->descricao_produto}}</p>
                    </div>
                </div>
                @endforeach    
            </div> 
        </div>
        
    </body>
</html>

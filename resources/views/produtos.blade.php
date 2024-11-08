<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Meu Restaurante</title>

        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


        <link href="{{ asset('css/produtos.css') }}" rel="stylesheet">
 
        
    </head>
    <body class="font-sans antialiased">


    <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Prato</a>
        <a href="cardapio">Ver os pratos</a>
        <a href="cadastroFornecedores">Cadastrar um novo fornecedor</a>
        <a href="Fornecedores">Fornecedor</a>
    </nav>

        <h1>Cadastro de produtos</h1>

        @if( !empty($dado))
            {{$dado}}
        @endif
                
        <div class="container">
            <form action="/produtos/cadastrar" method="post">
                @csrf
                <div class="input-group">
                    <label for="formNomeProduto">Nome Produto</label>
                    <i class="material-icons">collections</i>
                    <input type="text" id="formNomeProduto" name="formNomeProduto">
                </div>
                
                <div class="input-group">
                    <label for="formQtdProduto">Quantidade comprada</label>
                    <i class="material-icons">format_list_numbered</i>
                    <input type="text" id="formQtdProduto" name="formQtdProduto">
                </div>

                <div class="input-group">
                    <label for="formValorProduto">Valor Produto</label>
                    <i class="material-icons">attach_money</i>
                    <input type="text" id="formValorProduto" name="formValorProduto">
                </div>

                <input type="submit" value="GRAVAR" class="submit-btn">
            </form>
        </div>
    </body>
</html>

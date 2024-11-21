<!DOCTYPE html>
<html lang="{{ str_replace('_', '-', app()->getLocale()) }}">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Meu Restaurante</title>

    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">


    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/menu.css') }}" rel="stylesheet">
    <link href="{{ asset('css/forms.css') }}" rel="stylesheet">


</head>

<body class="font-sans antialiased">


    <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Prato</a>
    </nav>

    <section>
        
        @if( !empty($dado))
        {{$dado}}
        @endif
        
        <div class="form-container">
            <h2>Cadastro de produtos</h2>
            <form action="/produtos/cadastrar" method="post">
                @csrf
                <div class="form-group">
                    <label for="formNomeProduto">Nome Produto</label>
                    <input type="text" id="formNomeProduto" name="formNomeProduto">
                </div>

                <div class="form-group">
                    <label for="formQtdProduto">Quantidade de Pratos Feito</label>
                    <input type="text" id="formQtdProduto" name="formQtdProduto">
                </div>

                <div class="form-group">
                    <label for="formValorProduto">Valor Produto</label>
                    <input type="text" id="formValorProduto" name="formValorProduto">
                </div>

                <input type="submit" value="Cadastrar" class="submit-btn">
            </form>
        </div>
    </section>
</body>

</html>
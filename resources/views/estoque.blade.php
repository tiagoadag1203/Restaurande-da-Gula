<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estoque</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link href="{{ asset('css/menu.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Estoque de Ingredientes</h1>

        <nav>
        <a href="/">Início</a>
        <a href="estoque/cadastrar">Cadastrar um novo Ingrediente</a>
        </nav>


        <table class="table table-bordered table-striped mt-4">
            <thead>
                <tr>
                    <th>Id</th>
                    <th>Nome</th>
                    <th>Quantidade</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($ingredientes as $ingrediente)
                    <tr>
                        <td>{{ $ingrediente->id_ingrediente }}</td>
                        <td>{{ $ingrediente->nome }}</td>
                        <td>{{ $ingrediente->quantidade }}</td>
                    </tr>
                @endforeach

                @if(session('success'))
             <div class="alert alert-success">
                 {{ session('success') }}
             </div>
            @endif 
            </tbody>
        </table>
    </div>
</body>
</html>

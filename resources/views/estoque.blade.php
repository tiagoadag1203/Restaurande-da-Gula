<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estoque</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Estoque de Ingredientes</h1>

        <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Produto</a>
        <a href="cardapio">Ver os pratos</a>
        <a href="cadastroFornecedores">Cadastrar um novo fornecedor</a>
        <a href="Fornecedores">Fornecedor</a>
    </nav>


        <table class="table table-bordered table-striped mt-4">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Nome</th>
                </tr>
            </thead>
            <tbody>
                @foreach ($ingredientes as $ingrediente)
                    <tr>
                        <td>{{ $ingrediente->id_ingrediente }}</td>
                        <td>{{ $ingrediente->nome }}</td>
                    </tr>
                @endforeach
            </tbody>
        </table>
    </div>
</body>
</html>

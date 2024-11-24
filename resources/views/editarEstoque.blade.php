<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Ingrediente</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link href="{{ asset('css/Edita_Forn.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h1 class="text-center">Editar Ingrediente</h1>
        <form action="{{ route('estoque.update', $ingrediente->id_ingrediente) }}" method="POST">
            @csrf
            @method('PUT')

            <div class="mb-3">
                <label for="nome" class="form-label">Nome:</label>
                <input type="text" name="nome" id="nome" class="form-control" value="{{ $ingrediente->nome }}" required>
            </div>

            <div class="mb-3">
                <label for="quantidade" class="form-label">Quantidade:</label>
                <input type="number" name="quantidade" id="quantidade" class="form-control" value="{{ $ingrediente->quantidade }}" required>
            </div>

            <button type="submit" class="btn">Atualizar</button>
            <a href="{{ route('estoque.index') }}" class="btn btn-warning">Voltar</a>
        </form>
    </div>
</body>
</html>

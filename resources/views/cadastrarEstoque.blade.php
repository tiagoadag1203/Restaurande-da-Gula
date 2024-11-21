<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastrar Item no Estoque</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <link href="{{ asset('css/menu.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>

    <nav>
        <a href="/">Início</a>
        <a href="estoque">Estoque</a>
        </nav>


        @if(session('success'))
        <div class="alert alert-success">
            {{ session('success') }}
        </div>
    @endif

    @if ($errors->any())
        <div class="alert alert-danger">
            <ul>
                @foreach ($errors->all() as $error)
                    <li>{{ $error }}</li>
                @endforeach
            </ul>
        </div>
    @endif

    <div class="container mt-5">
        <h1 class="text-center">Cadastrar Novo Item no Estoque</h1>
        <form action="{{ route('estoque.store') }}" method="POST" class="mt-4">
            @csrf
            <div class="mb-3">
                <label for="nome" class="form-label">Nome do Ingrediente</label>
                <input type="text" id="nome" name="nome" class="form-control" placeholder="Ex.: Tomate" required>
            </div>
            <div class="mb-3">
                <label for="quantidade" class="form-label">quantidade</label>
                <input type="text" id="Quantidade" name="quantidade" class="form-control" placeholder="Ex.: 10" required>
            </div>

            <div class="text-center">
                <button type="submit" class="btn btn-primary">Cadastrar</button>
            </div>
        </form>
    </div>
</body>
</html>

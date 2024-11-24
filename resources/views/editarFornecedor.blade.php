<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Editar Fornecedor</title>

    <link href="{{ asset('css/Edita_Forn.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>
    <h1>Editar Fornecedor</h1>

    <form action="{{ url('/fornecedores/atualizar/' . $fornecedor->id_fornecedor) }}" method="POST">
        @csrf
        <label for="nome">Nome:</label>
        <input type="text" name="nome" value="{{ $fornecedor->nome }}" required>
        <br>

        <label for="cpf_cnpj">CPF/CNPJ:</label>
        <input type="text" name="cpf_cnpj" value="{{ $fornecedor->cpf_cnpj }}" required>
        <br>

        <label for="endereco">Endereço:</label>
        <input type="text" name="endereco" value="{{ $fornecedor->endereco }}" required>
        <br>

        <button type="submit">Atualizar</button>
        <a  href="/Fornecedores" class="btn">Voltar</a>
    </form>
</body>
</html>

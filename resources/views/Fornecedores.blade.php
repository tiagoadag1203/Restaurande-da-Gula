<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lista de Fornecedores</title>
    <link href="{{ asset('css/fornecedores.css') }}" rel="stylesheet">
    <link href="{{ asset('css/menu.css') }}" rel="stylesheet">
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
</head>
<body>
    <h1>Lista de Fornecedores</h1>

    <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Produto</a>
        <a href="cardapio">Ver os pratos</a>
        <a href="cadastroFornecedores">Cadastrar um novo fornecedor</a>
        <a href="Fornecedores">Fornecedor</a>
    </nav>


<table>
    <th>id</th>
    <th>Nome</th>
    <th>Cpf/Cnpj</th>
    <th>Endereço</th>
    
    @foreach ($fornecedor as $for)
    <tr>
        <td>{{ $for->id_fornecedor }}</td>
        <td>{{ $for->nome }}</td>
        <td>{{ $for->cpf_cnpj }}</td>
        <td>{{ $for->endereco }}</td>
    </tr>
@endforeach
</table>
        </tbody>
</body>
</html>

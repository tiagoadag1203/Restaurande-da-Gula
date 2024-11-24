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
        <a href="cadastroFornecedores">Cadastrar um novo fornecedor</a>
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
        <td>
            <a href="{{ url('/fornecedores/editar/' . $for->id_fornecedor) }}" class="btn">
            Editar
            </a>
        </td>
    </tr>
@endforeach
</table>
        </tbody>
</body>
</html>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registro de Fornecedores</title>
    <link href="{{ asset('css/style.css') }}" rel="stylesheet">
    <link href="{{ asset('css/menu.css') }}" rel="stylesheet">
    <link href="{{ asset('css/forms.css') }}" rel="stylesheet">
</head>

<body>
    <nav>
        <a href="/">Início</a>
        <a href="produtos">Cadastrar Novo Prato</a>
        <a href="cardapio">Ver os pratos</a>
        <a href="cadastroFornecedores">Cadastrar um novo fornecedor</a>
        <a href="Fornecedores">Fornecedor</a>
    </nav>

    <div class="form-container">
        <h2>Registro de Fornecedores</h2>
        <form action="/cadastroFornecedores/cadastrar" method="post">
            @csrf <!-- Adicione o token CSRF para proteção -->
            <div class="form-group">
                <label for="NomeFornecedor">Nome do Fornecedor:</label>
                <input type="text" id="NomeFornecedor" name="nomeFornecedor" required>
            </div>

            <div class="form-group">
                <label for="CPFCPNJFornecedor">CPF ou CNPJ:</label>
                <input type="text" id="CPFCPNJFornecedor" name="cpfCnpj" required>
            </div>

            <div class="form-group">
                <label for="EnderecoFornecedor">Endereço:</label>
                <input type="text" id="EnderecoFornecedor" name="endereco" required>
            </div>

            <div class="form-group">
                <label for="tipoProduto">Tipo de Produto Fornecido:</label>
                <input type="text" id="tipoProduto" name="tipoProduto" required>
            </div>

            <div class="form-group">
                <label for="quantidade">Quantidade Fornecida:</label>
                <input type="number" id="quantidade" name="quantidade" min="1" required>
            </div>

            <div class="form-group">
                <label for="tipoContato">Tipo de Contato: Email / Telefone</label>
                <input type="text" id="tipoContato" name="tipoContato" required>
            </div>

            <div class="form-group">
                <label for="valorContato">Número ou Email:</label>
                <input type="text" id="valorContato" name="valorContato" required>
            </div>

            <div class="form-group">
                <input type="submit" value="Cadastrar" class="submit-btn">
            </div>
        </form>
    </div>
</body>

</html>
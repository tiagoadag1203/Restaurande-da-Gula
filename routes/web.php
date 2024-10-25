<?php

use Illuminate\Support\Facades\Route;
use App\Models\Produtos;
use App\Models\Fornecedor;
use Illuminate\Http\Request;

Route::get('/', function () {
    return view('welcome');
}); //Pagina inicial


Route::get('/produtos', function () {
    return view('produtos');
});//Cadastrar um novo produto *EX = "Lanche forno"

Route::post('/produtos/cadastrar', function(Request $request) {
    $produtos = new Produtos();   
    $produtos->gravar($request->formNomeProduto,$request->formFornecedorProduto);
    return view('produtos',["dado"=> "dados passados via post"]);
});



Route::get('/user/{id}', function (string $id) {
    return 'User '.$id;
});


Route::get('/cardapio', function () {
        $produtos = new Produtos();   
        $produtos= $produtos->listarProdutos();         
    return view('pratos',["listaProdutos"=>$produtos]);
});//Lista dos produtos cadastrados


//FORNECEDOR

Route::get('/cadastroFornecedores', function () {
    return view('Registro_Fornecedor');
});//Cadastrar um novo fornecedor


Route::post('/cadastroFornecedores/cadastrar', function(Request $request) {
    $fornecedor = new Fornecedor();   
    $fornecedor->cadastrarFornecedor($request->nomeFornecedor, $request->cpfCnpj,
     $request->endereco, $request->tipoProduto, $request->quantidade, 
     $request->tipoContato, $request->valorContato               
    );
    return view('Registro_Fornecedor',["dado"=> "dados passados via post"]);
});

//FORNECEDOR
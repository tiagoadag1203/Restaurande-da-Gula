<?php

use App\Http\Controllers\EstoqueController;
use Illuminate\Support\Facades\Route;
use App\Models\Pratos;
use App\Models\Fornecedor;
use Illuminate\Http\Request;

Route::get('/', function () {
    return view('welcome');
}); 


Route::get('/produtos', function () {
    return view('produtos');
});//Cadastrar um novo produto *EX = "Lanche forno"

Route::get('/Fornecedores', function () {
    return view('Fornecedores');
});//Visualizar os fornecedores


Route::get('/user/{id}', function (string $id) {
    return 'User '.$id;
});


Route::get('/cardapio', function () {
    $pratos = new Pratos();   
    $listarPratos = $pratos->listarPratos();         
    return view('pratos', ["listarPratos" => $listarPratos]);
});//Lista dos produtos cadastrados

//FORNECEDOR

Route::get('/Fornecedores', function () {
    $fornecedor = new Fornecedor();   
    $fornecedores = $fornecedor->listarFornecedores();         
    return view('Fornecedores', ["fornecedor" => $fornecedores]);
});

//FORNECEDOR

Route::get('/cadastroFornecedores', function () {
    return view('Registro_Fornecedor');
});//Cadastrar um novo fornecedor



Route::post('/produtos/cadastrar', function(Request $request) {
    $pratos = new Pratos();   
    $pratos->gravar($request->formNomeProduto,$request->formValorProduto);
    return view('pratos',["dado"=> "dados passados via post"]);
});//Cadastrar um novo produto




Route::post('/cadastroFornecedores/cadastrar', function(Request $request) {
    $fornecedor = new Fornecedor();   
    $fornecedor->cadastrarFornecedor($request->nomeFornecedor, $request->cpfCnpj,
     $request->endereco, $request->tipoProduto, $request->quantidade, 
     $request->tipoContato, $request->valorContato               
    );
    return view('Registro_Fornecedor',["dado"=> "dados passados via post"]);
});


Route::get('/estoque', [EstoqueController::class, 'index'])->name('estoque.index');


Route::get('/estoque/cadastrar', [EstoqueController::class, 'create'])->name('estoque.create');

// Processar o formulário
Route::post('/estoque', [EstoqueController::class, 'store'])->name('estoque.store');
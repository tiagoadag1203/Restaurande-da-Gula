<?php

use App\Http\Controllers\EstoqueController;
use Illuminate\Support\Facades\Route;
use App\Models\Pratos;
use App\Models\Fornecedor;
use Illuminate\Http\Request;

// Rota inicial
Route::get('/', function () {
    return view('welcome');
});

// Produtos
Route::get('/produtos', function () {
    return view('produtos');
}); // Cadastrar um novo produto

// Fornecedores
Route::get('/Fornecedores', function () {
    $fornecedor = new Fornecedor();   
    $fornecedores = $fornecedor->listarFornecedores();         
    return view('Fornecedores', ["fornecedor" => $fornecedores]);
});

// Cadastro de fornecedores
Route::get('/cadastroFornecedores', function () {
    return view('Registro_Fornecedor');
}); // Cadastrar um novo fornecedor

Route::post('/cadastroFornecedores/cadastrar', function(Request $request) {
    $fornecedor = new Fornecedor();   
    $fornecedor->cadastrarFornecedor(
        $request->nomeFornecedor, 
        $request->cpfCnpj,
        $request->endereco, 
        $request->tipoProduto, 
        $request->quantidade, 
        $request->tipoContato, 
        $request->valorContato
    );
    return view('Registro_Fornecedor', ["dado" => "dados passados via post"]);
});

// Cardápio
Route::get('/cardapio', function () {
    $pratos = new Pratos();   
    $listarPratos = $pratos->listarPratos();         
    return view('pratos', ["listarPratos" => $listarPratos]);
}); // Lista dos produtos cadastrados

Route::post('/produtos/cadastrar', function(Request $request) {
    $pratos = new Pratos();   
    $pratos->gravar($request->formNomeProduto, $request->formValorProduto);
    return view('pratos', ["dado" => "dados passados via post"]);
}); // Cadastrar um novo produto

// Rotas relacionadas ao estoque
Route::get('/estoque', [EstoqueController::class, 'index'])->name('estoque.index'); // Listar estoque
Route::get('/estoque/cadastrar', [EstoqueController::class, 'create'])->name('estoque.create'); // Formulário de cadastro
Route::post('/estoque', [EstoqueController::class, 'store'])->name('estoque.store'); // Processar cadastro

// Editar estoque
Route::get('/estoque/editar/{id}', [EstoqueController::class, 'edit'])->name('estoque.edit'); // Formulário de edição
Route::put('/estoque/atualizar/{id}', [EstoqueController::class, 'update'])->name('estoque.update');

// Editar fornecedor
Route::get('/fornecedores/editar/{id}', function ($id) {
    $fornecedor = DB::table('fornecedor')->where('id_fornecedor', $id)->first();
    return view('editarFornecedor', ['fornecedor' => $fornecedor]);
})->name('fornecedor.editar');

Route::post('/fornecedores/atualizar/{id}', function (Request $request, $id) {
    DB::table('fornecedor')
        ->where('id_fornecedor', $id)
        ->update([
            'nome' => $request->input('nome'),
            'cpf_cnpj' => $request->input('cpf_cnpj'),
            'endereco' => $request->input('endereco'),
        ]);

    return redirect('/Fornecedores')->with('success', 'Fornecedor atualizado com sucesso!');
});

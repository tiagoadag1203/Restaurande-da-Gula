<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Ingrediente;

class EstoqueController extends Controller
{
    // Exibe a lista de ingredientes no estoque
    public function index()
    {
        $ingredientes = Ingrediente::all();
        return view('estoque', compact('ingredientes'));
    }

    // Exibe o formulário para cadastro de um novo ingrediente
    public function create()
    {
        return view('cadastrarEstoque');  // Certifique-se de que o arquivo 'cadastrarEstoque.blade.php' existe
    }

    // Armazena o novo ingrediente no banco de dados
    public function store(Request $request)
    {
        // Valida os dados do formulário
        $validatedData = $request->validate([
            'nome' => 'required|string|max:100',
            'quantidade' => 'required|numeric|min:0',
        ]);

        // Cria o novo ingrediente no banco de dados
        Ingrediente::create($validatedData);

        // Redireciona para a lista de estoque com uma mensagem de sucesso
        return redirect()->route('estoque.index')->with('success', 'Ingrediente cadastrado com sucesso!');
    }

    // Exibe o formulário para editar um ingrediente
    public function edit($id)
    {
        $ingrediente = Ingrediente::where('id_ingrediente', $id)->firstOrFail();
        return view('editarEstoque', compact('ingrediente'));
    }

    // Atualiza o ingrediente no banco de dados
    public function update(Request $request, $id)
    {
        $validatedData = $request->validate([
            'nome' => 'required|string|max:100',
            'quantidade' => 'required|numeric|min:0',
        ]);

        Ingrediente::where('id_ingrediente', $id)->update($validatedData);

        return redirect()->route('estoque.index')->with('success', 'Ingrediente atualizado com sucesso!');
    }
}

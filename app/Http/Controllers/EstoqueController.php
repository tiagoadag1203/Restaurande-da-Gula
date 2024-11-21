<?php

namespace App\Http\Controllers;


use Illuminate\Http\Request;
use App\Models\Ingrediente;

class EstoqueController extends Controller
{
    public function index()
    {
       
        $ingredientes = Ingrediente::all();
     
        
        return view('estoque', compact('ingredientes'));
    }



    public function create()
    {
        return view('cadastrarEstoque');
    }

    // Processa o formulário e salva o item no banco de dados
    public function store(Request $request)
    {
        // Valida os dados do formulário
        $validatedData = $request->validate([
            'nome' => 'required|string|max:100',
            'quantidade' => 'required|numeric|min:0',
        ]);

        // Cria um novo registro no banco de dados
        Ingrediente::create($validatedData);

        // Redireciona para a lista de estoque com mensagem de sucesso
        return redirect()->route('estoque.index')->with('success', 'Ingrediente cadastrado com sucesso!');
    }



}


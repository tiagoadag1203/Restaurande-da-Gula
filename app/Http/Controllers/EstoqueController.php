<?php

namespace App\Http\Controllers;

use App\Models\Ingrediente;

class EstoqueController extends Controller
{
    public function index()
    {
        // Busca todos os itens do estoque
        $ingredientes = Ingrediente::all();

        // Retorna a view diretamente
        return view('estoque', compact('ingredientes'));
    }
}

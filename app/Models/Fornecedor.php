<?php
namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Fornecedor extends Model {
    public $nome;
    public $endereco;
    public $cpfCnpj;


    public function cadastrarFornecedor($nome, $cpfCnpj, $endereco, $tipoProduto, $quantidade, $tipoContato, $valorContato) {
        try {
            DB::beginTransaction();
    
            DB::insert('INSERT INTO fornecedor (nome, cpf_cnpj, endereco) VALUES (?, ?, ?)', 
                [$nome, $cpfCnpj, $endereco]);
            
            $fornecedorId = DB::getPdo()->lastInsertId();
    
            DB::insert('INSERT INTO contato_fornecedor (id_fornecedor, tipo, valor) VALUES (?, ?, ?)', 
                [$fornecedorId, $tipoContato, $valorContato]);
    
            DB::insert('INSERT INTO produto_fornecido (id_fornecedor, tipo_produto, quantidade) VALUES (?, ?, ?)', 
                [$fornecedorId, $tipoProduto, $quantidade]);
    
            DB::commit();
        } catch (\Exception $e) {
            DB::rollBack();
            throw $e;
        }
    }
    

    public function listarFornecedores() {
        return DB::select('SELECT * FROM fornecedor ORDER BY id_fornecedor DESC');
    }


    public function getFornecedor($idFornecedor) {
        return DB::select('SELECT * FROM fornecedor WHERE id_fornecedor = ?', [$idFornecedor]);
    }
}
?>

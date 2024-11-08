<?php
namespace App\Models;
use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;

class Pratos extends Model {
    public $nome;
    public $id_prato;
    public $descricaoProduto;

    public function getPrato($idprd){
        return "produto encontrado";
    }

    
    public function gravar ($nmPrato,$ValorProduto){
        DB::insert('insert into prato (nome,preco) values (?,?)', [$nmPrato,$ValorProduto]);
        
    }
    

    public function listarPratos (){
        $listaProdutosDoBanco = DB::select('select * from prato order by id_prato DESC');
        return $listaProdutosDoBanco;
    }

}
?>

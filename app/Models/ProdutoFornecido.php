<?php
namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ProdutoFornecido extends Model {
    protected $table = 'produto_fornecido'; 

    public function fornecedor() {
        return $this->belongsTo(Fornecedor::class, 'id_fornecedor');
    }
}

?>

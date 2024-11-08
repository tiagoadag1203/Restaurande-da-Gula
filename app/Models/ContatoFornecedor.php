<?php
namespace App\Models;

use Illuminate\Support\Facades\DB;
use Illuminate\Database\Eloquent\Model;


class ContatoFornecedor extends Model {
    protected $table = 'contato_fornecedor'; 

    public function fornecedor() {
        return $this->belongsTo(Fornecedor::class, 'id_fornecedor');
    }
}

?>

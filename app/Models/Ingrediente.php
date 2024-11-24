<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ingrediente extends Model
{
    use HasFactory;

    protected $table = 'ingrediente';

    protected $primaryKey = 'id_ingrediente';

    
    protected $fillable = [
        'nome',
        'quantidade'
    ];
    

    public $timestamps = false;
}

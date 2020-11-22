<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $perguntas_id
 * @property string $ordem
 * @property string $texto
 * @property boolean $correta
 * @property Pergunta $pergunta
 * @property Respondida[] $respondidas
 */
class Resposta extends Model
{
    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * Indicates if the IDs are auto-incrementing.
     * 
     * @var bool
     */
    public $incrementing = false;

    /**
     * @var array
     */
    protected $fillable = ['perguntas_id', 'ordem', 'texto', 'correta'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function pergunta()
    {
        return $this->belongsTo('App\Models\Pergunta', 'perguntas_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function respondidas()
    {
        return $this->hasMany('App\Models\Respondida', 'respostas_id');
    }
}

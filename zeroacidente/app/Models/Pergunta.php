<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $quizz_id
 * @property string $enunciado
 * @property string $texto
 * @property int $ordem
 * @property Quiz $quiz
 * @property Respondida[] $respondidas
 * @property Resposta[] $respostas
 */
class Pergunta extends Model
{
    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['quizz_id', 'enunciado', 'texto', 'ordem'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function quiz()
    {
        return $this->belongsTo('App\Models\Quiz');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function respondidas()
    {
        return $this->hasMany('App\Models\Respondida', 'perguntas_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function respostas()
    {
        return $this->hasMany('App\Models\Resposta', 'perguntas_id');
    }

}

<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property integer $users_id
 * @property integer $respostas_id
 * @property integer $perguntas_id
 * @property boolean $correta
 * @property string $created_at
 * @property string $updated_at
 * @property Pergunta $pergunta
 * @property Resposta $resposta
 * @property User $user
 */
class Respondida extends Model
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
    protected $fillable = ['users_id', 'respostas_id', 'perguntas_id', 'correta', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function pergunta()
    {
        return $this->belongsTo('App\Models\Pergunta', 'perguntas_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function resposta()
    {
        return $this->belongsTo('App\Models\Resposta', 'respostas_id');
    }

    /**
     * @return \Illuminate\Database\Eloquent\Relations\BelongsTo
     */
    public function user()
    {
        return $this->belongsTo('App\Models\User', 'users_id');
    }
}

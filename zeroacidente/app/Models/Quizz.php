<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

/**
 * @property integer $id
 * @property string $nome
 * @property string $descricao
 * @property string $dataInicio
 * @property string $dataFim
 * @property string $created_at
 * @property string $updated_at
 * @property Pergunta[] $perguntas
 */
class Quizz extends Model
{
    /**
     * The table associated with the model.
     * 
     * @var string
     */
    protected $table = 'quizzes';

    /**
     * The "type" of the auto-incrementing ID.
     * 
     * @var string
     */
    protected $keyType = 'integer';

    /**
     * @var array
     */
    protected $fillable = ['nome', 'descricao', 'dataInicio', 'dataFim', 'created_at', 'updated_at'];

    /**
     * @return \Illuminate\Database\Eloquent\Relations\HasMany
     */
    public function perguntas()
    {
        return $this->hasMany('App\Models\Pergunta');
    }

    public function proximaPergunta($user_id, $quizz_id)
    {
        $pergunta = Pergunta::fromQuery('SELECT p.* FROM perguntas p
            WHERE p.id NOT IN (
                SELECT p1.id FROM perguntas p1
                INNER JOIN respondidas r1 ON p1.id = r1.perguntas_id
                WHERE r1.users_id = ' . $user_id . '
                AND p1.quizz_id = ' . $quizz_id . '
            )
            AND p.quizz_id = ' . $quizz_id . '
            ORDER BY p.ordem
            LIMIT 0, 1')->first();

        return $pergunta;
    }


    

}

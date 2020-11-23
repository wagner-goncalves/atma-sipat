<?php

namespace App\Http\Controllers;

use App\Models\Quizz;
use App\Models\Pergunta;
use App\Models\Resposta;
use App\Models\Respondida;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class QuizzController extends Controller
{

    public function __construct()
    {
        $this->middleware('role:Votante|Admin');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index(Request $request)
    {
        $maisQuiz = $this->existemMaisQuizz();
        return view('quizzes.index', compact('maisQuiz'));
    }

    public function responder()
    {

        $quizz = Quizz::where('dataInicio', '<=', date("Y-m-d H:i:s"))
            ->where('dataFim', '>=', date("Y-m-d H:i:s"))
            ->first();

        if(!$quizz) return view('quizzes.aguarde');

        $pergunta = $quizz->proximaPergunta(Auth::id(), $quizz->id);
        
        if(!$pergunta) return redirect('quizzes/resumo');

        $respostas = $pergunta->respostas()->get();

        $quantidadePerguntasDia = $this->quantidadePerguntasDia();
        $quantidadeRespostasDia = $this->quantidadeRespostasDia() + 1;
        $quantidadeRespostasCorretasDia = $this->quantidadeRespostasCorretasDia();

        return view('quizzes.responder', compact('quizz', 'pergunta', 'respostas',  'quantidadePerguntasDia',  'quantidadeRespostasDia',  'quantidadeRespostasCorretasDia', ));
    }  
    
    public function resumo()
    {
        $resumoFinal = "";
        $resumos = $this->resumoParticipacao(Auth::id());
        $existemMaisQuizzes = $this->existemMaisQuizz();
        $quizRespondido = $this->contaQuizRespondido(Auth::id());

        if(!$existemMaisQuizzes) $resumoFinal = $this->resumoFinal(Auth::id());

        return view('quizzes.resumo', compact('resumos', 'existemMaisQuizzes', 'resumoFinal', 'quizRespondido'));
    }

    public function aguarde()
    {
        return view('quizzes.aguarde');
    }

    public function registrar(Request $request)
    {

        $resposta_id = $request->input('resposta');
        $pergunta_id = $request->input('pergunta');
        $quizz_id = $request->input('quizz');
        $user_id = Auth::id();

       if(!$this->perguntaDaVez($user_id, $quizz_id, $pergunta_id)){
            return response()->json(['success'=> false, 'message' => 'Acesso não autorizado.'], 401);
       }

       $respostaEstaCorreta = $this->respostaCorreta($pergunta_id, $resposta_id);

       $respondida = Respondida::firstOrCreate([
        'users_id' => $user_id, 
        'respostas_id' => $resposta_id, 
        'perguntas_id' => $pergunta_id, 
        'correta' => ($respostaEstaCorreta ? 1 : 0), 
        ]);

        $pergunta = Pergunta::find($pergunta_id);
        $respostaCorreta = Resposta::where('perguntas_id', '=', $pergunta_id)
            ->where('correta', '=', 1)->first();

        $mensagem = 'Parabéns, você acertou a resposta!';
        if(!$respostaEstaCorreta){
            $mensagem = 'Que pena! A resposta correta é:<br/> <b>Letra ' . $respostaCorreta->ordem . ": " . $respostaCorreta->texto . "</b>";
        } ;

        
        return response()->json([ 
            'success'=> true,
            'message' => 'Resposta registrada com sucesso.',
            'avaliacao' => [
                'correct' => $respostaEstaCorreta,
                'enunciado' => $pergunta->enunciado,
                'message' => $mensagem,
                'ultimaResposta' => $this->ultimaRespostaDia()
                ],
            ]);
    }

    private function existemMaisQuizz(){
        $quizzes = Quizz::where('dataInicio', '>', date('Y-m-d H:i:s'))->get();
        return $quizzes->count() > 0;
    }

    private function respostaCorreta($pergunta_id, $resposta_id){
        $respostas = Resposta::where('perguntas_id', '=', $pergunta_id)
            ->where('id', '=', $resposta_id)
            ->where('correta', '=', 1)
            ->first();
        if($respostas) return true;
        return false;
    }

    private function perguntaDaVez($user_id, $quizz_id, $pergunta_id){
        $quizz = new Quizz();
        $proximaPergunta = $quizz->proximaPergunta($user_id, $quizz_id);
        return $proximaPergunta->id == $pergunta_id;
    }

    public function quantidadePerguntasDia(){
        $quizz = DB::table('quizzes')
        ->select(array(DB::raw('COUNT(*) as total')))
        ->join('perguntas', 'perguntas.quizz_id', '=', 'quizzes.id')
        ->where('dataInicio', '<=', DB::raw('NOW()'))
        ->where('dataFim', '>=', DB::raw('NOW()'))
        ->first();
        return  $quizz->total;
    }    

    public function quantidadeRespostasDia(){
        $quizz = DB::table('quizzes')
        ->select(array(DB::raw('COUNT(*) as total')))
        ->join('perguntas', 'perguntas.quizz_id', '=', 'quizzes.id')
        ->join('respondidas', 'respondidas.perguntas_id', '=', 'perguntas.id')
        ->where('dataInicio', '<=', DB::raw('NOW()'))
        ->where('dataFim', '>=', DB::raw('NOW()'))
        ->where('users_id', '=', Auth::id())
        ->first();
        return  $quizz->total;
    }    
    

    public function quantidadeRespostasCorretasDia(){
        $quizz = DB::table('quizzes')
        ->select(array(DB::raw('COUNT(*) as total')))
        ->join('perguntas', 'perguntas.quizz_id', '=', 'quizzes.id')
        ->join('respondidas', 'respondidas.perguntas_id', '=', 'perguntas.id')
        ->where('dataInicio', '<=', DB::raw('NOW()'))
        ->where('dataFim', '>=', DB::raw('NOW()'))
        ->where('correta', '=', 1)
        ->where('users_id', '=', Auth::id())
        ->first();
        return  $quizz->total;
    }      

    private function ultimaRespostaDia(){
        return $this->quantidadePerguntasDia() == $this->quantidadeRespostasDia();
    }

    private function resumoParticipacao($user_id){
        $sql = "SELECT q.id, q.nome, COUNT(p.id) AS perguntas, 
        (
            SELECT COUNT(r1.perguntas_id) FROM respondidas r1
            INNER JOIN perguntas p1 ON p1.id = r1.perguntas_id
            WHERE p1.quizz_id = q.id 
            AND r1.users_id = " . $user_id . "
        ) AS respostas, 
        (
            SELECT COUNT(r1.perguntas_id) FROM respondidas r1
            INNER JOIN perguntas p1 ON p1.id = r1.perguntas_id
            WHERE p1.quizz_id = q.id AND r1.correta = 1
            AND r1.users_id = " . $user_id . "
        ) AS corretas
        FROM quizzes q
        INNER JOIN perguntas p ON p.quizz_id = q.id
        WHERE q.dataInicio < NOW()
        GROUP BY q.id";

        return DB::select($sql);
    }

    public function resumoFinal($user_id){
        $sql = "SELECT q.id, q.nome, COUNT(p.id) AS perguntas, 
        (
            SELECT COUNT(r1.perguntas_id) FROM respondidas r1
            INNER JOIN perguntas p1 ON p1.id = r1.perguntas_id
            WHERE r1.users_id = " . $user_id . "
        ) AS respostas, 
        (
            SELECT COUNT(r1.perguntas_id) FROM respondidas r1
            INNER JOIN perguntas p1 ON p1.id = r1.perguntas_id
            WHERE r1.correta = 1
            AND r1.users_id = " . $user_id . "
        ) AS corretas
        FROM quizzes q
        INNER JOIN perguntas p ON p.quizz_id = q.id";
        return DB::select($sql)[0];
    }


    public function contaQuizRespondido($user_id){
        $sql = "SELECT COUNT(*) as qtdeQuiz FROM (
            SELECT q.id FROM quizzes q
            INNER JOIN perguntas p ON p.quizz_id = q.id
            INNER JOIN respondidas r ON r.perguntas_id = p.id
            WHERE r.users_id = " . $user_id . "
            GROUP BY q.id
        ) AS qtdeQuiz";

        return DB::select($sql)[0]->qtdeQuiz;
    }



    

    public function posicaoRanking($user_id){
        $sql = "SELECT id, NAME, corretas, FIND_IN_SET( 
                corretas, (SELECT GROUP_CONCAT(corretas ORDER BY corretas DESC) FROM vresumo )
            ) AS posicao
        FROM vresumo
        WHERE id = " . intval($user_id);
        $ranking = DB::select($sql);

        if(count($ranking) > 0) return DB::select($sql)[0];

        return null;
    }    
}

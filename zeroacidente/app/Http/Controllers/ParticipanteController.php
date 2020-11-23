<?php

namespace App\Http\Controllers;
use App\Models\Ranking;
use App\Models\User;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ParticipantesQueryExport;
use Illuminate\Support\Facades\DB;

class ParticipanteController extends QuizzController
{
    function __construct()
    {
        $this->middleware('role:Admin');
    }

    public function index(Request $request)
    {
        $filter = $request->query('filter');
        $participantes = "";

        if (!empty($filter)) {
            $participantes = Ranking::sortable()
                ->where('name', 'like', '%'.$filter.'%')
                ->orWhere('enterprise', 'like', '%'.$filter.'%')
                ->orderBy('created_at', 'desc')
                ->paginate(2);
        } else {
            $participantes = Ranking::sortable()->orderBy('created_at', 'desc')->paginate(10);
        }

        return view('participantes.index',compact('participantes', 'filter'))
            ->with('i', (request()->input('page', 1) - 1) * 10);
    }

    public function show($id)
    {
        $participante = User::find($id);
        $resumo = $this->resumoFinal($id);
        $posicao = $this->posicaoRanking($id);

        $sql = "SELECT q.nome, p.enunciado, re.texto, r.correta FROM users u
        INNER JOIN respondidas r ON u.id = r.users_id
        INNER JOIN perguntas p ON p.id = r.perguntas_id
        INNER JOIN quizzes q ON q.id = p.quizz_id
        INNER JOIN respostas re ON re.id = r.respostas_id
        WHERE r.users_id = " . $id;

        $respostas = DB::select($sql);


        return view('participantes.show',compact('participante','resumo', 'posicao', 'respostas'));
    }

    public function export()
    {
        return Excel::download(new ParticipantesQueryExport(), 'Participantes_SIPAT_2020.xls');
    }    
}

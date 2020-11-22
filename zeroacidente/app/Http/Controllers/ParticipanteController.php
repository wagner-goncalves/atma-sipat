<?php

namespace App\Http\Controllers;
use App\Models\Ranking;
use App\Models\User;
use Illuminate\Http\Request;
use Maatwebsite\Excel\Facades\Excel;
use App\Exports\ParticipantesQueryExport;

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
            $participantes = Ranking::sortable()->orderBy('created_at', 'desc')->paginate(2);
        }

        return view('participantes.index',compact('participantes', 'filter'))
            ->with('i', (request()->input('page', 1) - 1) * 2);
    }

    public function show($id)
    {
        $participante = User::find($id);
        $resumo = $this->resumoFinal($id);
        $posicao = $this->posicaoRanking($id);
        return view('participantes.show',compact('participante','resumo', 'posicao'));
    }

    public function export()
    {
        return Excel::download(new ParticipantesQueryExport(), 'Participantes_SIPAT_2020.xls');
    }    
}

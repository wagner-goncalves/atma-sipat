<?php

namespace App\Exports;

use App\Models\Ranking;
use Maatwebsite\Excel\Concerns\FromQuery;
use Maatwebsite\Excel\Concerns\Exportable;
use Maatwebsite\Excel\Concerns\WithHeadings;
use Illuminate\Support\Facades\DB;

class ParticipantesQueryExport implements FromQuery, WithHeadings
{

    use Exportable;

    public function query()
    {
        return Ranking::query()->select('name', 'email', 'enterprise', 'phone', 'respostas', 'corretas', 'posicao');
    }

    public function headings() : array
    {
        return [
            'Nome',
            'E-mail',
            'Empresa',
            'Telefone',
            'Qtde. Respondida',
            'Corretas',
            'Posição no Ranking',
        ];
    }
}

<?php

namespace App\Exports;

use App\Quizz;
use Maatwebsite\Excel\Concerns\FromCollection;

class ResultadosQueryExport implements FromCollection
{
    /**
    * @return \Illuminate\Support\Collection
    */
    public function collection()
    {
        return Quizz::all();
    }
}

@extends('layouts.app')
@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left pb-3">
                <div class="titulo-destaque">
                    <i class="fas fa-users"></i>
                    Participantes SIPAT 2020
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 mb-3">
            <div class="row">
                <div class="col-lg-6 col-sm-12">
                    <div class="form-group">
                        <a href="{{route('participantes.export')}}" class="btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase"><i class="fas fa-file-excel"></i> Exportar lista para Excel</a>
                    </div>  
                </div>
                <div class="col-lg-6 col-sm-12">

                    <form class="form-inline" method="GET" action="{{\Request::getRequestUri()}}">
                        <div class="form-group mb-2">
                          <input type="text" class="form-control form-control-sm" id="filter" name="filter" placeholder="Nome / Empresa" value="{{$filter}}">
                        </div>
                        <button type="submit" class="btn btn-sm btn-link mb-2">Filtrar</button>
                      </form>                         

                </div>
            </div>

            <table class="table table-bordered">
                <tr>
                    <th>ID</th>
                    <th>@sortablelink('name', 'Nome')</th>
                    <th>Empresa</th>
                    <th>E-mail</th>
                    <th>Telefone</th>
                    <th>Respondidas</th>
                    <th>Corretas</th>
                    <th>@sortablelink('posicao', 'Ranking')</th>
                </tr>
                @foreach ($participantes as $participante)
                <tr>
                    <td>{{ ++$i }}</td>
                    <td><a href="{{ route('participantes.show', ['id' => $participante->id]) }}">{{ $participante->name }}</a></td>
                    <td>{{ $participante->enterprise }}</td>
                    <td>{{ $participante->email }}</td>
                    <td>{{ $participante->phone }}</td>
                    <td>{{ $participante->respostas }}</td>
                    <td>{{ $participante->corretas }}</td>
                    <td>{{ $participante->posicao }}</td>
                </tr>
                @endforeach
            </table>
        </div>
    </div>
    <div class="row">
        <div class="col-lg-12 mb-3">        
            {!! $participantes->appends(request()->query())->links() !!}    
        </div>
    </div>    

@endsection
@extends('layouts.app')
<link href="{{ asset('css/card.css') }}" rel="stylesheet">


@section('content')

    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left pb-3">
                <div class="titulo-destaque">
                    <i class="fas fa-user"></i>
                    Detalhar Participante
                </div>
            </div>
            <div class="pull-right">
                <a class="btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase" href="{{ route('participantes.index') }}"><i class="fas fa-chevron-left"></i> Voltar</a>
            </div>            
        </div>
    </div>

    <div class="row d-flex mt-4">
        <div class="col-xl-10 col-md-12">
            <div class="card user-card-full">
                <div class="row m-l-0 m-r-0">
                    <div class="col-sm-4 bg-c-lite-green user-profile">
                        <div class="card-block text-center text-white">
                            <div class="m-b-25"> <img src="https://img.icons8.com/bubbles/100/000000/user.png" class="img-radius" alt="User-Profile-Image"> </div>
                            <h6 class="f-w-600">{{ $participante->name }}</h6>
                            <p>{{ $participante->enterprise }}</p> <i class=" mdi mdi-square-edit-outline feather icon-edit m-t-10 f-16"></i>
                        </div>
                    </div>
                    <div class="col-sm-8">
                        <div class="card-block">
                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Informações</h6>
                            <div class="row">
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Email</p>
                                    <h6 class="text-muted f-w-400">{{ $participante->email }}</h6>
                                </div>
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Telefone</p>
                                    <h6 class="text-muted f-w-400">{{ $participante->phone }}</h6>
                                </div>
                            </div>
                            <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Participação</h6>
                            <div class="row">
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Questões resondidas</p>
                                    <h6 class="text-muted f-w-400">{{ $resumo->respostas }}</h6>
                                </div>
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">Acertos</p>
                                    <h6 class="text-muted f-w-400">{{ $resumo->corretas }}</h6>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-sm-6">
                                    <p class="m-b-10 f-w-600">RANKING</p>
                                    <h6 class="text-muted f-w-400">{{($posicao) ? $posicao->posicao : "Indeterminado"}}</h6>
                                </div>
                            </div>                          
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
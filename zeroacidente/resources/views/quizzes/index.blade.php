@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">

                <div class="titulo-destaque">
                    <i class="fas fa-vote-yea"></i>
                    Bem vindo ao Quiz do programa Zero Acidente – SIPAT 2020
                </div>

            </div>
            <hr />
            <div>
                <p>Com o tema “O que eu posso fazer de diferente”, nossa SIPATMIN 2020 quer incentivar você a tornar o nosso ambiente de trabalho cada vez mais saudável e seguro. Responda ao Quiz e descubra como o seu conhecimento e o seu comportamento é importante para fazer a diferença no nosso dia-a-dia. Boa sorte!</p>

                    <p>

                    @if ($maisQuiz)
                    <a class="btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase" href="{{ route('quizzes.responder') }}"> Responder o quiz do dia</a>    
                    @else
                    <a class="btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase" href="{{ route('quizzes.responder') }}"> Ver o seu resultado</a>    
                    @endif
                    
                </p>
            </div>
        </div>
    </div>
@endsection
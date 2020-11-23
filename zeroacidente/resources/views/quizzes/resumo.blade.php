@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left pb-2">
                <div class="titulo-destaque">
                    <i class="fas fa-vote-yea"></i>
                    Quiz finalizado!
                </div>                 
            </div>
            
            @if (!$existemMaisQuizzes)
            <div class="pull-left pb-2">
                <p class="h4">Parabéns, você completou nosso desafio do Quiz, realizado durante toda a SIPATMIN! Obrigado por fazer parte da nossa equipe e nos ajudar disseminar a saúde e segurança por onde passar. Juntos somos mais fortes!</p>
            </div>            
            <hr />
            <div class="row">
                <div class="col-sm-12">
                    <h2>Resultado final</h2>
                    <h3>Você acertou {{$resumoFinal->corretas}} de {{$resumoFinal->perguntas}} perguntas.</h3>
                    <p>Agradecemos a sua participação no quiz do Programa Zero Acidente - SIPAT 2020
                        <br />Aguarde novas instruções sobre a campanha na unidade e lembre-se de prezar pela sua segurança e dos demais colaboradores no ambiente de trabalho.</p>
                </div>
            </div>
            @else
            <div class="pull-left pb-2">
                <p class="h4">Parabéns, você completou o {{$quizRespondido}}º desafio do Quiz! Você está contribuindo para a nossa meta diária do Zero Acidente! Continue participando durante toda a semana!</p>
            </div>
            @endif
            <a class="btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase" href="{{ route('quizzes') }}"><i class="fas fa-chevron-left"></i>  Voltar</a>

<hr />
            <div>
            @foreach ($resumos as $resumo)
                <div class="row">
                    <div class="col-sm-12 col-lg-4 col-xl-4 align-self-center">
                        <p>
                            {!!$resumo->nome!!}<br />
                            <span class="small"><b>Pergutas:</b> {{$resumo->perguntas}}. 
                                <b>Respostas:</b> {{$resumo->respostas}}. 
                                <b>Acertos:</b> {{$resumo->corretas}}.</span>
                        </p>
                        
                    </div>
                    <div class="col-sm-12 col-lg-8 col-xl-8 align-self-center">
                        <div class="progress" style="height: 30px;">
                            <div class="progress-bar bg-success" role="progressbar" style="width: {{$resumo->corretas / $resumo->perguntas * 100}}%" aria-valuenow="25" aria-valuemin="0" aria-valuemax="100">{{$resumo->corretas}} de {{$resumo->perguntas}}</div>
                        </div>
                    </div>
                </div>
            @endforeach
            </div>

            



        </div>
    </div>
@endsection
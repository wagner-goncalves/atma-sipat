@extends('layouts.app')


@section('content')
    <div class="row">
        <div class="col-lg-12 margin-tb">
            <div class="pull-left">

                <h3>{{ $pergunta->enunciado }}</h3>
            </div>
            <div>
                {{ Form::open(array('route' => 'quizzes.registrar', 'id' => 'registrar-form')) }}
                   <div class="pb-5 pt-3">
                    @foreach ($respostas as $resposta)
                    <div class="form-check">
                        <input class="form-check-input" type="radio" name="resposta_id" id="resposta_id_{{$resposta->id}}" value="{{$resposta->id}}">
                        <label class="form-check-label" for="resposta_id_{{$resposta->id}}">
                            {{$resposta->ordem}}) {{$resposta->texto}}
                        </label>
                      </div>
                    @endforeach
                    </div>

                    <div class="row form-group" style="display:none" id='alert-box'>
                        <div class="col-12 align-self-center">
                            <div class="alert alert-danger col-12" role="alert">
                                <span id="resposta-error"></span>
                              </div>
                            </div>
                    </div>

                    <div class="row form-group">
                        
                        <div class="col-sm-12 col-lg-4 col-xl-3 align-self-center">
                            {{Form::button('Responder', array('class' => 'btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase', 'id' => 'btn-responder'))}}
                        </div>
                        <div class="col-sm-12 col-lg-8 col-xl-9 align-self-center mt-2">
                            <div class="small">{{number_format((float) ($quantidadeRespostasDia - 1) / $quantidadePerguntasDia * 100, 0, '.', '')}}% </div>
                            <div class="progress">
                                <div class="progress-bar bg-success" role="progressbar" style="width: {{($quantidadeRespostasDia - 1) / $quantidadePerguntasDia * 100}}%">Questão {{$quantidadeRespostasDia}} de {{$quantidadePerguntasDia}}</div>
                            </div>
                        </div>
                    </div>

                {{ Form::close() }}
            </div>
        </div>
    </div>


    @if ($message = Session::get('success'))
        <div class="alert alert-success">
            <p>{{ $message }}</p>
        </div>
    @endif

    <script type="text/javascript">

        $( document ).ready(function() {
            $('#result-modal').on('hidden.bs.modal', function (e) {
                location.reload();
            });
        });

        $('#btn-responder').on('click', function(event){
            event.preventDefault();

             var resposta = $("input[name='resposta_id']:checked").val();
             if(!resposta){
                 $('#alert-box').fadeIn();
                 $('#resposta-error').text('Escolha uma opção.');
             } 
             else{
                $('#alert-box').fadeOut();
                $('#resposta-error').text('');
                $('#btn-responder').prop("disabled", true);
                $('#btn-responder').html('<span class="spinner-border spinner-border-sm"></span> Registrando...');

                axios.post('/quizzes/registrar', {
                    'resposta' : resposta,
                    'pergunta' : {{$pergunta->id}},
                    'quizz' : {{$quizz->id}}
                })
                .then(res => {
                    //Abre modal
                    $('#modal-enunciado').text(res.data.avaliacao.enunciado);
                    if(!res.data.avaliacao.correct) $('#modal-correct').html('<div><i class="fas fa-frown fa-3x pb-2"></i></div>');
                    else $('#modal-correct').html('<div><i class="fas fa-smile-beam fa-3x pb-2"></i></div>');
                    $('#modal-message').text(res.data.avaliacao.message);

                    if(res.data.avaliacao.ultimaResposta){
                        $('#btn-proximo').html('Finalizar questionário');

                        $('#result-modal').unbind();
                        $('#result-modal').on('hidden.bs.modal', function (e) {
                            e.preventDefault();
                            location.href = '/quizzes/resumo';
                        });
                    }

                    $('#result-modal').modal();
                    //commit('CREATE_POST', res.data)
                }).catch(err => {
                    console.log(err);
                    $('#btn-responder').prop("disabled", false);
                    $('#btn-responder').html('Responder');
                    $('#alert-box').fadeIn();
                    $('#resposta-error').text('Não conseguimos registrar sua escolha. Por favor, recarregue o aplicativo e tente novamente.');
                });
             }
        });
    </script>


    <div class="modal fade" id="result-modal" tabindex="-1" role="dialog" aria-labelledby="resultaModalLabel">
        <div class="modal-dialog" role="document">
          <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">
                    <span id="modal-enunciado"></span>
                </h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                  <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <span id="modal-correct"></span>
                <span id="modal-message"></span>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-success rounded-pill pr-4 pl-4 text-dark font-weight-bold text-uppercase" data-dismiss="modal" id="btn-proximo">Próxima pergunta</button>
            </div>
          </div>
        </div>
      </div>    


@endsection
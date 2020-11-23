<html lang="{{ app()->getLocale() }}" translate="no">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- CSRF Token -->
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <title>{{ config('app.name', 'SIPAT 2020') }}</title>
    <!-- Scripts -->
    <script src="{{ asset('js/app.js') }}" type="text/javascript"></script>
    <!-- Fonts -->
    <link rel="dns-prefetch" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css?family=Raleway:300,400,600" rel="stylesheet" type="text/css">
    <!-- Styles -->
    <link href="{{ asset('css/app.css') }}" rel="stylesheet">
    <link href="{{ asset('css/custon.css') }}" rel="stylesheet">
    <meta name="google" content="notranslate">
    <script src="https://kit.fontawesome.com/2c7146b1c7.js" crossorigin="anonymous"></script>
    
</head>

<body class="bg-banner">
    <div id="app" style="background-color: white">


        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            @guest
            <a class="navbar-brand" href="{{ url('/') }}">
                <img src="{{ URL::asset('/images/top-banner.png') }}" class="img-fluid">
            </a>
            @else
                <a class="navbar-brand" href="{{ url('/home') }}">
                    <img src="{{ URL::asset('/images/top-banner.png') }}" class="img-fluid">
                </a>
            @endguest
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup" aria-expanded="false" aria-label="Toggle navigation">
              <span class="navbar-toggler-icon"></span>
            </button>
            <div style="width: 100%">
                <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
                    <ul class="navbar-nav ml-auto">
                        <!-- Authentication Links -->
                        @guest
                            <li><a class="nav-link " href="{{ route('login') }}">{{ __('Faça o login') }}</a></li>
                            <li><a class="nav-link" href="{{ route('register') }}">{{ __('Cadastre-se') }}</a></li>
                        @else
                            <li><a class="nav-link font-weight-bold" href="{{ route('userslogged.index') }}">{{ Auth::user()->name }}</a></li>

                            @role('Admin')
                            <li><a class="nav-link" href="{{ route('participantes.index') }}">Participantes</a></li>
                            <li><a class="nav-link" href="{{ route('users.index') }}">Usuários</a></li>
                            @endrole

                            <li><a class="nav-link" href="{{ route('quizzes') }}">Responder Quiz</a></li>

                            <li><a class="nav-link" href="{{ route('userslogged.index') }}">Meus dados</a></li>
                            <li><a class="nav-link" href="{{ route('logout') }}" onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">Sair</a>
                                <form id="logout-form" action="{{ route('logout') }}" method="POST"
                                    style="display: none;">
                                    @csrf
                                </form>                                
                            </li>                                


                        @endguest
                    </ul>
                </div>
                @if(Request::path() == 'quizzes/responder' && isset($quizz))
                <h4 class="pt-4 text-right">{!! $quizz->nome !!}</h4>
                @endif
            </div>
          </nav>
        

        <!-- BANNER -->
        @if(Request::path() == 'quizzes/responder')
            <div class="container-fluid bg-banner" style="height: 2px"></div>
        @else
            <div class="container-fluid bg-banner">
                <div class="row">
                    <div class="col-md-12 px-0">
                        <img src="{{ URL::asset('/images/banner.jpg') }}" class="img-fluid">

                    </div>
                </div>
            </div>
        @endif

        <main class="py-4">
            <div class="container">
                @yield('content')
            </div>
        </main>

        <!-- FOOTER -->
        <footer>
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-12 px-0">
                        <img src="{{ URL::asset('/images/footer-detail.png') }}" class="img-fluid">
                    </div>
                </div>
            </div>        
            <div class="container-fluid bg-banner">
                <div class="row">
                    <div class="col-md-12 py-3 px-3 text-white font-weight-bold text-center">
                        Usiminas © {{date("Y")}} | Todos os direitos reservados.
                    </div>
                </div>
            </div>
        <footer>

    </div>

    <!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-B3S4N7KMDK"></script>
    <script>
        window.dataLayer = window.dataLayer || [];

        function gtag() {
            dataLayer.push(arguments);
        }
        gtag('js', new Date());

        gtag('config', 'G-B3S4N7KMDK');

    </script>

</body>

</html>

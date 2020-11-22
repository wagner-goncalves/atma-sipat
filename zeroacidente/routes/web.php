<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\HomeController;
use App\Http\Controllers\RoleController;
use App\Http\Controllers\UserController;
use App\Http\Controllers\UserLoggedController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\QuizzController;
use App\Http\Controllers\ParticipanteController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/', function () {
    return view('auth.login');
});
  
Auth::routes();
  
//Route::get('/', [LoginController::class, 'login'])->name('home');

  
Route::group(['middleware' => ['auth']], function() {
    
    Route::get('/home', [QuizzController::class, 'index']);

    //Route::get('foo/bar', 'FooController@bar');
    //Route::get('/users/edit-logged', [UserLoggedController::class, 'editLogged'])->name('users.edit-logged');
    //Route::post('/users/update-logged', [UserLoggedController::class, 'updateLogged'])->name('users.update-logged');

    Route::resource('roles', RoleController::class);
    Route::resource('users', UserController::class);
    Route::resource('userslogged', UserLoggedController::class);
    Route::resource('products', ProductController::class);
    //Route::resource('participantes', ParticipanteController::class);

    Route::get('/participantes', [ParticipanteController::class, 'index'])->name('participantes.index');
    Route::get('/participantes/show/{id}', [ParticipanteController::class, 'show'])->name('participantes.show');
    Route::get('/participantes/export', [ParticipanteController::class, 'export'])->name('participantes.export');

    Route::get('/quizzes', [QuizzController::class, 'index'])->name('quizzes');
    Route::get('/quizzes/responder', [QuizzController::class, 'responder'])->name('quizzes.responder');
    Route::get('/quizzes/resumo', [QuizzController::class, 'resumo'])->name('quizzes.resumo');
    Route::get('/quizzes/aguarde', [QuizzController::class, 'aguarde'])->name('quizzes.aguarde');
    Route::post('/quizzes/registrar', [QuizzController::class, 'registrar'])->name('quizzes.registrar');
});

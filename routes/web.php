<?php

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

Route::get('/allurls', function () {
    $array = [
        'all_tasks_list' => 'http://192.168.10.7/uol_semester/public/api/auth/tasklist',
        'all_semesters' => 'http://192.168.10.7/uol_semester/public/api/auth/semesterlist',
        'sign_up' => array(
            'link' => 'http://192.168.10.7/uol_semester/public/api/auth/signup',
             'fields' => ['email', 'password','username', 'first_name', 'last_name', 'phone', 'email',]
        ),
        'login' => array(
            'link' => 'http://192.168.10.7/uol_semester/public/api/auth/login',
             'fields' => ['email', 'password']
        ),

    ];
    return response($array);
});
Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'HomeController@index')->name('home');

//============================================================
//======================== ADMIN Routes ======================

// admin dashboard 
Route::get('/dashboard', 'ProfileController@dashboard')->name('Dashboard')->middleware('auth');
Route::get('/admin', 'ProfileController@dashboard')->name('Dashboard')->middleware('auth');

// semester 
Route::get('/semesters', 'SemesterController@create')->name('Semester')->middleware('auth');
Route::post('/semesters/store', 'SemesterController@store')->name('SemesterStore')->middleware('auth');
Route::get('/semesters/delete/{id}', 'SemesterController@delete')->name('SemesterDelete')->middleware('auth');
Route::get('/semesters/activate/{id}', 'SemesterController@activate')->name('SemesterActivate')->middleware('auth');
Route::get('/semesters/deactivate/{id}', 'SemesterController@deactivate')->name('SemesterDeactivate')->middleware('auth');

// semester 
Route::get('/tasks', 'TaskController@create')->name('Task')->middleware('auth');
Route::post('/tasks/store', 'TaskController@store')->name('TaskStore')->middleware('auth');
Route::get('/tasks/delete/{id}', 'TaskController@delete')->name('TaskDelete')->middleware('auth');
Route::get('/tasks/activate/{id}', 'TaskController@activate')->name('TaskActivate')->middleware('auth');
Route::get('/tasks/deactivate/{id}', 'TaskController@deactivate')->name('TaskDeactivate')->middleware('auth');

//profile 
Route::get('/profile', 'ProfileController@user_profile')->name('Profile')->middleware('auth');
Route::post('/profile/update', 'ProfileController@user_profile_update')->name('ProfileUpdate')->middleware('auth');

//============================================================
//======================== API Routes ======================
Route::resource('/alltasks', 'TaskController');

Route::resource('/allsemesters', 'SemesterController');
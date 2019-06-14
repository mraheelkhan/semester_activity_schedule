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
\
Route::get('/allurls', function () {
    $array = [
        'all_tasks_list' => 'https://dev.mraheelkhan.com/uolsemester/public/api/auth/tasklist',
        'all_semesters' => 'https://dev.mraheelkhan.com/uolsemester/public/api/auth/semesterlist',
        'sign_up' => array(
            'link' => 'https://dev.mraheelkhan.com/uolsemester/public/api/auth/signup',
            'method' => 'post',
            'fields' => ['email', 'password', 'password_confirmation', 'username', 'first_name', 'last_name', 'phone', 'batch_id']
        ),
        'login' => array(
            'link' => 'https://dev.mraheelkhan.com/uolsemester/public/api/auth/login',
            'method' => 'post',
             'fields' => ['email', 'password']
        ),
        'get_programs_list' => array(
            'link' => 'https://dev.mraheelkhan.com/uolsemester/public/api/getProgramList',
            'method' => 'get',
             'fields' => ['']
        ),
        'get_batches_list_by_program_id' => array(
            'link' => 'https://dev.mraheelkhan.com/uolsemester/public/api/getBatchesList',
            'method' => 'post',
             'fields' => ['program_id']
        ),

    ];
    return response($array);
});
Route::get('/', function () {
    return view('welcome');
});

Auth::routes();

Route::get('/home', 'ProfileController@dashboard')->name('home');

//============================================================
//======================== ADMIN Routes ======================

// admin dashboard 
Route::get('/dashboard', 'ProfileController@dashboard')->name('Dashboard')->middleware('auth');
Route::get('/session/events/{id}', 'ProfileController@session_events')->name('SessionEvents')->middleware('auth');
Route::get('/admin', 'ProfileController@dashboard')->name('Dashboard')->middleware('auth');

// semester 
Route::get('/sessions', 'SemesterController@create')->name('Semester')->middleware('auth');
Route::post('/session/store', 'SemesterController@store')->name('SemesterStore')->middleware('auth');
Route::get('/session/delete/{id}', 'SemesterController@delete')->name('SemesterDelete')->middleware('auth');
Route::get('/session/activate/{id}', 'SemesterController@activate')->name('SemesterActivate')->middleware('auth');
Route::get('/session/deactivate/{id}', 'SemesterController@deactivate')->name('SemesterDeactivate')->middleware('auth');

// task 
Route::get('/tasks', 'TaskController@create')->name('Task')->middleware('auth');
Route::post('/tasks/store', 'TaskController@store')->name('TaskStore')->middleware('auth');
Route::get('/tasks/delete/{id}', 'TaskController@delete')->name('TaskDelete')->middleware('auth');
Route::get('/tasks/activate/{id}', 'TaskController@activate')->name('TaskActivate')->middleware('auth');
Route::get('/tasks/deactivate/{id}', 'TaskController@deactivate')->name('TaskDeactivate')->middleware('auth');

//profile 
Route::get('/profile', 'ProfileController@user_profile')->name('Profile')->middleware('auth');
Route::post('/profile/update', 'ProfileController@user_profile_update')->name('ProfileUpdate')->middleware('auth');


// batches 
Route::get('/batches', 'BatchController@create')->name('Batches')->middleware('auth');
Route::post('/batch/store', 'BatchController@store')->name('BatchStore')->middleware('auth');
Route::get('/batch/delete/{id}', 'BatchController@delete')->name('BatchDelete')->middleware('auth');
Route::get('/batch/activate/{id}', 'BatchController@activate')->name('BatchActivate')->middleware('auth');
Route::get('/batch/deactivate/{id}', 'BatchController@deactivate')->name('BatchDeactivate')->middleware('auth');

// programs 
Route::get('/programs', 'ProgramController@create')->name('Programs')->middleware('auth');
Route::post('/program/store', 'ProgramController@store')->name('ProgramStore')->middleware('auth');
Route::get('/program/delete/{id}', 'ProgramController@delete')->name('ProgramDelete')->middleware('auth');
Route::get('/program/activate/{id}', 'ProgramController@activate')->name('ProgramActivate')->middleware('auth');
Route::get('/program/deactivate/{id}', 'ProgramController@deactivate')->name('ProgramDeactivate')->middleware('auth');
Route::get('/program/getBatchesListByProgramId/{id}', 'AjaxController@getBatchesListByProgramId')->name('GetProgramsList');

// notifications 
Route::get('/notifications', 'NotificationController@create')->name('Notifications')->middleware('auth');
Route::post('/notification/store', 'NotificationController@store')->name('NotificationStore')->middleware('auth');
Route::get('/notification/delete/{id}', 'NotificationController@delete')->name('NotificationStoreDelete')->middleware('auth');
Route::get('/notification/activate/{id}', 'NotificationController@activate')->name('NotificationStoreActivate')->middleware('auth');
Route::get('/notification/deactivate/{id}', 'NotificationController@deactivate')->name('NotificationStoreDeactivate')->middleware('auth');



//============================================================
//======================== API Routes ======================
Route::resource('/alltasks', 'TaskController');

Route::resource('/allsemesters', 'SemesterController');
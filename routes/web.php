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


//profile 
Route::get('/profile', 'ProfileController@user_profile')->name('Profile')->middleware('auth');
Route::post('/profile/update', 'ProfileController@user_profile_update')->name('ProfileUpdate')->middleware('auth');

//============================================================
//======================== API Routes ======================
Route::resource('/alltasks', 'TaskController');

Route::resource('/allsemesters', 'SemesterController');
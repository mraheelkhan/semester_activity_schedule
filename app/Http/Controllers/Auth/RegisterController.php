<?php

namespace App\Http\Controllers\Auth;

use App\User;
use App\Program;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use Illuminate\Foundation\Auth\RegistersUsers;
use Auth;
class RegisterController extends Controller
{
    /*
    |--------------------------------------------------------------------------
    | Register Controller
    |--------------------------------------------------------------------------
    |
    | This controller handles the registration of new users as well as their
    | validation and creation. By default this controller uses a trait to
    | provide this functionality without requiring any additional code.
    |
    */

    use RegistersUsers;

    /**
     * Where to redirect users after registration.
     *
     * @var string
     */
    protected $redirectTo = '/';
    /**public function redirectTo(){
        
        // User role
        $role = Auth::user()->role; 
        
        // Check user role
        switch ($role) {
            case 'admin':
                    return '/listings';
                break;
            case 'user':
                    return '/submited';
                break; 
            default:
                    return '/'; 
                break;
        }
    } */

    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('guest');
    }

    public function showRegistrationForm()
    {
        $programs = Program::where('status', 'active')->get();
        return view('auth.register', compact('programs'));
    }

    /**
     * Get a validator for an incoming registration request.
     *
     * @param  array  $data
     * @return \Illuminate\Contracts\Validation\Validator
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255'],
            'phone' => ['required', 'string', 'max:255'],
            'batch_id' => ['required'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    /**
     * Create a new user instance after a valid registration.
     *  
     * @param  array  $data
     * @return \App\User
     */
    protected function create(array $data)
    {
        // dd("you are here at create function of register");
        return User::create([
            'username' => $data['username'],
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'batch_id' => $data['batch_id'],
            'role' => 'user',
            'status' => 'active',
            'password' => Hash::make($data['password']),
        ]);
    }
}

<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;
use App\User;
use Validator;
class AuthController extends Controller
{
    /**
     * Create user
     *
     * @param  [string] name
     * @param  [string] email
     * @param  [string] password
     * @param  [string] password_confirmation
     * @return [string] message
     */
    public function signup(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'username' => 'required|string|unique:users',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone' => 'required|string|unique:users',
            'batch_id' => 'required',
            'email' => 'required|string|email|unique:users',
            'password' => 'required|string|confirmed'
        ]);

        if ($validator->fails()) {
            $response_data=[
                'success' => 0,
                'message' => 'Validation error!, username, phone or email is incorrect or already existed.',
                'data' => $validator->errors()
            ];
            return response()->json($response_data);
        }
        $user = new User([
            'username' => $request->username,
            'first_name' => $request->first_name,
            'first_name' => $request->first_name,
            'last_name' => $request->last_name,
            'role' => "user",
            'status' => "inactive",
            'phone' => $request->phone,
            'email' => $request->email,
            'batch_id' => $request->batch_id,
            'password' => bcrypt($request->password)
        ]);
        $user->save();
        return response()->json([
            'success' => 1,
            'message' => 'User Successfully created'
        ], 201);
    }
  
    /**
     * Login user and create token
     *
     * @param  [string] email
     * @param  [string] password
     * @param  [boolean] remember_me
     * @return [string] access_token
     * @return [string] token_type
     * @return [string] expires_at
     */
    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email' => 'required|string|email',
            'password' => 'required|string',
            'remember_me' => 'boolean'
        ]);
        
        
        if ($validator->fails()) {
            $response_data=[
                'success' => 0,
                'message' => 'Validation error.',
                'data' => $validator->errors()
            ];
            return response()->json($response_data);
        }


        $credentials = request(['email', 'password']);
        if(!Auth::attempt($credentials)){

            
            $response_data=[
                'success' => 0,
                'message' => 'Email or Password is incorrect.',
            ];
            return response()->json($response_data);
        }
        
        if(Auth::user()->status == "inactive"){
           
            $response_data=[
                'success' => 0,
                'message' => 'please contact your administrator to activate your account',
            ];
            return response()->json($response_data);
        }
        $user = $request->user();
        $tokenResult = $user->createToken('Personal Access Token');
        $token = $tokenResult->token;
        if ($request->remember_me)
            $token->expires_at = Carbon::now()->addWeeks(1);
        $token->save();
        return response()->json([
            'success' => 1,
            'access_token' => $tokenResult->accessToken,
            'token_type' => 'Bearer',
            'expires_at' => Carbon::parse(
                $tokenResult->token->expires_at
            )->toDateTimeString()
        ]);
    }
  
    /**
     * Logout user (Revoke the token)
     *
     * @return [string] message
     */
    public function logout(Request $request)
    {
        $request->user()->token()->revoke();
        return response()->json([
            'success' => 1,
            'message' => 'Successfully logged out'
        ]);
    }
  
    /**
     * Get the authenticated User
     *
     * @return [json] user object
     */
    public function user(Request $request)
    {
        return response()->json($request->user());
    }


    public function all_programs(){
        
    }
}
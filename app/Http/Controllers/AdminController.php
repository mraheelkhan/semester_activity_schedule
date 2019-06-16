<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\Batch;
use Auth;
use Session;
use Gate;
use Hash;
class AdminController extends Controller
{
    public function list()
    {
    	$user = User::all();
    	return view('admin.userlistview')->with('data', $user);
	}
	
	public function create(){
		$user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
			$users = User::all();
			$data = Batch::where('status', 'active')->with('programs')->get();
            return view('admin.create')->withUsers($users)->withData($data);
        } else{
            return view('forbidden');
        }
	}

	protected function validator(array $data)
    {
        return Validator::make($data, [
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required', 'string', 'max:255'],
            'role' => ['string', 'max:255'],
            'phone' => ['required','unique:users', 'string', 'max:255'],
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
    protected function store(Request $data)
    {	
        $validated =$data->validate([  
            'first_name' => ['required', 'string', 'max:255'],
            'last_name' => ['required', 'string', 'max:255'],
            'username' => ['required','unique:users', 'string', 'max:255'],
            'role' => ['string', 'max:255'],
            'batch_id' => ['required', 'max:255'],
            'phone' => ['required', 'unique:users',  'string', 'max:255'],
            'email' => ['required', 'string', 'email', 'max:255', 'unique:users'],
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
        $newAddedUser = User::create([
            'username' => $data['username'],
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'email' => $data['email'],
            'role' => $data['role'],
            'batch_id' => $data['batch_id'],
            'phone' => $data['phone'],
            'role' => $data['role'],
            'status' => $data['status'],
            'password' => Hash::make($data['password']),
        ]);
        
        Session::flash('message', 'User Added Successfully. <script>swal.fire("Added","User Added","success");</script>'); 
        return back();
    }

    public function delete(Request $request){
    	$id = $request->user_id;
    	$data = User::findorFail($id);
    	$data->delete();
    	Session::flash('message', 'User Deleted <script> swal("Deleted","User Data Successfully Deleted","warning");</script>'); 
         return redirect('admin/user/list');
	}
	

	public function activate($id){

		$user = User::findOrFail($id);
    	if(!empty($user)){
			$user->status = 'active';
			$user->save();
    		Session::flash('message', 'User Activated Successfully <script> swal("Activated","User Activated Successfully ","success");</script>'); 
         	return redirect('admin/user/list');
    	} else {
			
         	return redirect('admin/user/list');
		}
    	 
	}
	
	public function deactivate($id){

		$user = User::findOrFail($id);
    	if(!empty($user)){
			$user->status = 'inactive';
			$user->save();
    		Session::flash('message', 'User Deactivated Successfully <script> swal("Deactivated","User Deactivated Successfully ","success");</script>'); 
         	return redirect('admin/user/list');
    	} else {
			
         	return redirect('admin/user/list');
		}
    	 
    }
}

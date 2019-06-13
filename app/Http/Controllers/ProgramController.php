<?php

namespace App\Http\Controllers;

use App\Program;
use App\Batch;
use App\User;
use Auth;
use Session;
use Gate;
use Illuminate\Http\Request;

class ProgramController extends Controller
{
    public function __construct()
    {
        $user = Auth::user();
        $this->middleware('auth');
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        //
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $programs = Program::all();
            return view('programs.create')->with('programs', $programs);
        } else{
            //return "you are not authorize to this action";
            return view('forbidden');
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request){
        $userId = Auth::user()->id;
        $validated = $request->validate([   
            "program_name" => 'required|max:50',
            "program_description" => 'required|max:200'
            ]);
        $program = request('program_name');
        //$yeartype = request('semester_year'). " " . request('semester_type');
        $query = Program::where('program_name', $program)->first();
        if( $query ){
            Session::flash('error', 'Program already existed <script>swal.firePP("success","Added","Your Program is already existed");</script>'); 
            return redirect('/programs');
        }

        $insert = Program::create([
            'program_name' => request('program_name'),
            'program_description' => request('program_description'),
            'created_by' => auth()->user()->id,
            'status' => 'active',
        ]);
        Session::flash('message', 'Your new Program is added successfully. <script>swal.firePP("success","Added","Your Program is Added Successfully");</script>'); 
        return redirect('/programs');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Batch  $batch
     * @return \Illuminate\Http\Response
     */
    public function show(Batch $batch)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Batch  $batch
     * @return \Illuminate\Http\Response
     */
    public function edit(Batch $batch)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Batch  $batch
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Batch $batch)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Batch  $batch
     * @return \Illuminate\Http\Response
     */
    public function destroy(Batch $batch)
    {
        //
    }

    public function delete($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $program = Program::findorFail($id);
            $batch = Batch::where('program_id', $id)->count();
            
            if($batch <= 0){
                //$batch->isDeleted = 1;
                $program->delete();
                Session::flash('message', 'Program deleted. <script>swal.fire("Deleted","Program Deleted", "success");</script>'); 
                return redirect('/programs');
                
            } 
            
            Session::flash('error', 'Program cannot deleted.  because it has other records. <script>swal.fire("Cannot","Program Cannot Deleted because it has other records.","error");</script>'); 
            return redirect('/programs');
                
        } else{
            return view('forbidden');
        }
        
    }

    public function activate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
                $program = Program::findorFail($id);
                $program->status = "active";
                $program->update();
                Session::flash('message', 'Program Activated. <script>swal.fire("Activated","Program Activated","success");</script>'); 
                return redirect('/programs');
        } else{
            return view('forbidden');
        }
        
    }
    public function deactivate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $program = Program::findorFail($id);
            $program->status = "inactive";
            $program->update();
                Session::flash('message', 'Program Deactivated. <script>swal.fire("Deactivated","Program Deactivated", "success");</script>'); 
                return redirect('/programs');
        } else{
            return view('forbidden');
        }
        
    }
}

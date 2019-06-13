<?php

namespace App\Http\Controllers;

use App\Batch;
use App\Program;
use App\User;
use Auth;
use Session;
use Gate;
use Illuminate\Http\Request;

class BatchController extends Controller
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
            $batches = Batch::all();
            $programs = Program::where('status', 'active')->get();
            return view('batches.create')->with('batches', $batches)->with('programs', $programs);  
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
            "batch_name" => 'required|max:50',
            "batch_description" => 'required|max:200',
            "program_id" => 'required'
            ]);
        $program = request('program_id');
        $batch = request('batch_name');
        //$yeartype = request('semester_year'). " " . request('semester_type');
        $query = Batch::where('program_id', $program)->where('name', $batch)->first();
        if( $query ){
            Session::flash('error', 'Batch already existed <script>swal.firePP("success","Added","Your Batch is already existed");</script>'); 
            return redirect('/batches');
        }

        $insert = Batch::create([
            'name' => request('batch_name'),
            'description' => request('batch_description'),
            'program_id' => request('program_id'),
            'created_by' => auth()->user()->id,
            'status' => 'active',
        ]);
        Session::flash('message', 'Your new Batch is added successfully. <script>swal.firePP("success","Added","Your Batch is Added Successfully");</script>'); 
        return redirect('/batches');
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
            $batch = Batch::findorFail($id);
            $student = User::where('batch_id', $id)->count();
            
            if($student <= 0){
                //$batch->isDeleted = 1;
                $batch->delete();
                Session::flash('message', 'Batch deleted. <script>swal.fire("Deleted","Batch Deleted", "success");</script>'); 
                return redirect('/batches');
                
            } 
            
            Session::flash('error', 'Batch cannot deleted.  because it has other records. <script>swal.fire("Cannot","Batch Cannot Deleted because it has other records.","error");</script>'); 
            return redirect('/batches');
                
        } else{
            return view('forbidden');
        }
        
    }

    public function activate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
                $batch = Batch::findorFail($id);
                $batch->status = "active";
                $batch->update();
                Session::flash('message', 'Batch Activated. <script>swal.fire("Activated","Batch Activated","success");</script>'); 
                return redirect('/batches');
        } else{
            return view('forbidden');
        }
        
    }
    public function deactivate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $batch = Batch::findorFail($id);
            $batch->status = "inactive";
            $batch->update();
                Session::flash('message', 'Batch Deactivated. <script>swal.fire("Deactivated","Batch Deactivated", "success");</script>'); 
                return redirect('/batches');
        } else{
            return view('forbidden');
        }
        
    }

    /* public function getBatchesListByProgramId($id){
        $batches = Batch::where('program_id', $id)->get();
        json_encode($batches);
        return response()->json($batches);
    }*/
}

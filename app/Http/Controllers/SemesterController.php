<?php

namespace App\Http\Controllers;
use Auth;
use Gate;
use Session;
use App\Semester;
use App\User;
use App\Task;
use Illuminate\Http\Request;
use App\Http\Resources\SemesterResourceCollection;
class SemesterController extends Controller
{
    public function __construct()
    {
        $user = Auth::user();
        $this->middleware('auth');
    }
    /**
     * Display 
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all = Semester::where('status', 'active')->get();
        return response(new SemesterResourceCollection($all));
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
            $semesters = Semester::where('isDeleted', 0)->get();
            return view('semesters.create')->with('semesters', $semesters);  
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
            "semester_type" => 'required',
            "semester_year" => 'required',
            "start_date" => 'required',
            "end_date" => 'required|after:start_date',
            'user_id' => 'required'
            ]);
            
        $year = request('semester_year');
        $type = request('semester_type');
        $yeartype = request('semester_year'). " " . request('semester_type');
        $query = Semester::where('semester_year', $year)->where('semester_type', $type)->where('isDeleted', 0)->first();
        
        if( $query ){
            Session::flash('error', 'session already existed <script>swal.firePP("success","Added","Your session is already existed");</script>'); 
            return redirect('/sessions');
        }
       
        $insert = Semester::create([
            'semester_type' => request('semester_type'),
            'semester_year' => request('semester_year'),
            'semester_start_date' => request('start_date'),
            'semester_end_date' => request('end_date'),
            'created_by' => request('user_id'),
        ]);
        
        Session::flash('message', 'Your new session is added successfully. <script>swal.firePP("success","Added","Your session is Added Successfully");</script>'); 
        return redirect('/sessions');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Semester  $semester
     * @return \Illuminate\Http\Response
     */
    public function show(Semester $semester)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Semester  $semester
     * @return \Illuminate\Http\Response
     */
    public function edit(Semester $semester)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Semester  $semester
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Semester $semester)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Semester  $semester
     * @return \Illuminate\Http\Response
     */
    public function destroy(Semester $semester)
    {
        //
    }

    public function delete($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $semester = Semester::findorFail($id);
            $task = Task::where('semester_id', $id)->count();
            
            if($task <= 0){
                $semester->isDeleted = 1;
                $semester->update();
                Session::flash('message', 'session deleted. <script>swal.fire("success","Delete","session Deleted");</script>'); 
                return redirect('/sessions');
                
            } 
            
            Session::flash('error', 'session cannot deleted.  because it has other records. <script>swal.fire("Cannot","session Cannot Deleted because it has other records.","error");</script>'); 
            return redirect('/sessions');
                
        } else{
            return view('forbidden');
        }
        
    }
    public function activate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
                $semester = Semester::findorFail($id);
                $semester->status = "active";
                $semester->update();
                Session::flash('message', 'session Activated. <script>swal.firePP("success","Activated","session Activated");</script>'); 
                return redirect('/sessions');
        } else{
            return view('forbidden');
        }
        
    }
    public function deactivate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $semester = Semester::findorFail($id);
            $semester->status = "inactive";
            $semester->update();
                Session::flash('message', 'session Deactivated. <script>swal.fire("success","Deactivated","session Deactivated");</script>'); 
                return redirect('/sessions');
        } else{
            return view('forbidden');
        }
        
    }
}

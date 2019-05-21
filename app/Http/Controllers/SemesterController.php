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
            'user_id' => 'required'
            ]);
        $year = request('semester_year');
        $type = request('semester_type');
        $yeartype = request('semester_year'). " " . request('semester_type');
        $query = Semester::where('semester_year', $year)->where('semester_type', $type)->where('isDeleted', 0)->first();
        if( $query ){
            Session::flash('error', 'Semester already existed <script>swal.firePP("success","Added","Your Semester is already existed");</script>'); 
            return redirect('/semesters');
        }

        $insert = Semester::create([
            'semester_type' => request('semester_type'),
            'semester_year' => request('semester_year'),
            'created_by' => request('user_id'),
        ]);
        Session::flash('message', 'Your new Semester is added successfully. <script>swal.firePP("success","Added","Your Semester is Added Successfully");</script>'); 
        return redirect('/semesters');
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
                Session::flash('message', 'semester deleted. <script>swal.fire("success","Delete","semester Deleted");</script>'); 
                return redirect('/semesters');
                
            } 
            
            Session::flash('error', 'semester cannot deleted.  because it has other records. <script>swal.fire("Cannot","semester Cannot Deleted because it has other records.","error");</script>'); 
            return redirect('/semesters');
                
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
                Session::flash('message', 'Semester Activated. <script>swal.firePP("success","Activated","Semester Activated");</script>'); 
                return redirect('/semesters');
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
                Session::flash('message', 'Semester Deactivated. <script>swal.fire("success","Deactivated","Semester Deactivated");</script>'); 
                return redirect('/semesters');
        } else{
            return view('forbidden');
        }
        
    }
}

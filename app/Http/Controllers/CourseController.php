<?php

namespace App\Http\Controllers;


use App\Batch;
use App\Course;
use App\Program;
use App\User;
use App\Semester;
use Auth;
use Session;
use Gate;
use Illuminate\Http\Request;

class CourseController extends Controller
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
            $courses = Course::all();
            $programs = Program::where('status', 'active')->get();
            $teachers = User::where('status', 'active')->where('role', 'teacher')->get();
            $sessions = Semester::where('status', 'active')->get();
            return view('courses.create')->with('courses', $courses)->with('programs', $programs)->with('teachers', $teachers)->with('sessions', $sessions);  
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
            "course_name" => 'required|max:100',
            "teacher_id" => 'required',
            "session_id" => 'required',
            "program_id" => 'required',
            "course_code" => 'required|max:7|unique:courses'
            ]);
        $program = request('program_id');
        $teacher_id = request('teacher_id');
        $session_id = request('session_id');
        $course = request('course_name');
        //$yeartype = request('semester_year'). " " . request('semester_type');
        $query = Course::where('program_id', $program)->where('course_name', $course)->where('teacher_id', $teacher_id)->where('semester_id', $session_id)->first();
        if( $query ){
            Session::flash('error', 'Course already existed <script>swal.firePP("success","Added","Your Course is already existed");</script>'); 
            return redirect('/courses');
        }

        $insert = Course::create([
            'course_name' => request('course_name'),
            'teacher_id' => request('teacher_id'),
            'program_id' => request('program_id'),
            'semester_id' => request('session_id'),
            'course_code' => request('course_code'),  
            'created_by' => auth()->user()->id,
            'status' => 'active',
        ]);
        Session::flash('message', 'Your new Course is added successfully. <script>swal.firePP("success","Added","Your Course is Added Successfully");</script>'); 
        return redirect('/courses');
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
            $course = Course::findorFail($id);

            $course->delete();
            Session::flash('message', 'Batch deleted. <script>swal.fire("Deleted","Batch Deleted", "success");</script>'); 
            return redirect('/courses');
                
        } else{
            return view('forbidden');
        }
        
    }

    public function activate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
                $course = Course::findorFail($id);
                $course->status = "active";
                $course->update();
                Session::flash('message', 'Course Activated. <script>swal.fire("Activated","Course Activated","success");</script>'); 
                return redirect('/courses');
        } else{
            return view('forbidden');
        }
        
    }
    public function deactivate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $course = Course::findorFail($id);
            $course->status = "inactive";
            $course->update();
                Session::flash('message', 'Course Deactivated. <script>swal.fire("Deactivated","Course Deactivated", "success");</script>'); 
                return redirect('/courses');
        } else{
            return view('forbidden');
        }
        
    }

    public function verifyCode(Request $request){
        $course_id = request('course_id');
        $course_code = request('course_code');
        $course = Course::findorFail($course_id);

        if ( $course->course_code == $course_code ){
            $response_data=[
                'success' => 1,
                'message' => 'code verified',
            ];
        } else {
            $response_data=[
                'success' => 0,
                'message' => 'code not verified',
            ];
        }
        return response()->json($response_data);
    }
    /* public function getBatchesListByProgramId($id){
        $batches = Batch::where('program_id', $id)->get();
        json_encode($batches);
        return response()->json($batches);
    }*/
}

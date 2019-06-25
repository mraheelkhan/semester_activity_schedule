<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Program;
use App\Batch;
use App\User;
use App\Task;
use App\Course;
use App\Http\Resources\ProgramBatchResourceCollection;
use App\Http\Resources\CourseResourceCollection;
class AjaxController extends Controller
{
    public function getProgramBatchList(){
        $programs = Batch::where('status', 'active')->with('programs')->get();
        
        return new ProgramBatchResourceCollection($programs);
        //json_encode($programs);
        //return response()->json($programs);
    }

    public function getBatchesListByProgramId($id){
        $batches = Batch::where('program_id', $id)->where('status', 'active')->get();
        json_encode($batches);
        return response()->json($batches);
    }
    public function getCoursesListByProgramId($id){
        $courses = Course::where('program_id', $id)->where('status', 'active')->with('user')->with('programs')->with('semester')->get();
        json_encode($courses);
        return response()->json($courses);
    }

    public function getBatchesListByProgramIdAndroid(Request $request){
        $programId = $request->program_id;
        $batches = Batch::where('program_id', $programId)->where('status', 'active')->get();
        json_encode($batches);
        return response()->json($batches);
    }

    public function getCoursesListByProgramIdAndroid(Request $request){
        $userBatch = auth()->user()->batch_id;
        $batch_id = Batch::findOrFail($userBatch);
        $programId = $batch_id->program_id;
        // $programId = $request->program_id;
        $courses = Course::where('program_id', $programId)->where('status', 'active')->with('user')->with('programs')->with('semester')->get();
        return new CourseResourceCollection($courses);
        //json_encode($courses);
        // $response_data=[
        //     'success' => 1,
        //     'data' => $courses,
        // ];
        // return response()->json($response_data);
    }
    public function getCoursesListByProgramIdAndroid1(Request $request){
        
        $programId = $request->program_id;
        // $programId = $request->program_id;
        $courses = Course::where('program_id', $programId)->where('status', 'active')->with('user')->with('programs')->with('semester')->get();
        return new CourseResourceCollection($courses);
        //json_encode($courses);
        // $response_data=[
        //     'success' => 1,
        //     'data' => $courses,
        // ];
        // return response()->json($response_data);
    }
}

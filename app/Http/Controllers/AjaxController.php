<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Program;
use App\Batch;
use App\User;
use App\Task;
use App\Http\Resources\ProgramBatchResourceCollection;
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

    public function getBatchesListByProgramIdAndroid(Request $request){
        $programId = $request->program_id;
        $batches = Batch::where('program_id', $programId)->where('status', 'active')->get();
        json_encode($batches);
        return response()->json($batches);
    }
}

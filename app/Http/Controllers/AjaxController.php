<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Program;
use App\Batch;
use App\User;
use App\Task;
class AjaxController extends Controller
{
    public function getBatchesListByProgramId($id){
        $batches = Batch::where('program_id', $id)->where('status', 'active')->get();
        json_encode($batches);
        return response()->json($batches);
    }
}

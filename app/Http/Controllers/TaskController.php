<?php

namespace App\Http\Controllers;

use App\Task;
use App\Semester;
use App\User;
use App\CompletedTask;
use Illuminate\Http\Request;
use Gate;
use Session;
use Auth;
use App\Http\Resources\TaskResourceCollection;
class TaskController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $all = Task::where('status', 1)->with('user')->with('semester')->get();
        return response(new TaskResourceCollection($all));
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
            $tasks = Task::where('isDeleted', 0)->with('semester')->get();
            $semesters = Semester::where('isDeleted', 0)->where('status', 'active')->get();
            return view('tasks.create')->with('tasks', $tasks)->with('semesters', $semesters);  
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
    public function store(Request $request)
    {
        $userId = Auth::user()->id;
        $validated = $request->validate([   
            "semester_id" => 'required',
            "task_title" => 'required|max:200',
            "task_type" => 'required',
            "task_date" => 'required',
            ]);

        Task::create([
            'task_title' => request('task_title'),
            'task_type' => request('task_type'),
            'task_date' => request('task_date'),
            'created_by' => $userId,
            'semester_id' => request('semester_id'),
        ]);
        Session::flash('message', 'Your new task is added successfully. <script>swal.firePP("success","Added","Your task is Added Successfully");</script>'); 
        return redirect('/tasks');
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function show(Task $task)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function edit(Task $task)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Task $task)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Task  $task
     * @return \Illuminate\Http\Response
     */
    public function destroy(Task $task)
    {
        //
    }

    public function delete($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $task = Task::findorFail($id);
            $completedtask = CompletedTask::where('task_id', $id)->count();
            
            if($completedtask <= 0){
                $task->isDeleted = 1;
                $task->update();
                Session::flash('message', 'Task deleted. <script>swal.fire("success","Delete","Task Deleted");</script>'); 
                return redirect('/tasks');
                
            } 
            
            Session::flash('error', 'task cannot deleted.  because it has other records. <script>swal.fire("Cannot","task Cannot Deleted because it has other records.","error");</script>'); 
            return redirect('/tasks');
                
        } else{
            return view('forbidden');
        }
        
    }
    public function activate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
                $task = Task::findorFail($id);
                $task->status = "active";
                $task->update();
                Session::flash('message', 'Task Activated. <script>Swal.fire("success","Activated","Task Activated");</script>'); 
                return redirect('/tasks');
        } else{
            return view('forbidden');
        }
        
    }
    public function deactivate($id){
        $user = User::class;
        if(Gate::allows('onlyAdmin', $user)){
            $task = Task::findorFail($id);
            $task->status = "inactive";
            $task->update();
            Session::flash('message', 'Task Deactivated. <script>Swal.fire("success","Deactivated","Task Deactivated");</script>'); 
            return redirect('/tasks');
        } else{
            return view('forbidden');
        }
        
    }
}

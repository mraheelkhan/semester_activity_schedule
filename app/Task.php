<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\User;
use App\Semester;
class Task extends Model
{
    protected $fillable = ['task_type', 'task_date', 'task_due_date', 'semester_id', 'task_title', 'created_by'];
    public function user(){
        return $this->belongsTo('App\User', 'created_by', 'id');
    }
    public function semester(){
        return $this->belongsTo('App\Semester', 'semester_id', 'id');
    }
}

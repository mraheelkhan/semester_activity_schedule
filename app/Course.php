<?php

namespace App;
use App\User;
use App\Semester;
use App\Program;
use Illuminate\Database\Eloquent\Model;

class Course extends Model
{
    protected $fillable = ['course_name', 'teacher_id', 'created_by', 'status', 'program_id', 'course_code', 'semester_id'];
    
    public function programs(){
        return $this->belongsTo('App\Program', 'program_id', 'id')->withDefault();
    }
    public function user(){
        return $this->belongsTo('App\User', 'teacher_id', 'id')->withDefault();
    }
    public function semester(){
        return $this->belongsTo('App\Semester', 'semester_id', 'id')->withDefault();
    }
}

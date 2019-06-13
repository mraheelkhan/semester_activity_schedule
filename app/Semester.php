<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Semester extends Model
{
    protected $fillable = ['semester_type', 'semester_year', 'semester_start_date', 'semester_end_date', 'created_by'];


}

<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Program;
class Batch extends Model
{
    protected $fillable = ['name', 'description', 'created_by', 'status', 'program_id'];
    public function programs(){
        return $this->belongsTo('App\Program', 'program_id', 'id')->withDefault();
    }
}

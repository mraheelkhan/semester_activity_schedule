<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class CourseResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        //return parent::toArray($request);
        return [
            'id' => $this->id,
            'course_name' => $this->course_name,
            'teacher_name' => $this->user->first_name . " " . $this->user->last_name,
            'program_name' => $this->programs->program_name,
            'session_name' => $this->semester->semester_type . " " . $this->semester->semester_year,
        ];
    }
}

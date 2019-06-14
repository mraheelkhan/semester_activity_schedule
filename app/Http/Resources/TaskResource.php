<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class TaskResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        // return parent::toArray($request);
        return [
            'id'=> $this->id,
            'task_title'=> $this->task_title,
            'task_description'=> "this is dummy description for the testing of dialog box API.",
            'task_date'=> strtotime($this->task_date) * 1000,
        ];
    }
}

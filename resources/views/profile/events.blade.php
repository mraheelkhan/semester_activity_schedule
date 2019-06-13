@extends('layouts.admin')
@section('title')
	{{Auth::user()->firstname}}
@endsection
@section('content')
<div class="col-md-12">
@if(Session::has('message'))
	<p class="alert alert-success">{!! Session::get('message') !!}</p>
@endif
@if (count($errors) > 0)
<div class="alert alert-danger">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
			</div>
@endif
</div>
<style>
.fc-view-container *, .fc-view-container :after, .fc-view-container :before
{
  /* color: white; */
}</style>

<div class="col-md-12">
        <div class="content">
                <div class="container-fluid">
                  <div class="row">
                    <div class="col-md-12">
                      <div class="card">
                        <div class="card-header card-header-primary">
                          <h4 class="card-title">Dashboard</h4>
                          
                        </div>
                        <div class="card-body">
                          <div class="row">
                              <div class="col-md-12"> 
                              <h2 class="text-center"> Session : {{ $data['session']->semester_type }} {{ $data['session']->semester_year }}</h2>
                              </div>
                          </div>
                            <div id='calendar'></div>
                        </div>
                      </div>
                    </div>
                   
                  </div>
                </div>
              </div>
</div>

@php
 $array = [];
 $sessionValidRanges = array(
            'start' => $data['session']->semester_start_date,
            'end' => $data['session']->semester_end_date
        );
 //dd($data['topReactTrulies']);
 foreach($data['events'] as $row){
        
        
        //echo date_format($row->event_date,"Y/m/d H:i:s"); 
        $date =  date("d-m-Y", strtotime($row->task_date));
         $currentDate = date("d-m-Y"); 
        if($date < $currentDate){
            $array[] = [
            'title'=>$row->task_title, 
            'start'=>$row->task_date,
            'end' => $row->task_due_date,
            'backgroundColor'=>'#f56954',
            'borderColor'=>'#f56954'
            ];
        } elseif($date == $currentDate){
          $array[]=[
          'title'=>$row->task_title, 
          'start'=>$row->task_date,
          'end' => $row->task_due_date,
          'backgroundColor'=>'#0073b7',
          'borderColor'=>'#0073b7'
        ];
        } elseif($date > $currentDate){
          $array[]=[
          'title'=>$row->task_title, 
          'start'=>$row->task_date,
          'end' => $row->task_due_date,
          'backgroundColor'=>'#00a65a',
          'borderColor'=>'#00a65a'
        ];
        }
         
}
      $events =    json_encode($array);
      $validRanges = json_encode($sessionValidRanges);
      //dd($locations);
@endphp
<script>
  //this is called in the below js file 
    var events = @php echo $events @endphp;
    console.log(events);
</script>
<script>
        var validRanges = @php echo $validRanges @endphp;

        console.log(validRanges);
</script>

<script src="{{ asset('js/calendarCustom.js')}} "></script>
@endsection
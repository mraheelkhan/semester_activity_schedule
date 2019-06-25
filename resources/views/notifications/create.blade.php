@extends('layouts.admin')
@section('title')
	Semester Admin Panel
@endsection
@section('content')
<div class="col-md-12">
@if(Session::has('message'))
	<p class="alert alert-success">{!! Session::get('message') !!}</p>
@endif
@if(Session::has('error'))
	<p class="alert alert-danger">{!! Session::get('error') !!}</p>
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

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-primary">
		<h4 class="card-title ">Send New Notification	</h4>
		{{-- <p class="card-category"> Here is a subtitle for this table</p> --}}
		</div>
		<div class="card-body">
		<div class="">
		<form action="{{ route('NotificationStore') }}" method="post">
			<div class="row">
				@csrf
				<div class="col-md-6">
						<div class="form-group">
						<input type="hidden" name="user_id" value="{{auth()->user()->id}}"/>
						<input type="text" name="title" id="title" class="form-control" placeholder="Enter your Title"/>
						</div>
				</div>
				<div class="col-md-6">
						<div class="form-group">
						<input type="text" name="description" id="description" value="{{old('description')}}"  class="form-control" placeholder="Enter Batch Description"/>
						</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
					<input type="hidden" name="user_id" value="{{auth()->user()->id}}"/>
					<select name="program_id" id="program_id" onchange="getBatchesforProgram()"  class="form-control">
						<option selected disabled>Select Program</option>
						@foreach($programs as $program)
							<option value="{{ $program->id }}"> {{ $program->program_name }} </option>
						@endforeach
					</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
					<select class="form-control" name="batch_id" id="batch_id">
						<option disabled> Select your batch</option>

					</select>
					</div>
				</div>
				
				<div class="col-md-12">
					<div class="form-group">
					<input type="submit" class="btn btn-primary pull-right" id="ajaxSubmit"/>
					</div>
				</div>
			</form>
			</div>
		</div>
		</div>
	</div>
</div>

 {{-- 
	<div class="col-md-12 mt-5">
		<div class="card">
		  <div class="card-header card-header-primary">
			<h4 class="card-title ">Batches List</h4>
			<p class="card-category"> </p>
		  </div>
		  <div class="card-body">
			<div class="table-responsive">
			  <table class="table">
				<thead class=" text-primary">
				 
				  <th>
						Batch Name
				  </th>
				  <th>
						Program 
				  </th>
				  <th>
					Status
				  </th>
				  <th>
					Action
				  </th>
				</thead>
				<tbody>
					@foreach($batches as $batch)
				  <tr>
					<td>
						{{ $batch->name }} 
					</td>
					<td>
						{{ $batch->programs->program_name }} 
					</td>
					<td>
						@if($batch->status == "active")
							<label class="badge badge-success">{{$batch->status}}</label>
						@else 
							<label class="badge badge-danger">{{$batch->status}}</label>
						@endif
							
					</td>
					<td class="text-primary">
						<a href="{{route('BatchDelete', $batch->id)}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
						@if($batch->status == 'active')
						<a href="{{route('BatchDeactivate', $batch->id)}}" class="btn btn-dark" title="Deactivate Now"><i class="fa fa-times-circle"></i></a>
						@else
						<a href="{{route('BatchActivate', $batch->id)}}" class="btn btn-info" title="Activate Now"><i class="fa fa-check-circle"></i></a>
						@endif
					</td>
				  </tr>
				  @endforeach
				  
				</tbody>
			  </table>
			</div>
		  </div>
		</div>
	  </div>
--}}
	  <script>
	function getBatchesforProgram(){
            var program_id = $('#program_id').val();
            route_url = " {{ url('program/getCoursesListByProgramId') }}/" + program_id + "";
            console.log(program_id);
        $.ajax({
            url: route_url,
            method: "GET",
            dataType: "json",
            success:
                function(data){                  
                    var html='';
                    html +='<option value="" disabled selected>Select Course</option>';
                    $.each(data, function(index, value) {
                        html += '<option value="' + value.id + '">' + value.course_name + ' - ' + value.user.first_name + ' ' + value.user.last_name + ' | ' + value.semester.semester_type  + ' ' + value.semester.semester_year + '</option>';             
                    });
                    console.log(data);
                    $('#batch_id').html(html);    
                }
        });
    }			
</script>
@endsection
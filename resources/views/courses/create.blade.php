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
		<h4 class="card-title ">Add New Course	</h4>
		{{-- <p class="card-category"> Here is a subtitle for this table</p> --}}
		</div>
		<div class="card-body">
		<div class="">
		<form action="{{ route('CourseStore') }}" method="post">
			<div class="row">
				@csrf
				<div class="col-md-6">
					<div class="form-group">
					<input type="text" onchange="randomCodeGenerator()" name="course_name" id="course_name" value="{{old('course_name')}}"  class="form-control" placeholder="Enter Course Name"/>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<input type="text"  name="course_code" id="course_code" value=""  class="form-control" placeholder="Copy this code" readonly/>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					<input type="hidden" name="user_id" value="{{auth()->user()->id}}"/>
					<select name="program_id" id="program_id"  class="form-control">
						<option selected disabled>Select Program</option>
						@foreach($programs as $program)
					<option value="{{ $program->id }}"> {{ $program->program_name }} </option>
						@endforeach
					</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					<input type="hidden" name="user_id" value="{{auth()->user()->id}}"/>
					<select name="session_id" id="session_id"  class="form-control">
						<option selected disabled>Select Session</option>
						@foreach($sessions as $session)
					<option value="{{ $session->id }}"> {{ $session->semester_type }} - {{ $session->semester_year }}  </option>
						@endforeach
					</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					<input type="hidden" name="user_id" value="{{auth()->user()->id}}"/>
					<select name="teacher_id" id="teacher_id"  class="form-control">
						<option selected disabled>Select Teacher</option>
						@foreach($teachers as $teacher)
					<option value="{{ $teacher->id }}"> {{ $teacher->first_name }} {{ $teacher->last_name }}  </option>
						@endforeach
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

<div class="col-md-12 mt-5">
		<div class="card">
		  <div class="card-header card-header-primary">
			<h4 class="card-title ">Courses List</h4>
			<p class="card-category"> </p>
		  </div>
		  <div class="card-body">
			<div class="table-responsive">
			  <table class="table">
				<thead class=" text-primary">
				 
				  <th>
						Course Name
				  </th>
				  <th>
						Code
				  </th>
				  <th>
						Program 
				  </th>
				  <th>
					Session 
					  </th>
					<th>
						Teacher 
					</th>
				  <th>
					Status
				  </th>
				  <th>
					Action
				  </th>
				</thead>
				<tbody>
					@foreach($courses as $course)
				  <tr>
					<td>
						{{ $course->course_name }} 
					</td>
					<td>
							{{ $course->course_code }} 
						</td>
					<td>
						{{ $course->programs->program_name }} 
					</td>
					<td>
						{{ $course->semester->semester_type }} - {{ $course->semester->semester_year }} 
					</td>
					<td>
						{{ $course->user->first_name }} {{ $course->user->last_name }} 
					</td>
					<td>
						@if($course->status == "active")
							<label class="badge badge-success">{{$course->status}}</label>
						@else 
							<label class="badge badge-danger">{{$course->status}}</label>
						@endif
							
					</td>
					<td class="text-primary">
						<a href="{{route('CourseDelete', $course->id)}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
						@if($course->status == 'active')
						<a href="{{route('CourseDeactivate', $course->id)}}" class="btn btn-dark" title="Deactivate Now"><i class="fa fa-times-circle"></i></a>
						@else
						<a href="{{route('CourseActivate', $course->id)}}" class="btn btn-info" title="Activate Now"><i class="fa fa-check-circle"></i></a>
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
<script>
	function randomCodeGenerator(){
		var isExist = $('#course_code').val();
		if( isExist == '' ){
			var randomCode = Math.floor((Math.random() * 1000000) + 1);
			$('#course_code').val(randomCode);
		}
	}
</script>
@endsection
@extends('layouts.admin')
@section('title')
	Task Admin Panel
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
		<h4 class="card-title ">Add New Task	</h4>
		{{-- <p class="card-category"> Here is a subtitle for this table</p> --}}
		</div>
		<div class="card-body">
		<div class="">
		<form action="{{ route('TaskStore') }}" method="post">
			<div class="row">
				@csrf
				<div class="col-md-12">
						<div class="form-group">
								<label class="bmd-label-floating">Task or Event Title</label>
						<input type="text" name="task_title" class="form-control" value="{{ old('task_title') }}" />
						</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					<select name="task_type" id="task_type"  class="form-control" value="{{ old('task_type') }}">
						<option selected disabled>Select Type</option>
						<option value="Teachers">Teachers Event/Task</option>
						<option value="Students">Students Event/Task</option>
						<option value="General">General</option>
					</select>
					</div>
				</div>
				<div class="col-md-4">
					<div class="form-group">
					<select name="semester_id" id="semester_id"  class="form-control" value="{{ old('semester_id') }}">
						<option selected disabled>Select Session</option>
						@foreach($semesters as $semester)
							<option value="{{ $semester->id }}">{{ $semester->semester_type }} {{ $semester->semester_year }}</option>
						@endforeach
					</select>
					</div>
				</div>
				<div class="col-md-4">
						<div class="form-group">
							<input type="date" placeholder="Select Date of Task" class="form-control" name="task_date" id="task_date"  value="{{ old('task_date') }}" />
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
			<h4 class="card-title ">Tasks List</h4>
			<p class="card-category"> </p>
		  </div>
		  <div class="card-body">
			<div class="table-responsive">
			  <table class="table">
				<thead class=" text-primary">
				 
				  <th>
						Task Title
				  </th>
				  <th>
						Group
				  </th>
				  <th>
						Date
				  </th>
				  <th>
						Session
				  </th>
				  <th>
					Status
				  </th>
				  <th>
					Action
				  </th>
				</thead>
				<tbody>
					@foreach($tasks as $task)
				  <tr>
					<td>
						{{ $task->task_title }} 
					</td>
					<td>
						 {{ $task->task_type }} 
					</td>
					<td>
							{{ $task->task_date }}
					</td>
					<td>
							{{ $task->semester->semester_type }} {{ $task->semester->semester_year }}
					</td>
					<td>
						@if($task->status == "active")
							<label class="badge badge-success">{{$task->status}}</label>
						@else 
							<label class="badge badge-danger">{{$task->status}}</label>
						@endif
							
					</td>
					<td class="text-primary">
							<a href="{{route('TaskDelete', $task->id)}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
						@if($task->status == 'active')
							<a href="{{route('TaskDeactivate', $task->id)}}" class="btn btn-dark" title="Deactivate Now"><i class="fa fa-times-circle"></i></a>
						@else
							<a href="{{route('TaskActivate', $task->id)}}" class="btn btn-info" title="Activate Now"><i class="fa fa-check-circle"></i></a>
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

</script>
@endsection
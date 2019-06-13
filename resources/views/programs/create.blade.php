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
		<h4 class="card-title ">Add New Program	</h4>
		{{-- <p class="card-category"> Here is a subtitle for this table</p> --}}
		</div>
		<div class="card-body">
		<div class="">
		<form action="{{ route('ProgramStore') }}" method="post">
			<div class="row">
				@csrf
				<div class="col-md-6">
					<div class="form-group">
					<input type="text" name="program_name" id="program_name" value="{{old('program_name')}}"  class="form-control" placeholder="Enter program Name"/>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
					<input type="text" name="program_description" id="program_description" value="{{old('program_description')}}"  class="form-control" placeholder="Enter program Description"/>
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
			<h4 class="card-title ">Program List</h4>
			<p class="card-category"> </p>
		  </div>
		  <div class="card-body">
			<div class="table-responsive">
			  <table class="table">
				<thead class=" text-primary">
				 
				  <th>
						Program Name
				  </th>
				  <th>
					Status
				  </th>
				  <th>
					Action
				  </th>
				</thead>
				<tbody>
					@foreach($programs as $program)
				  <tr>
					<td>
						{{ $program->program_name }} 
					</td>
					<td>
						@if($program->status == "active")
							<label class="badge badge-success">{{$program->status}}</label>
						@else 
							<label class="badge badge-danger">{{$program->status}}</label>
						@endif
							
					</td>
					<td class="text-primary">
						<a href="{{route('ProgramDelete', $program->id)}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
						@if($program->status == 'active')
						<a href="{{route('ProgramDeactivate', $program->id)}}" class="btn btn-dark" title="Deactivate Now"><i class="fa fa-times-circle"></i></a>
						@else
						<a href="{{route('ProgramActivate', $program->id)}}" class="btn btn-info" title="Activate Now"><i class="fa fa-check-circle"></i></a>
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
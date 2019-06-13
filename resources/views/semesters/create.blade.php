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
		<h4 class="card-title ">Add New Session	</h4>
		{{-- <p class="card-category"> Here is a subtitle for this table</p> --}}
		</div>
		<div class="card-body">
		<div class="">
		<form action="{{ route('SemesterStore') }}" method="post">
			<div class="row">
				@csrf
				<div class="col-md-6">
					<div class="form-group">
					<input type="hidden" name="user_id" value="{{auth()->user()->id}}"/>
					<label>Select Type of Session</label>
					<select name="semester_type" id="semester_type"  class="form-control">
						<option selected disabled>Select Type</option>
						<option value="Fall">Fall</option>
						<option value="Spring">Spring</option>
						<option value="Summer">Summer</option>
					</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label>Select Year of Session</label>
					<select name="semester_year" class="form-control" id="semester_year">
						<option disabled selected>Select Year</option>
						<option value="2019">2019</option>
						<option value="2020">2020</option>
						<option value="2021">2021</option>
						<option value="2022">2022</option>
						<option value="2023">2023</option>
						<option value="2024">2024</option>
					</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
						<label> Select Starting Date of Session</label>
					<input type="date" name="start_date" id="start_date" class="form-control" value="{{ old('start_date')}}" />
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
							<label> Select Ending Date of Session</label>
						<input type="date" name="end_date" id="end_date" class="form-control" value="{{ old('end_date')}}" />
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
			<h4 class="card-title ">Session List</h4>
			<p class="card-category"> </p>
		  </div>
		  <div class="card-body">
			<div class="table-responsive">
			  <table class="table">
				<thead class=" text-primary">
				 
				  <th>
						Session Name
					</th>
					<th>
						Starting Date
					</th>
					<th>
						Ending Date
					</th>
				  <th>
					Status
				  </th>
				  <th>
					Action
				  </th>
				</thead>
				<tbody>
					@foreach($semesters as $semester)
				  <tr>
					<td>
						{{ $semester->semester_type }} - {{ $semester->semester_year }}  {{ $semester->semester_title }}
					</td>
					<td>
						{{ date('d-m-y', strtotime($semester->semester_start_date))  }}
					</td>
					<td>
							{{ date('d-m-y', strtotime($semester->semester_end_date)) }}
					</td>
					<td>
						@if($semester->status == "active")
							<label class="badge badge-success">{{$semester->status}}</label>
						@else 
							<label class="badge badge-danger">{{$semester->status}}</label>
						@endif
							
					</td>
					<td class="text-primary">
						<a href="{{route('SemesterDelete', $semester->id)}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
						@if($semester->status == 'active')
						<a href="{{route('SemesterDeactivate', $semester->id)}}" class="btn btn-dark" title="Deactivate Now"><i class="fa fa-times-circle"></i></a>
						@else
						<a href="{{route('SemesterActivate', $semester->id)}}" class="btn btn-info" title="Activate Now"><i class="fa fa-check-circle"></i></a>
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
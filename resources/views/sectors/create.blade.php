@extends('layouts.admin')
@section('title')
	Property Admin Panel
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

<div class="col-md-12">
	<div class="card">
		<div class="card-header card-header-primary">
		<h4 class="card-title ">Add New Sector</h4>
		{{-- <p class="card-category"> Here is a subtitle for this table</p> --}}
		</div>
		<div class="card-body">
		<div class="">
		<form action="{{ route('SectorStore') }}" method="post">
			<div class="row">
				@csrf
				<div class="col-md-6">
					<div class="form-group">
					<label class="bmd-label-floating">Sector Name</label>
					<input type="text" class="form-control" name="sector_name" id="sector_name" >
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
					<select name="city_id" class="form-control" id="city_id">
						<option disabled selected>Select City</option>
						@foreach($cities as $city)
							<option value="{{$city->id}}">{{$city->city_name}}</option>
						@endforeach
					</select>
					</div>
				</div>
				<div class="col-md-6">
					<div class="form-group">
					<select name="status" class="form-control" id="status">
						<option disabled selected>Select Status</option>
						<option value="active">Active</option>
						<option value="inactive">Deactivate</option>
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
			<h4 class="card-title ">Sector List</h4>
			<p class="card-category"> </p>
		  </div>
		  <div class="card-body">
			<div class="table-responsive">
			  <table class="table">
				<thead class=" text-primary">
				 
				  <th>
					Sector Name
				  </th>
				  <th>
					City
				  </th>
				  <th>
					Status
				  </th>
				  <th>
					Action
				  </th>
				</thead>
				<tbody>
					@foreach($sectors as $sector)
				  <tr>
					<td>
						{{$sector->sector_name}}
					</td>
					<td>
						{{$sector->city_id}}
					</td>
					<td>
						@if($sector->status == "active")
							<label class="badge badge-success">{{$sector->status}}</label>
						@else 
							<label class="badge badge-danger">{{$sector->status}}</label>
						@endif
							
					</td>
					<td class="text-primary">
						<a href="{{route('SectorDelete', $sector->id)}}" class="btn btn-danger"><i class="fa fa-trash"></i></a>
						@if($sector->status == 'active')
						<a href="{{route('SectorDeactivate', $sector->id)}}" class="btn btn-dark" title="Deactivate Now"><i class="fa fa-times-circle"></i></a>
						@else
						<a href="{{route('SectorActivate', $sector->id)}}" class="btn btn-info" title="Activate Now"><i class="fa fa-check-circle"></i></a>
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
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
                          
                        </div>
                      </div>
                    </div>
                   
                  </div>
                </div>
              </div>
</div>


<script>
				
</script>
@endsection
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
                    <div class="col-md-8">
                      <div class="card">
                        <div class="card-header card-header-primary">
                          <h4 class="card-title">Edit Profile</h4>
                          
                        </div>
                        <div class="card-body">
                          <form action="{{route('ProfileUpdate')}}" method="post">
                              @csrf
                            <div class="row">
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Username</label>
                                <input type="text" name="" value="{{$user->username}}" class="form-control" >
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Email address</label>
                                  <input type="email" value="{{$user->email}}" name=""  class="form-control">
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Fist Name</label>
                                  <input type="text" name="first_name" class="form-control" value="{{$user->first_name}}">
                                </div>
                              </div>
                              <div class="col-md-6">
                                <div class="form-group">
                                  <label class="bmd-label-floating">Last Name</label>
                                  <input type="text" name="last_name" class="form-control" value="{{$user->last_name}}">
                                </div>
                              </div>
                            </div>
                            <div class="row">
                              
                              <div class="col-md-8">
                                  <div class="form-group">
                                      <label class="bmd-label-floating">Phone</label>
                                  <input type="text" name="phone" class="form-control" value="{{$user->phone}}"/>
                                  </div>
                              </div>
                            </div>
                            <button type="submit" class="btn btn-primary pull-right">Update Profile</button>
                            <div class="clearfix"></div>
                          </form>
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
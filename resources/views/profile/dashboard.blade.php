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
                          <div class="row m-4">
                            @foreach($data['sessions'] as $session)
                              <div class="col-md-3">
                                  <div class="">
                                    <div class="card-header card-header-primary">
                                          <h4 class="card-title">{{ $session->semester_type }} {{ $session->semester_year }}</h4>
                                          <p class="category">From : {{ $session->semester_start_date }} <br/>
                                              To :  {{ $session->semester_end_date }}</p>
                                          <a href="{{ route('SessionEvents', $session->id )}}" class="btn btn-default"> Events </a>
                                      </div>
                                  </div>
                              </div>
                            @endforeach
                          </div>
                            {{-- <div id='calendar'></div> --}}
                        </div>
                      </div>
                    </div>
                   
                  </div>
                </div>
              </div>
</div>


@endsection
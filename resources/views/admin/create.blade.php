@extends('layouts.admin')

@section('content')

<div class="container">
    <div class="row">
        <div class="col-lg-10 offset-md-1 mt-5">
            <div class="card">
                <div class="card-header">
                    @if(Session::has('message'))
                        <p class="alert alert-success">{!! Session::get('message') !!}</p>
                    @endif
                    <div class="">
                        <strong>Add new user</strong>
                        <small> Details</small> 
                    </div>
                </div>

                <div class="card-body card-block">
                        <form method="POST" action="{{ route('UserStore') }}">
                                @csrf
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="username" class="bmd-label-floating">{{ __('User Name') }}</label>
                    
                                        <input id="username" type="text" class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username" value="{{ old('username') }}" required>
                    
                                        @if ($errors->has('username'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('username') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="first_name" class="bmd-label-floating">{{ __('First Name') }}</label>
                    
                                        <input id="first_name" type="text" class="form-control{{ $errors->has('first_name') ? ' is-invalid' : '' }}" name="first_name" value="{{ old('first_name') }}" required autofocus>
                    
                                        @if ($errors->has('first_name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('first_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="last_name" class="bmd-label-floating">{{ __('Last Name') }}</label>
                    
                                        <input id="last_name" type="text" class="form-control{{ $errors->has('last_name') ? ' is-invalid' : '' }}" name="last_name" value="{{ old('last_name') }}" required autofocus>
                    
                                        @if ($errors->has('last_name'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('last_name') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="phone" class="bmd-label-floating">{{ __('Phone') }}</label>
                    
                                        <input id="phone" type="text" class="form-control{{ $errors->has('phone') ? ' is-invalid' : '' }}" name="phone" value="{{ old('phone') }}" required>
                    
                                        @if ($errors->has('phone'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('phone') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="email" class="bmd-label-floating">{{ __('E-Mail Address') }}</label>
                    
                                        <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required>
                    
                                        @if ($errors->has('email'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('email') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="password" class="bmd-label-floating">{{ __('Password') }}</label>
                    
                                        <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>
                    
                                        @if ($errors->has('password'))
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $errors->first('password') }}</strong>
                                            </span>
                                        @endif
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="password-confirm" class="bmd-label-floating">{{ __('Confirm Password') }}</label>
                    
                                        <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required>
                                    </div>
                                </div>
                    
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="password-confirm" class="bmd-label-floating">Select Batch and Program</label>
                    
                                        <select name="batch_id" id="batch_id" class="form-control">
                                            <option value="" disabled selected>Select Batch</option>
                                            @foreach($data as $batch)
                                            <option value="{{ $batch->id }}">{{ $batch->name }} - {{ $batch->programs->program_name }}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                        <div class="col-md-8 offset-md-2">
                                        <label for="password-confirm" class="bmd-label-floating">Select User Role</label>
                        
                                            <select name="role" id="role" class="form-control">
                                                <option value="" disabled selected>Select Role</option>
                                                <option value="admin">admin</option>
                                                <option value="teacher">Teacher</option>
                                                <option value="student">Student</option>
                                               
                                            </select>
                                        </div>
                                    </div>
                                <div class="form-group">
                                    <div class="col-md-8 offset-md-2">
                                    <label for="password-confirm" class="bmd-label-floating">Status</label>
                    
                                    <select name="status" id="status" class="form-control">
                                            <option value="active">Active</option>
                                            <option value="sp">Inactive</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-md-8 offset-md-2 offset-md-4">
                    
                                <div class="form-group mb-0">
                                        <button type="submit" class="btn btn-primary">
                                            {{ __('Register') }}
                                        </button>
                                    </div>
                                </div>
                            </form>
                </div>

            </div>

        </div>

    </div>
</div>
@endsection
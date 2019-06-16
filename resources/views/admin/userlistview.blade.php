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
                    <strong>Users</strong>
                    <small> Details</small> 
                    
                <a href="{{ route('UserAdd')}}" class="btn btn-primary">Add New User</a>
 
                </div>

                <div class="card-body card-block">
                    <table id="" class="table   table-striped">
                        <thead>
                            <th>No</th>
                            <th>Name</th>
                            <th>role</th>
                            <th>email</th>
                            <th> Action </th>
                        </thead>
                        <tbody>
                            <?php $index = 1; ?>
                            @foreach($data as $user)
                                @if(auth()->user()->id == $user->id)
                                    @continue
                                @endif
                                <tr>
                                    <td>{{$index++}}</td>
                                    <td>{{$user->first_name}} {{$user->last_name}}</td>
                                    <td>{{($user->role == 'user' ? 'student' : $user->role )}}</td>
                                    <td>{{$user->email}}</td>
                                <td> <form method="post" action="{{ action('AdminController@delete')}}">
                                            
                                <input type="hidden" name="user_id" value="{{ $user->id }}"/>
                                        @csrf
                                        <button type="submit" class="btn btn-primary">
                                            <i class="fa fa-times"></i></button>

                                            </form>
                                        @if( $user->status == 'active')
                                            <a href="{{ route('UserDeactivate', $user->id)}}" title="Deactivate Now" class="btn btn-danger">
                                                <i class="fa fa-support"></i>
                                            </a>
                                        @else
                                        <a href="{{ route('UserActivate', $user->id)}}" title="Activate Now" class="btn btn-success">
                                                <i class="fa fa-support"></i>
                                            </a>
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
</div>

{{-- model goes here --}}
<!-- Modal -->
<script type="text/javascript">
    $(document).ready(function() {
    $('#usertableview').DataTable();
} );
</script>
@endsection
@section('modal')
<div class="modal fade" id="deleteModal" tabindex="" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Delete user</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        @foreach($data as $user)
            <table id="modalDeleteTable">
                <tr>
                    <td width="200px">{{$user->name}}</td>
                    <td width="100px">
                        <form method="post" action="{{route('UserDelete')}}">
                            {{csrf_field()}}
                            <input type="hidden" name="id" value="{{$user->id}}">
                            <button type="submit" class="btn btn-danger" v>Delete </button>
                        </form>
                        
                    </td>
                </tr>
            </table>
        @endforeach
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



@endsection

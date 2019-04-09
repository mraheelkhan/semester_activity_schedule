<div class="menu text-right">
		<div class="menu_close"><i class="fa fa-times" aria-hidden="true"></i></div>
		<div class="menu_log_reg">
			<div class="log_reg d-flex flex-row align-items-center justify-content-end">
				<ul class="d-flex flex-row align-items-start justify-content-start">
					@if(!Auth::check())
                        <li><a href="{{url('/login')}}">Login</a></li>
                        <li><a href="{{url('/register')}}">Register</a></li>
                    @endif
                     @if(Auth::check())
                        <li><a href="{{ url('/profile') }}">Profile</a></li>
                        <li><a href="{{ route('logout') }}">Logout</a></li>
                    @endif
				</ul>
			</div>
			<nav class="menu_nav">
				<ul>
				<li class="active"><a href="{{url('/')}}">Home</a></li>
                <li><a href="{{url('/rents')}}">Renting</a></li>
                <li><a href="{{url('/sales')}}">Sales</a></li>
                <li><a href="{{ url('/submited') }}">My Listing</a></li>
                {{-- <li><a href="#">Areas</a></li> --}}
                <li><a href="{{ url('/submit/create') }}">New Ad</a></li>
                <li><a href="#">Contact</a></li>
				</ul>
			</nav>
		</div>
	</div>

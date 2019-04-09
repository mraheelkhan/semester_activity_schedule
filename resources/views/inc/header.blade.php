<header class="header">

    @if(!Auth::check())
    <!-- Header Bar -->
    <div class="header_bar d-flex flex-row align-items-center justify-content-start">
        <div class="header_list">
            <ul class="d-flex flex-row align-items-center justify-content-start">
                <!-- Phone -->
                <li class="d-flex flex-row align-items-center justify-content-start">
                    <div><img src="images/phone-call.svg" alt=""></div>
                    <span>+92 42 990221 13</span>
                </li>
                <!-- Address -->
                <li class="d-flex flex-row align-items-center justify-content-start">
                    <div><img src="images/placeholder.svg" alt=""></div>
                    <span>Main Str, no 23, Blue Area, Islamabad</span>
                </li>
                <!-- Email -->
                <li class="d-flex flex-row align-items-center justify-content-start">
                    <div><img src="images/envelope.svg" alt=""></div>
                    <span>hira@raima.com</span>
                </li>
            </ul>
        </div>
        <div class="ml-auto d-flex flex-row align-items-center justify-content-start">
            <div class="social">
                <ul class="d-flex flex-row align-items-center justify-content-start">
                    <li><a href="#"><i class="fa fa-pinterest" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-dribbble" aria-hidden="true"></i></a></li>
                    <li><a href="#"><i class="fa fa-behance" aria-hidden="true"></i></a></li>
                </ul>
            </div>
            <div class="log_reg d-flex flex-row align-items-center justify-content-start">
                <ul class="d-flex flex-row align-items-start justify-content-start">
                    @if(!Auth::check())
                        <li><a href="{{url('/login')}}">Login</a></li>
                        <li><a href="{{url('/register')}}">Register</a></li>
                    @endif
                </ul>
            </div>
        </div>
    </div>
    @endif

    <!-- Header Content -->
    <div class="header_content d-flex flex-row align-items-center justify-content-start">
        <div class="logo"><a href="{{url('/')}}">Property<span>FYP</span></a></div>
        <nav class="main_nav">
            <ul class="d-flex flex-row align-items-start justify-content-start">
                <li class="@if(Request::route()->getName() == 'HomePage') active @endif">
                    <a href="{{url('/')}}">Home</a>
                </li>
                <li class="@if(Request::route()->getName() == 'Renting') active @endif">
                    <a href="{{url('/rents')}}">Renting</a>
                </li>
                <li class="@if(Request::route()->getName() == 'Sales') active @endif">
                    <a href="{{url('/sales')}}">Sales</a>
                </li>
                <li class="@if(Request::route()->getName() == 'SubmitedList') active @endif">
                    <a href="{{ url('/submited') }}">My Listing</a>
                </li>
                @if(Auth::check())
                    <li class="@if(Request::route()->getName() == 'Dashboard') active @endif">
                        <a href="{{ url('/profile') }}">Profile</a>
                    </li>
                    <li><a href="{{ route('logout') }}">Logout</a></li>
                @endif
            </ul>
        </nav>
        <div class="submit ml-auto"><a href="{{ url('/submit/create') }}">submit listing</a></div>
        <div class="hamburger ml-auto"><i class="fa fa-bars" aria-hidden="true"></i></div>
    </div>

</header>
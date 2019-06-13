<div class="sidebar" data-color="purple" data-background-color="white" data-image="../assets/img/sidebar-1.jpg">
  <!--
    Tip 1: You can change the color of the sidebar using: data-color="purple | azure | green | orange | danger"

    Tip 2: you can also add an image using data-image tag
-->
  <div class="logo">
  <a href="{{url('profile')}}" class="simple-text logo-normal">
      Semester Admin Panel
    </a>
  </div>
  <div class="sidebar-wrapper">
    <ul class="nav">
    <li class="nav-item @if(Request::route()->getName() == 'Dashboard') active @endif">
        <a class="nav-link" href="{{route('Dashboard')}}">
          <i class="material-icons">dashboard</i>
          <p>Dashboard</p>
        </a>
      </li>
      <li class="nav-item @if(Request::route()->getName() == 'ListingList') active @endif">
          <a class="nav-link" href="#">
              <i class="material-icons">fullscreen</i>
              <p>All Tasks</p>
            </a>
          </li>
      <hr>
      <li class="nav-item @if(Request::route()->getName() == 'Programs') active @endif">
        <a class="nav-link" href="{{Route('Programs')}}">
            <i class="material-icons">building</i>
            <p>Programs</p>
          </a>
      </li>
      <li class="nav-item @if(Request::route()->getName() == 'Batches') active @endif">
        <a class="nav-link" href="{{Route('Batches')}}">
            <i class="material-icons">building</i>
            <p>Batches</p>
          </a>
      </li>
      <li class="nav-item @if(Request::route()->getName() == 'Semester') active @endif">
      <a class="nav-link" href="{{Route('Semester')}}">
          <i class="material-icons">train</i>
          <p>Session</p>
        </a>
      </li>
      <li class="nav-item @if(Request::route()->getName() == 'Task') active @endif">
      <a class="nav-link" href="{{route('Task')}}">
          <i class="material-icons">events</i>
          <p>Tasks</p>
        </a>
      </li>
      <li class="nav-item @if(Request::route()->getName() == 'Profile') active @endif ">
      <a class="nav-link" href="{{ route('Profile')}}">
          <i class="material-icons">person</i>
          <p>User Profile</p>
        </a>
      </li>
    </ul>
  </div>
</div>
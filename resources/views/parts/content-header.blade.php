<div class="app-content-header">
    <div class="container-fluid">
        <!--begin::Row-->
        <div class="row">
            <div class="col-sm-6">
                @hasSection('page-title')
                    @yield('page-title')     
                @endif

                @isset($breadcrumbs)
                    <ol class="breadcrumb">
                        @foreach($breadcrumbs as $breadcrumb)
                            <li class="breadcrumb-item"><a href="#">{{ $breadcrumb['label'] }}</a></li>
                        @endforeach
                    </ol>
                @endisset
            </div>
            <div class="col-sm-6">
                Actions
            </div>
        </div>
        <!--end::Row-->
    </div>
</div>
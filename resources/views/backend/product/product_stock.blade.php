@extends('admin.admin_dashboard')
@section('admin')



<div class="page-content">
    <!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">All Product Stock</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">All Product Stock <span class="badge rounded-pill bg-danger">{{count($products)}}</span></li>
                </ol>
            </nav>
        </div>
        <div class="ms-auto">
        </div>
    </div>
    <!--end breadcrumb-->

    <hr/>
    <div class="card">
        <div class="card-body">
            <div class="table-responsive">
                <table id="example" class="table table-striped table-bordered" style="width:100%">
                    <thead>
                        <tr>
                            <th>SL</th>
                            <th>Name</th>
                            <th>Serial ID</th>
                            <th>size</th>
                            <th>owner</th>
                            <th>price</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($products as $key => $item)
                        <tr>
                            <td>{{$key+1}}</td>
                            <td>{{$item->product->product_name}}</td>
                            <td>{{$item->serial_id}}</td>
                            <td>{{$item->size}}</td>
                            <td>{{$item->owner_name->name}}</td>
                            <td>{{$item->price}}</td>


                            <td>
                                @if ($item->status == 'available')
                                    <span class="badge rounded-pill bg-success">available</span>
                                @else
                                    <span class="badge rounded-pill bg-danger">sold</span>
                                @endif
                            </td>
                        </tr>

                        @endforeach
                    </tbody>
                    <tfoot>
                        <tr>
                            <th>SL</th>
                            <th>Image</th>
                            <th>Product Name</th>
                            <th>Price</th>
                            <th>QTY</th>
                            <th>Discount</th>
                            <th>Status</th>
                        </tr>
                    </tfoot>
                </table>
            </div>
        </div>
    </div>
</div>


@endsection
@extends('admin.admin_dashboard')
@section('admin')



<div class="page-content">
    <!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Admin Return Order Details</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Admin Return Order Details</li>
                </ol>
            </nav>
        </div>
        <div class="ms-auto">
            <div class="btn-group">

            </div>
        </div>
    </div>
    <!--end breadcrumb-->
    <hr/>
    <div class="row row-cols-1 row-cols-md-1 row-cols-lg-2 row-cols-xl-2">
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4>Shipping Details</h4>

                    <hr>

                    <div class="card-body">
                        <table class="table" style="background: #F4F6FA; font-weight:600;">
                            <tr>
                                <th>Shipping Name:</th>
                                <th>{{$order->name}}</th>
                            </tr>
                            <tr>
                                <th>Shipping Phone:</th>
                                <th>{{$order->phone}}</th>
                            </tr>
                            <tr>
                                <th>Shipping Email:</th>
                                <th>{{$order->email}}</th>
                            </tr>
                            <tr>
                                <th>Shipping Address:</th>
                                <th>{{$order->address}}</th>
                            </tr>
                            <tr>
                                <th>Division:</th>
                                <th>{{$order->division->division_name}}</th>
                            </tr>
                            <tr>
                                <th>District:</th>
                                <th>{{$order->district->district_name}}</th>
                            </tr>
                            <tr>
                                <th>State:</th>
                                <th>{{$order->state->state_name}}</th>
                            </tr>
                            <tr>
                                <th>Post code:</th>
                                <th>{{$order->post_code}}</th>
                            </tr>
                            <tr>
                                <th>Order Date:</th>
                                <th>{{$order->order_date}}</th>
                            </tr>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="col">
            <div class="card">
                <div class="card-header">
                    <h4>Order Details <span class="text-danger">Invoice : {{$order->invoice_no}}</span></h4>

                    <hr>

                    <div class="card-body">
                        <table class="table" style="background: #F4F6FA; font-weight:600;">
                            <tr>
                                <th>Name:</th>
                                <th>{{$order->user->name}}</th>
                            </tr>
                            <tr>
                                <th>Phone:</th>
                                <th>{{$order->user->phone}}</th>
                            </tr>
                            <tr>
                                <th>Payment Type:</th>
                                <th>{{$order->payment_method}}</th>
                            </tr>
                            <tr>
                                <th>Transaction ID:</th>
                                <th class="text-danger">{{$order->transaction_id}}</th>
                            </tr>
                            <tr>
                                <th>Currency:</th>
                                <th>{{$order->currency}}</th>
                            </tr>
                            <tr>
                                <th>Order Amount:</th>
                                <th>₱ {{round($order->amount, 2)}}</th>
                            </tr>

                            <tr>
                                <th>Order Status:</th>
                                <th><span class="badge bg-danger" style="font-size: 15px;">{{$order->status}}</span></th>
                            </tr>

                            <tr>
                                <th>Return Reason:</th>
                                <th>{{$order->return_reason}}</th>
                            </tr>
                            @if ($order->return_order == 1)
                                <tr>
                                    <th>Return Schedule:</th>
                                    <form method="POST" action="{{route('return.request.approve',$order->id)}}">
                                        @csrf
                                        <input type="hidden" value="{{$order->id}}" name="order_id">
                                        <th><input type="date" name="date"></th>
                                        <th><input type="submit" class="btn btn-rounded btn-primary" value="Approve Request"></th>
                                    </form>
                                </tr>
                            @elseif ($order->return_order == 2)
                                <tr>
                                    <th></th>
                                    <th class="badge rounded-pill bg-info text-dark">Request Accepted</th>
                                </tr>
                            @endif
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="row row-cols-1 row-cols-md-1 row-cols-lg-2 row-cols-xl-1">
        <div class="col">
            <div class="card">
                <div class="table-responsive">
                    <table class="table" style="font-weight:600;">
                        <tbody>
                            <tr>
                                <td class="col-md-1">
                                    <label>Image</label>
                                </td>
                                <td class="col-md-2">
                                    <label>Product Name</label>
                                </td>
                                <td class="col-md-2">
                                    <label>Vendor Name</label>
                                </td>
                                <td class="col-md-2">
                                    <label>Product Code</label>
                                </td>
                                <td class="col-md-1">
                                    <label>Size</label>
                                </td>
                                <td class="col-md-3">
                                    <label>Price</label>
                                </td>
                            </tr>
                            @foreach ($orderItem as $item)

                            <tr>
                                <td class="col-md-1">
                                    <label><img style="width:50px; height:50px;" src="{{asset($item->product->product_thumbnail)}}" alt=""></label>
                                </td>
                                <td class="col-md-2">
                                    <label>{{$item->product->product_name}}</label>
                                </td>

                                @if ($item->vendor_id == null)
                                <td class="col-md-2">
                                    <label>Owner</label>
                                </td>
                                @else
                                <td class="col-md-2">
                                    <label>{{$item->product->vendor->name}}</label>
                                </td>
                                @endif
                                <td class="col-md-2">
                                    <label>{{$item->product->product_code}}</label>
                                </td>

                                @if ($item->size == null)
                                <td class="col-md-1">
                                    <label></label>
                                </td>
                                @else
                                <td class="col-md-1">
                                    <label>{{$item->size}}</label>
                                </td>
                                @endif
                                <td class="col-md-3">
                                    <label>₱ {{round($item->price, 2)}}</label>
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


@endsection
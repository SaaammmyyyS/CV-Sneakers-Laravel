@extends('admin.admin_dashboard')
@section('admin')



<div class="page-content">
    <!--breadcrumb-->
    <div class="page-breadcrumb d-none d-sm-flex align-items-center mb-3">
        <div class="breadcrumb-title pe-3">Admin Order Details</div>
        <div class="ps-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 p-0">
                    <li class="breadcrumb-item"><a href="javascript:;"><i class="bx bx-home-alt"></i></a>
                    </li>
                    <li class="breadcrumb-item active" aria-current="page">Admin Order Details</li>
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
                                <th></th>
                                @if ($order->status == 'pending')
                                    <th><a href="{{route('pending-confirm', $order->id)}}" id="confirm" class="btn btn-block btn-success">Confirm Order</a></th>
                                @elseif ($order->status == 'confirm')
                                    <form method="POST" action="{{route('confirm.processing')}}">
                                        @csrf
                                        <input type="hidden" name="order_id" value="{{$order->id}}">
                                        <tr>
                                            <th>Contact Number:</th>
                                            <th><input name="contact" type="text"></th>
                                        </tr>
                                        <tr>
                                            <th>Recipient name:</th>
                                            <th><input name="recipient_name" type="text" required></th>
                                        </tr>
                                        <tr>
                                            <th>Courier Company:</th>
                                            <th><input name="courier_company" type="text" required></th>
                                        </tr>
                                        <tr>
                                            <th>Delivery Cost:</th>
                                            <th><input name="delivery_cost" type="text" required></th>
                                        </tr>
                                        <tr>
                                            <th>Notes:</th>
                                            <th><textarea name="notes" class="form-control" rows="3"></textarea></th>
                                        </tr>
                                        <th></th>
                                        <th><input type="submit" class="btn btn-block btn-success"></th>
                                    </form>
                                @elseif ($order->status == 'processing')
                                    <th><a href="{{route('processing-deliver', $order->id)}}" id="deliver" class="btn btn-block btn-success">Deliver Order</a></th>
                                @endif
                            </tr>
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
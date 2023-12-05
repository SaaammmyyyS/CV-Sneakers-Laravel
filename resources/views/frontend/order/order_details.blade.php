@extends('dashboard')
@section('user')

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>


<div class="page-header breadcrumb-wrap">
    <div class="container">
        <div class="breadcrumb">
            <a href="index.html" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
            <span></span> My Account
        </div>
    </div>
</div>
<div class="page-content pt-50 pb-50">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 m-auto">
                <div class="row">


                    @include('frontend.body.dashboard_sidebar_menu')


                    <div class="col-md-9">
                        <div class="row">


                            <div class="col-md-6">
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



                            <div class="col-md-6">
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
                                                    <th>₱ {{ round($order->amount, 2)}}</th>
                                                </tr>
                                                <tr>
                                                    <th>Order Status:</th>
                                                    <th><span class="badge rounded-pill bg-warning">{{$order->status}}</span></th>
                                                </tr>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
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
                                <label><img style="width:100px; height:100px;" src="{{asset($item->product->product_thumbnail)}}" alt=""></label>
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
                                <label>{{$item->price}}</label>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
        <!--  // Start Return Order Option  -->
        @if ($order->return_reason == NULL)
            @if($order->status == 'delivered')
            <form action="{{ route('return.order',$order->id) }}" method="post">
                @csrf

                <div class="form-group" style=" font-weight: 600; font-size: initial; color: #000000; ">
                    <label>Order Return Reason</label>
                    <textarea name="return_reason" class="form-control"  style="width:40%;"></textarea>
                </div>
                <button type="submit" class="btn-sm btn-danger" style="width:40%;">Order Return</button>
            </form>
            @endif
        @else
            <h5><span class=" " style="color:red;">You have send return request for this product</span></h5><br><br>
        @endif


        <!--  // End Return Order Option  -->
    </div>

</div>

@endsection
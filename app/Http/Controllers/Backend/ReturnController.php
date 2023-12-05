<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderItem;
use Illuminate\Http\Request;

class ReturnController extends Controller
{
    public function ReturnRequest(){
        $orders = Order::where('return_order', 1)->orderBy('id', 'DESC')->get();
        return view('backend.return_order.return_request', compact('orders'));
    } // End Method


    public function ReturnOrderDetails($order_id){
        $order = Order::with('division', 'district', 'state', 'user')->where('id', $order_id)->first();
        $orderItem = OrderItem::with('product')->where('order_id', $order_id)->orderBy('id', 'DESC')->get();


        return view('backend.return_order.return_order_details', compact('order', 'orderItem'));
    } // End Method

    public function ReturnRequestApprove(Request $request, $order_id){

        Order::where('id', $order_id)->update([
            'return_order' => 2,
            'return_date' => $request->date
        ]);

        $notification = array(
            'message' => 'Return Order Successfully Approved',
            'alert-type' => 'success'
        );

        return view('backend.return_order.complete_return_request')->with($notification);
    } // End Method

    public function CompleteReturnRequest(){
        $orders = Order::where('return_order', 2)->orderBy('id', 'DESC')->get();
        return view('backend.return_order.complete_return_request', compact('orders'));
    } // End Method
}

<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Delivery;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductItem;
use App\Models\Records;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class OrderController extends Controller
{
    public function AdminPendingOrder(){
        $orders = Order::where('status', 'pending')->orderBy('id', 'DESC')->get();
        return view('backend.orders.pending_orders', compact('orders'));
    } // End Method

    public function AdminOrderDetails($order_id){
        $order = Order::with('division', 'district', 'state', 'user')->where('id', $order_id)->first();
        $orderItem = OrderItem::with('product')->where('order_id', $order_id)->orderBy('id', 'DESC')->get();


        return view('backend.orders.admin_order_details', compact('order', 'orderItem'));
    } // End Method

    public function AdminConfirmedOrder(){
        $orders = Order::where('status', 'confirm')->orderBy('id', 'DESC')->get();
        return view('backend.orders.confirmed_orders', compact('orders'));
    } // End Method

    public function AdminProcessingOrder(){
        $orders = Order::where('status', 'processing')->orderBy('id', 'DESC')->get();
        return view('backend.orders.processing_orders', compact('orders'));
    } // End Method

    public function AdminDeliveredOrder(){
        $orders = Order::where('status', 'delivered')->orderBy('id', 'DESC')->get();
        return view('backend.orders.delivered_orders', compact('orders'));
    } // End Method

    public function PendingToConfirm($order_id){
        $orderItems = OrderItem::where('order_id', $order_id)->get();


        // Check if stock is available
        foreach ($orderItems as $item){
            $available_products = ProductItem::where('product_id', $item->product_id)->where('status', '=', 'available')->where('size', '=', $item->size)->first();
            if ($available_products == null) {
                $notification = array(
                    'message' => 'Insufficient stock',
                    'alert-type' => 'error'
                );
                return redirect()->back()->with($notification);
            }
        }

        foreach ($orderItems as $item) {
            $available_products = ProductItem::where('product_id', $item->product_id)->where('status', '=', 'available')->where('size', '=', $item->size)->first();
            $product = Product::findOrFail($item->product_id);

            OrderItem::findOrFail($item->id)->update([
                'product_item_id' => $available_products->id,
            ]);

            ProductItem::findOrFail($available_products->id)->update([
                'status' => 'sold',
            ]);

            Order::findOrFail($order_id)->update([
                'status' => 'confirm',
            ]);

            Product::findOrFail($item->product_id)->update([
                'product_qty' =>  $product->product_qty - 1,
            ]);

        }
        $notification = array(
            'message' => 'Order Confirm Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('admin.confirmed.order')->with($notification);


    } // End Method

    public function ConfirmToProcessing(Request $request){
        $order_id = $request->order_id;
        Order::findOrFail($order_id)->update(['status' => 'processing']);

        Delivery::insert([
            'order_id' => $order_id,
            'contact' => $request->contact,
            'recipient_name' => $request->recipient_name,
            'courier_company' => $request->courier_company,
            'delivery_cost' => $request->delivery_cost,
            'status' => 'processing',
            'notes' => $request->notes,
            'created_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Order Processing Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('admin.processing.order')->with($notification);
    } // End Method

    public function ProcessingToDeliver($order_id){
        $product = OrderItem::where('order_id', $order_id)->get();
        // foreach($product as $item){
        //     Product::where('id',$item->product_id)->update([
        //         'product_qty' => DB::raw('product_qty-'.$item->qty)
        //     ]);
        // }
        $order = Order::findOrFail($order_id);

        $delivery_data = Delivery::where('order_id', $order_id)->first();
        Delivery::findOrFail($delivery_data->id)->update([
            'status' => 'delivered',
        ]);


        Records::insert([
            "admin_id" => Auth::id(),
            "order_id" => $order_id,
            "total_price" => $order->amount,
            "invoice_no" => $order->invoice_no,
            "type" => "stock out",
            "stock_out_date" => Carbon::now()->format('d/m/Y'),
        ]);


        Order::findOrFail($order_id)->update(['status' => 'delivered']);

        $notification = array(
            'message' => 'Order Delivered Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('admin.delivered.order')->with($notification);
    } // End Method

    public function AdminInvoiceDownload($order_id){
        $order = Order::with('division', 'district', 'state', 'user')->where('id', $order_id)->first();
        $orderItem = OrderItem::with('product')->where('order_id', $order_id)->orderBy('id', 'DESC')->get();

        $pdf = Pdf::loadView('backend.orders.admin_order_invoice', compact('order', 'orderItem'))->setPaper('a4')->setOption([
            'tempDir' => public_path(),
            'chroot' => public_path(),
        ]);
        return $pdf->download('invoice.pdf');
    } // End Method
}

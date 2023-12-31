<?php

namespace App\Http\Controllers\User;

use App\Http\Controllers\Controller;
use App\Mail\OrderMail;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\ProductItem;
use Carbon\Carbon;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\Facades\Session;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class StripeController extends Controller
{
    public function StripeOrder(Request $request){
        if (Session::has('coupon')) {
            $total_amount = Session::get('coupon')['total_amount'];
        }
        else{
            $total_amount = round(Cart::total());
        }
        \Stripe\Stripe::setApiKey('sk_test_51Nqnr8JyMbg1UYGzkcsa1JbOGtvfIP9RCoR824Dln8jJfwqQcGCGRt5E5GygFo8EKTlIM59E5e3AISYsETdwULNK00Ev0DTeXU');
        $token = $_POST['stripeToken'];


        $charge = \Stripe\Charge::create([
            'amount' => $total_amount*100,
            'currency' => 'usd',
            'description' => 'CV Sneakers Store',
            'source' => $token,
            'metadata' => ['order_id' => uniqid()],
        ]);

        $order_id = Order::insertGetId([
            'user_id' => Auth::id(),
            'division_id' => $request->division_id,
            'district_id' => $request->district_id,
            'state_id' => $request->state_id,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'post_code' => $request->post_code,
            'notes' => $request->notes,

            'payment_type' => $charge->payment_method,
            'payment_method' => 'Stripe',
            'transaction_id' => $charge->balance_transaction,
            'currency' => $charge->currency,
            'amount' => $total_amount,
            'order_number' => $charge->metadata->order_id,

            'invoice_no' => 'EOS'.mt_rand(10000000, 99999999),
            'order_date' => Carbon::now()->format('d F Y'),
            'order_month' => Carbon::now()->format('F'),
            'order_year' => Carbon::now()->format('Y'),

            'status' => 'pending',
            'created_at' => Carbon::now(),
        ]);

        // Start Send Email

        $invoice = Order::findOrFail($order_id);

        $data = [
            'invoice_no' => $invoice->invoice_no,
            'amount' => $total_amount,
            'name' => $invoice->name,
            'email' => $invoice->email,

        ];

        Mail::to($request->email)->send(new OrderMail($data));

        // End Send Email

        $carts = Cart::content();
        foreach ($carts as $cart) {
            for ($i=0; $i < $cart->qty; $i++) {
                OrderItem::insert([
                    'order_id' => $order_id,
                    'product_id' => $cart->id,
                    'vendor_id' => $cart->options->vendor,
                    'color' => $cart->options->color,
                    'size' => $cart->options->size,
                    'price' => $cart->price,
                    'created_at' => Carbon::now(),
                ]);
            }
        } // End Foreach


        if(Session::has('coupon')){
            Session::forget('coupon');
        }

        Cart::destroy();

        $notification = array(
            'message' => 'Your Order Place Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('dashboard')->with($notification);
    } // End Method

    public function CashOrder(Request $request){
        if (Session::has('coupon')) {
            $total_amount = Session::get('coupon')['total_amount'];
        }
        else{
            $total_amount = round(Cart::total());
        }

        $order_id = Order::insertGetId([
            'user_id' => Auth::id(),
            'division_id' => $request->division_id,
            'district_id' => $request->district_id,
            'state_id' => $request->state_id,
            'name' => $request->name,
            'email' => $request->email,
            'phone' => $request->phone,
            'address' => $request->address,
            'post_code' => $request->post_code,
            'notes' => $request->notes,

            'payment_type' => 'Cash On Delivery',
            'payment_method' => 'Cash On Delivery',
            'currency' => 'Usd',
            'amount' => $total_amount,

            'invoice_no' => 'EOS'.mt_rand(10000000, 99999999),
            'order_date' => Carbon::now()->format('d F Y'),
            'order_month' => Carbon::now()->format('F'),
            'order_year' => Carbon::now()->format('Y'),

            'status' => 'pending',
            'created_at' => Carbon::now(),
        ]);

        $invoice = Order::findOrFail($order_id);

        $data = [
            'invoice_no' => $invoice->invoice_no,
            'amount' => $total_amount,
            'name' => $invoice->name,
            'email' => $invoice->email,

        ];

        Mail::to($request->email)->send(new OrderMail($data));

        $carts = Cart::content();
        foreach ($carts as $cart) {
            for ($i=0; $i < $cart->qty; $i++) {
                OrderItem::insert([
                    'order_id' => $order_id,
                    'product_id' => $cart->id,
                    'vendor_id' => $cart->options->vendor,
                    'color' => $cart->options->color,
                    'size' => $cart->options->size,
                    'price' => $cart->price,
                    'created_at' => Carbon::now(),
                ]);
            }
        } // End Foreach


        if(Session::has('coupon')){
            Session::forget('coupon');
        }

        Cart::destroy();

        $notification = array(
            'message' => 'Your Order Place Successfully',
            'alert-type' => 'success'
        );
        return redirect()->route('dashboard')->with($notification);
    } // End Method
}

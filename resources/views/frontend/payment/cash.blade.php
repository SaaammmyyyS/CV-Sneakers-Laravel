@extends('frontend.master_dashboard')
@section('main')

 <div class="page-header breadcrumb-wrap">
            <div class="container">
                <div class="breadcrumb">
                    <a href="index.html" rel="nofollow"><i class="fi-rs-home mr-5"></i>Home</a>
                    <span></span> Cash On Delivery Payment
                </div>
            </div>
        </div>
        <div class="container mb-80 mt-50">
            <div class="row">
                <div class="col-lg-8 mb-40">
                    <h3 class="heading-2 mb-10"> Cash On Delivery Payment</h3>
                    <div class="d-flex justify-content-between">

                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-6">


                	<div class="border p-40 cart-totals ml-30 mb-50">
    <div class="d-flex align-items-end justify-content-between mb-30">
        <h4>Your Order Details</h4>

    </div>
    <div class="divider-2 mb-30"></div>
    <div class="table-responsive order_table checkout">

 <table class="table no-border">
        <tbody>
            @if (Session::has('coupon'))

            <tr>
                <td class="cart_total_label">
                    <h6 class="text-muted">Subtotal</h6>
                </td>
                <td class="cart_total_amount">
                    <h4 class="text-brand text-end">${{$cartTotal}}</h4>
                </td>
            </tr>

            <tr>
                <td class="cart_total_label">
                    <h6 class="text-muted">Coupon Name</h6>
                </td>
                <td class="cart_total_amount">
                    <h6 class="text-brand text-end">{{session::get('coupon')['coupon_name']}} ({{session::get('coupon')['coupon_discount']}}%)</h6>
                </td>
            </tr>
            <tr>
                <td class="cart_total_label">
                    <h6 class="text-muted">Coupon Discount</h6>
                </td>
                <td class="cart_total_amount">
                    <h4 class="text-brand text-end">${{ session()->get('coupon')['discount_amount'] }}</h4>
                </td>
            </tr>

            <tr>
                <td class="cart_total_label">
                    <h6 class="text-muted">Grand Total</h6>
                </td>
                <td class="cart_total_amount">
                    <h4 class="text-brand text-end">${{session::get('coupon')['total_amount']}}</h4>
                </td>
            </tr>

            @else

            <tr>
                <td class="cart_total_label">
                    <h6 class="text-muted">Grand Total</h6>
                </td>
                <td class="cart_total_amount">
                    <h4 class="text-brand text-end">${{$cartTotal}}</h4>
                </td>
            </tr>
            @endif


        </tbody>
    </table>





    </div>
</div>


                </div> <!-- // end lg md 6 -->


<div class="col-lg-6">
<div class="border p-40 cart-totals ml-30 mb-50">
    <div class="d-flex align-items-end justify-content-between mb-30">
        <h4>Make Cash Payment</h4>

    </div>
    <div class="divider-2 mb-30"></div>
    <div class="table-responsive order_table checkout">
        <form action="{{ route('cash.order')}}" method="post">
            @csrf
            <input type="hidden" name="name" value="{{$data['shipping_name']}}">
            <input type="hidden" name="email" value="{{$data['shipping_email']}}">
            <input type="hidden" name="phone" value="{{$data['shipping_phone']}}">
            <input type="hidden" name="post_code" value="{{$data['post_code']}}">
            <input type="hidden" name="division_id" value="{{$data['division_id']}}">
            <input type="hidden" name="district_id" value="{{$data['district_id']}}">
            <input type="hidden" name="state_id" value="{{$data['state_id']}}">
            <input type="hidden" name="address" value="{{$data['shipping_address']}}">
            <input type="hidden" name="notes" value="{{$data['notes']}}">
            <br>
            <button class="btn btn-primary">Submit Payment</button>
        </form>

    </div>
</div>



                </div>
            </div>
        </div>




        <script type="text/javascript">
            // Create a Stripe client.
        var stripe = Stripe('pk_test_51Nqnr8JyMbg1UYGzsU46Tcw0scZhmfr7iRrE3uQtrbyi6t8ZvJypzOU6NLdMwkhMFa7B3RGFdiHcelIV20tIziO400SawBxgRp');
        // Create an instance of Elements.
        var elements = stripe.elements();
        // Custom styling can be passed to options when creating an Element.
        // (Note that this demo uses a wider set of styles than the guide below.)
        var style = {
          base: {
            color: '#32325d',
            fontFamily: '"Helvetica Neue", Helvetica, sans-serif',
            fontSmoothing: 'antialiased',
            fontSize: '16px',
            '::placeholder': {
              color: '#aab7c4'
            }
          },
          invalid: {
            color: '#fa755a',
            iconColor: '#fa755a'
          }
        };
        // Create an instance of the card Element.
        var card = elements.create('card', {style: style});
        // Add an instance of the card Element into the `card-element` <div>.
        card.mount('#card-element');
        // Handle real-time validation errors from the card Element.
        card.on('change', function(event) {
          var displayError = document.getElementById('card-errors');
          if (event.error) {
            displayError.textContent = event.error.message;
          } else {
            displayError.textContent = '';
          }
        });
        // Handle form submission.
        var form = document.getElementById('payment-form');
        form.addEventListener('submit', function(event) {
          event.preventDefault();
          stripe.createToken(card).then(function(result) {
            if (result.error) {
              // Inform the user if there was an error.
              var errorElement = document.getElementById('card-errors');
              errorElement.textContent = result.error.message;
            } else {
              // Send the token to your server.
              stripeTokenHandler(result.token);
            }
          });
        });
        // Submit the form with the token ID.
        function stripeTokenHandler(token) {
          // Insert the token ID into the form so it gets submitted to the server
          var form = document.getElementById('payment-form');
          var hiddenInput = document.createElement('input');
          hiddenInput.setAttribute('type', 'hidden');
          hiddenInput.setAttribute('name', 'stripeToken');
          hiddenInput.setAttribute('value', token.id);
          form.appendChild(hiddenInput);
          // Submit the form
          form.submit();
        }
        </script>



@endsection
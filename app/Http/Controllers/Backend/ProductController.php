<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\Consignment;
use App\Models\MultiImage;
use App\Models\Order;
use App\Models\OrderItem;
use App\Models\Product;
use App\Models\ProductItem;
use App\Models\Records;
use App\Models\SubCategory;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    public function AllProduct(){
        $products = Product::latest()->get();
        return view('backend.product.product_all', compact('products'));
    } // End Method

    public function AddProduct(){
        $activeVendor = User::where('status', 'active')->where('role', 'vendor')->latest()->get();
        $brands = Brand::latest()->get();
        $categories = Category::latest()->get();
        return view('backend.product.product_add', compact('brands', 'categories', 'activeVendor'));
    } // End Method

    public function StoreProduct(Request $request){
        $image = $request->file('product_thumbnail');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(800, 800)->save('upload/products/thumbnail/'.$name_gen);
        $save_url = 'upload/products/thumbnail/'.$name_gen;

        $product_id = Product::insertGetId([
            'brand_id' => $request->brand_id,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'product_name' => $request->product_name,
            'product_slug' => strtolower(str_replace(' ','-',$request->product_name)),
            'product_code' => $request->product_code,
            'product_qty' => $request->product_qty,
            'product_tags' => $request->product_tags,
            'product_size' => $request->product_size,
            'product_color' => $request->product_color,

            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'short_descp' => $request->short_descp,
            'long_descp' => $request->long_descp,
            'hot_deals' => $request->hot_deals,
            'featured' => $request->featured,
            'special_offer' => $request->special_offer,
            'special_deals' => $request->special_deals,


            'product_thumbnail' => $save_url,
            'vendor_id' => $request->vendor_id,
            'status' => 1,
            'created_at' => Carbon::now(),
        ]);

        $images = $request->file('multi_img');
        foreach ($images as $img) {
            $image = $request->file('product_thumbnail');
            $make_name = hexdec(uniqid()).'.'.$img->getClientOriginalExtension();
            Image::make($img)->resize(800, 800)->save('upload/products/multi-image/'.$make_name);
            $uploadPath = 'upload/products/multi-image/'.$make_name;
            MultiImage::insert([
                'product_id' => $product_id,
                'photo_name' => $uploadPath,
                'created_at' => Carbon::now(),
            ]);
        }

        $notification = array(
            'message' => 'Product Inserted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('all.product')->with($notification);

    } // End Method


    public function EditProduct($id){
        $multiImgs = MultiImage::where('product_id', $id)->get();
        $activeVendor = User::where('status', 'active')->where('role', 'vendor')->latest()->get();
        $brands = Brand::latest()->get();
        $categories = Category::latest()->get();
        $subcategories = SubCategory::latest()->get();
        $products = Product::findOrFail($id);
        return view('backend.product.product_edit', compact('brands', 'categories', 'activeVendor', 'products', 'subcategories', 'multiImgs'));
    } // End Method

    public function UpdateProduct(Request $request){
        $product_id = $request->id;

        Product::findOrFail($product_id)->update([
            'brand_id' => $request->brand_id,
            'category_id' => $request->category_id,
            'subcategory_id' => $request->subcategory_id,
            'product_name' => $request->product_name,
            'product_slug' => strtolower(str_replace(' ','-',$request->product_name)),
            'product_code' => $request->product_code,
            'product_qty' => $request->product_qty,
            'product_tags' => $request->product_tags,
            'product_size' => $request->product_size,
            'product_color' => $request->product_color,

            'selling_price' => $request->selling_price,
            'discount_price' => $request->discount_price,
            'short_descp' => $request->short_descp,
            'long_descp' => $request->long_descp,
            'hot_deals' => $request->hot_deals,
            'featured' => $request->featured,
            'special_offer' => $request->special_offer,
            'special_deals' => $request->special_deals,

            'vendor_id' => $request->vendor_id,
            'status' => 1,
            'created_at' => Carbon::now(),
        ]);

        $notification = array(
            'message' => 'Product Updated Without Image Successfully',
            'alert-type' => 'success'
        );

        return redirect()->route('all.product')->with($notification);
    } // End Method

    public function UpdateProductThumbnail(Request $request){

        $pro_id = $request->id;
        $oldImage = $request->old_img;

        $image = $request->file('product_thumbnail');
        $name_gen = hexdec(uniqid()).'.'.$image->getClientOriginalExtension();
        Image::make($image)->resize(800,800)->save('upload/products/thumbnail/'.$name_gen);
        $save_url = 'upload/products/thumbnail/'.$name_gen;

         if (file_exists($oldImage)) {
           unlink($oldImage);
        }

        Product::findOrFail($pro_id)->update([

            'product_thumbnail' => $save_url,
            'updated_at' => Carbon::now(),
        ]);

       $notification = array(
            'message' => 'Product Image Thambnail Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);


    } // End Method

    public function UpdateProductMultiimage(Request $request){
        $imgs = $request->multi_img;
        foreach ($imgs as $id => $img) {
            $imgDel = MultiImage::findOrFail($id);
            unlink($imgDel->photo_name);

            $make_name = hexdec(uniqid()).'.'.$img->getClientOriginalExtension();
            Image::make($img)->resize(800, 800)->save('upload/products/multi-image/'.$make_name);
            $uploadPath = 'upload/products/multi-image/'.$make_name;

            MultiImage::where('id', $id)->update([
                'photo_name' => $uploadPath,
                'updated_at' => Carbon::now(),
            ]);

        }

        $notification = array(
            'message' => 'Product Multi Image Updated Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    } // End Method

    public function MultiImageDelete($id){
        $oldImg = MultiImage::findOrFail($id);
        unlink($oldImg->photo_name);
        MultiImage::findOrFail($id)->delete();

        $notification = array(
            'message' => 'Product Multi Image Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);

    } // End Method

    public function ProductInactive($id){
        Product::findOrFail($id)->update(['status' => 0]);

        $notification = array(
            'message' => 'Product Inactive',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    } // End Method

    public function ProductActive($id){
        Product::findOrFail($id)->update(['status' => 1]);

        $notification = array(
            'message' => 'Product Active',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    } // End Method

    public function DeleteProduct($id){
        $product = Product::findOrFail($id);
        unlink($product->product_thumbnail);

        Product::findOrFail($id)->delete();

        $imgs = MultiImage::where('product_id', $id)->get();
        foreach ($imgs as $img) {
            unlink($img->photo_name);
            MultiImage::where('product_id', $id)->delete();
        }

        $notification = array(
            'message' => 'Product Deleted Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    } // End Method


    public function ProductStock(){
        $products = ProductItem::orderBy('id', 'DESC')->get();
        return view('backend.product.product_stock', compact('products'));
    } // End Method

    public function StockIn(){
        $products = Product::latest()->get();
        $activeVendor = User::where('status', 'active')->where('role', 'vendor')->latest()->get();
        return view('backend.product.stock_in', compact('products', 'activeVendor'));
    } // End Method

    public function AddStock(Request $request){
        $product_id = $request->product_id;
        $product_data = Product::findOrFail($product_id);

        Product::findOrFail($product_id)->update([
            "product_qty" => Product::findOrFail($product_id)->product_qty + $request->product_qty,
        ]);

        if($request->vendor_id == null){
            $owner = 1;
        }
        else{
            $owner = $request->vendor_id;
        }

        for ($i = 1; $i <= $request->product_qty; $i++) {
            if ($request->price == NULL) {
                ProductItem::insert([
                    "product_id" => $product_id,
                    "serial_id" => $product_data->product_name.mt_rand(10000000, 99999999),
                    "size" => $request->product_size,
                    "owner" => $owner,
                    "price" => $product_data->selling_price,
                    "created_at" => Carbon::now(),
                ]);
            }
            else {
                $product_item_id = ProductItem::insertGetId([
                    "product_id" => $product_id,
                    "serial_id" => $product_data->product_name.mt_rand(10000000, 99999999),
                    "size" => $request->product_qty,
                    "owner" => $owner,
                    "price" => $product_data->selling_price,
                    "created_at" => Carbon::now(),
                ]);

            }
            if($request->vendor_id == null){
                $owner = 1;
            }
            else{
                Consignment::insert([
                    'owner_id' => $owner,
                    'product_id' => $product_id,
                    'product_item_id' => $product_item_id,
                    'consignment_date' => Carbon::now(),
                    'status' => 'in progress',
                    'initial_price' => $product_data->selling_price,
                    'current_price' => $request->price,
                    'commission_rate' => $request->commission_rate,
                ]);
            }
        }

        Records::insert([
            'admin_id' => Auth::id(),
            'product_name' => $product_data->product_name,
            'qty' => $request->product_qty,
            'product_id' => $product_id,
            'price' => $product_data->selling_price,
            'total_price' => $product_data->selling_price * $request->product_qty,
            'type' => "stock in",
            'stock_in_date' => Carbon::now()->format('d/m/Y'),
        ]);

        $notification = array(
            'message' => ' Successfully',
            'alert-type' => 'success'
        );

        return redirect()->back()->with($notification);
    }

    public function StockInHistory(){
        $products = Records::where('type', 'stock in')->orderBy('id', 'DESC')->get();
        return view('backend.product.stock_in_history', compact('products'));
    } // End Method

    public function StockOutHistory(){
        $orders = Records::where('type', 'stock out')->orderBy('id', 'DESC')->get();
        return view('backend.product.stock_out_history', compact('orders'));
    } // End Method

    public function StockOutDetails($order_id){
        $order = Order::with('division', 'district', 'state', 'user')->where('id', $order_id)->first();
        $orderItem = OrderItem::with('product')->where('order_id', $order_id)->orderBy('id', 'DESC')->get();

        return view('backend.product.stock_out_details', compact('order', 'orderItem'));
    } // End Method
}

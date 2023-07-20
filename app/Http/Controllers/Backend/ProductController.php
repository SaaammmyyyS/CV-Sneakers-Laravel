<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Brand;
use App\Models\Category;
use App\Models\MultiImage;
use App\Models\Product;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
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
            'product_slug' => strtolower(str_replace(' ', '-', $request->product_slug)),
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

        // Multiple Image Upload from user
    } // End Method
}

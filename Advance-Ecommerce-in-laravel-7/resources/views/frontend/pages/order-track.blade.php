@extends('frontend.layouts.master')

@section('title','Easy To Learn | Trang theo dõi khóa học')

@section('main-content')
    <!-- Breadcrumbs -->
    <div class="breadcrumbs">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="bread-inner">
                        <ul class="bread-list">
                            <li><a href="{{route('home')}}">Trang chủ<i class="ti-arrow-right"></i></a></li>
                            <li class="active"><a href="javascript:void(0);">Theo dõi khóa học</a></li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Breadcrumbs -->
<section class="tracking_box_area section_gap py-5">
    <div class="container">
        <div class="tracking_box_inner">
            <p>Để theo dõi thông tin khóa học, vui lòng nhập ID khóa học của bạn vào ô bên dưới và nhấn nút "Theo dõi". Điều này đã được đưa ra
                cho bạn trên biên nhận của bạn và trong email xác nhận mà bạn đáng lẽ đã nhận được.</p>
            <form class="row tracking_form my-4" action="{{route('product.track.order')}}" method="post" novalidate="novalidate">
              @csrf
                <div class="col-md-8 form-group">
                    <input type="text" class="form-control p-2"  name="order_number" placeholder="Nhập mã đơn hàng">
                </div>
                <div class="col-md-8 form-group">
                    <button type="submit" value="submit" class="btn submit_btn">Theo dõi khóa học</button>
                </div>
            </form>
        </div>
    </div>
</section>
@endsection

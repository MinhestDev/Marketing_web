@extends('frontend.layouts.master')

@section('title','Easy To Learn | Về chúng tôi')

@section('main-content')

	<!-- Breadcrumbs -->
	<div class="breadcrumbs">
		<div class="container">
			<div class="row">
				<div class="col-12">
					<div class="bread-inner">
						<ul class="bread-list">
							<li><a href="index1.html">Trang chủ<i class="ti-arrow-right"></i></a></li>
							<li class="active"><a href="blog-single.html">Về chúng tôi</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- End Breadcrumbs -->

	<!-- About Us -->
	<section class="about-us section">
			<div class="container">
				<div class="row">
					<div class="col-lg-6 col-12">
						<div class="about-content">
							@php
								$settings=DB::table('settings')->get();
							@endphp
							<h3>Chào mừng đến với <span>Easy To Learn</span></h3>
							<p>Easy To Learn được thành lập vào năm 2022, với niềm đam mê Công Nghệ Thông Tin và kinh
                                nghiệm gần 2 năm giảng dạy đã sáng lập Trung Tâm này với mong muốn sẽ đào tạo ra các nhân
                                lực chất lượng cao nhằm mang đến quý học viên những khóa học chất lượng nhất, dễ tiếp thu
                                và hiện đại nhất, phù hợp với sự phát triển Công Nghê Thông Tin theo xu hướng toàn cầu. </br>

                                Tuy chỉ mới hoạt động được 2 năm, nhưng Easy To Lean hiện đã có gần 20 giảng viên trực thuộc
                                và đã đào tạo hơn 1000 học viên. Hơn thế nữa, tất cả đều đã có được việc làm ổn định bằng
                                chính những kiến thức đã học tại Easy To Learn. </br>
							</p>
							<div class="button">
								<a href="{{route('blog')}}" class="btn">Bài viết của chúng tôi</a>
								<a href="{{route('contact')}}" class="btn primary">Liên hệ chúng tôi</a>
							</div>
						</div>
					</div>
					<div class="col-lg-6 col-12">
						<div class="about-img overlay">
							<img src="backend/img/4-mrk.jpeg" alt="@foreach($settings as $data) {{$data->photo}} @endforeach">
						</div>
					</div>
				</div>
			</div>
	</section>
	<!-- End About Us -->


	<!-- Start Shop Services Area -->
	<section class="shop-services section">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-rocket"></i>
						<h4>Miễn phí vận chuyển</h4>
						<p>Với đơn hàng trên 1.000.000 vnđ</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-reload"></i>
						<h4>Học mọi lúc mọi nơi</h4>
						<p>Xem lại video nếu miss buổi học</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-lock"></i>
						<h4>Thanh toán an toàn</h4>
						<p>Thanh toán an toàn 100%</p>
					</div>
					<!-- End Single Service -->
				</div>
				<div class="col-lg-3 col-md-6 col-12">
					<!-- Start Single Service -->
					<div class="single-service">
						<i class="ti-tag"></i>
						<h4>Giá cả tốt nhất</h4>
						<p>Giá đảm bảo, chất lượng</p>
					</div>
					<!-- End Single Service -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Shop Services Area -->

	@include('frontend.layouts.newsletter')
@endsection

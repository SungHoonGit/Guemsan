<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<meta charset="UTF-8">

    <!-- 대부분의 검색엔진 웹 크롤러 차단 -->
    <meta name="robots" content="noindex">
    <!-- 구글 검색엔진 웹 크롤러만 차단 -->
    <meta name="googlebot" content="noindex">
	<!-- <script src="/js/myscript.js"></script> -->
    <script src="/js/jquery-3.5.1.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.js"></script>
        
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="/css/admin.css">

<title>SungHoonK</title>
</head>
<body>
<!-- BS -->
  <!-- Hero -->
  <section class="et-hero-tabs">
	<div class="mainnav">
		
		<a class="mainnav-tab" href="../">Home</a> 
		
				<c:choose>
			<c:when test="${empty id}">
				<a class="mainnav-tab" href="/member/login" style="	text-decoration: none; "></a>
				<a class="mainnav-tab" href="/member/login">Login</a>
			</c:when>
			<c:otherwise>
				<a class="mainnav-tab" href="/admin/">Service</a>
				<a class="mainnav-tab" href="/member/logout">Logout</a>
			</c:otherwise>
			</c:choose>		
	</div>  
	  
    <h1>SungHoon kim</h1><br>
    <h3>Sliding content with sticky tab nav</h3>
    <div class="et-hero-tabs-container">
      <a class="et-hero-tab" href="#tab-es6">ES6</a>
      <a class="et-hero-tab" href="#tab-flexbox">Flexbox</a>
      <a class="et-hero-tab" href="#tab-react">React</a>
      <a class="et-hero-tab" href="#tab-angular">Angular</a>
      <a class="et-hero-tab" href="#tab-other">Other</a>
      <span class="et-hero-tab-slider"></span>
    </div>
  </section>

  <!-- Main -->
  <main class="et-main">
    <section class="et-slide" id="tab-es6">
      <h1>ES6</h1>
      <h3>something about es6</h3>
    </section>
    <section class="et-slide" id="tab-flexbox">
      <h1>Flexbox</h1>
      <h3>something about flexbox</h3>
    </section>
    <section class="et-slide" id="tab-react">
      <h1>React</h1>
      <h3>something about react</h3>
    </section>
    <section class="et-slide" id="tab-angular">
      <h1>Angular</h1>
      <h3>something about angular</h3>
    </section>
    <section class="et-slide" id="tab-other">
      <h1>Other</h1>
      <h3>something about other</h3>
    </section>
  </main>
<!-- BS end -->
<script type="text/javascript">
class StickyNavigation {
	
	constructor() {
		this.currentId = null;
		this.currentTab = null;
		this.tabContainerHeight = 70;
		let self = this;
		$('.et-hero-tab').click(function() { 
			self.onTabClick(event, $(this)); 
		});
		$(window).scroll(() => { this.onScroll(); });
		$(window).resize(() => { this.onResize(); });
	}
	
	onTabClick(event, element) {
		event.preventDefault();
		let scrollTop = $(element.attr('href')).offset().top - this.tabContainerHeight + 1;
		$('html, body').animate({ scrollTop: scrollTop }, 600);
	}
	
	onScroll() {
		this.checkTabContainerPosition();
    	this.findCurrentTabSelector();
	}
	
	onResize() {
		if(this.currentId) {
			this.setSliderCss();
		}
	}
	
	checkTabContainerPosition() {
		let offset = $('.et-hero-tabs').offset().top + $('.et-hero-tabs').height() - this.tabContainerHeight;
		if($(window).scrollTop() > offset) {
			$('.et-hero-tabs-container').addClass('et-hero-tabs-container--top');
		} 
		else {
			$('.et-hero-tabs-container').removeClass('et-hero-tabs-container--top');
		}
	}
	
	findCurrentTabSelector(element) {
		let newCurrentId;
		let newCurrentTab;
		let self = this;
		$('.et-hero-tab').each(function() {
			let id = $(this).attr('href');
			let offsetTop = $(id).offset().top - self.tabContainerHeight;
			let offsetBottom = $(id).offset().top + $(id).height() - self.tabContainerHeight;
			if($(window).scrollTop() > offsetTop && $(window).scrollTop() < offsetBottom) {
				newCurrentId = id;
				newCurrentTab = $(this);
			}
		});
		if(this.currentId != newCurrentId || this.currentId === null) {
			this.currentId = newCurrentId;
			this.currentTab = newCurrentTab;
			this.setSliderCss();
		}
	}
	
	setSliderCss() {
		let width = 0;
		let left = 0;
		if(this.currentTab) {
			width = this.currentTab.css('width');
			left = this.currentTab.offset().left;
		}
		$('.et-hero-tab-slider').css('width', width);
		$('.et-hero-tab-slider').css('left', left);
	}
	
}

new StickyNavigation();
</script>
<!-- header end -->

<!-- footer start -->
 <div class="site-footer">
	<div class="container">
		<div class="row justify-content-between">
			<div class="col-sm-4">
				<div class="widget">
					<h5></h5>
				</div>
			</div>			
			<div class="col-sm-4">
				<div class="widget">
					<h5>이메일 : ksa134652@gmail.com </h5>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="widget">
					<h5>주소 : 충남 금산군 금삽은 약초리 50</h5>
				</div>
			</div>
		</div>
	</div>
    <div class="row justify-content-center text-center copyright">
      <div class="col-sm-12">
		  <p>Copyright &copy;<script>document.write(new Date().getFullYear());</script> HanyangLibrary<br>All Rights Reserved</p>
		  <p style="font-size: 4px;">— Designed with love by <a href="https://untree.co/">Untree.co</a> • <a href="https://untree.co/license/">License</a></p>
      </div>
    </div>
 </div>
 <!-- footer 끝 -->
 

</body>
</html>
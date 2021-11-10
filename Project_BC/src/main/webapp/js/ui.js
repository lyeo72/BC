var UI = (function () {
	return {
		init: function () {
			this.initCategory();
			this.event();
		},
		element: {
			layout: {
				wrap: '#wrap',
				header: '.header-top',
				lnb: '.lnb',
				nav: '.quick-nav',
				quick: '.quick-btn',
			},
			gnb:{
				wrap:'.gnb-area',
				top:'.header-top',
				sub:'.gnb-sub-wrap',
				sub2depth:'.sub-depth2',
				btnAll:'.mnu-all a',
				btnMypage:'.my-wrap .link-mypage',
				btnMypageClose:'.user-info-box .user-close',
				mypageInfo:'.user-info-box'
			},
			layer: {
				name: '.pop-layer',
				wrap: '.pop-wrap',
				btn: '.btn-close, .dim',
				playWrap: '.play-area'
			}
		},
		initCategory: function () {
			var lThiz = this.element;
			//추천 테마관 하드코딩으로 변경(21.02.24)
			var theme = [
				{
					title: "더반찬&시그니처",
					disp_ctg_no: "2102005867"
				},
				{
					title: "캠핑&",
					disp_ctg_no: "2102005865"
				},
				{
					title: "집콕! 쟁여두기",
					disp_ctg_no: "2102005868"
				},
				{
					title: "먹기 편한 게 최고",
					disp_ctg_no: "2102005869"
				}
			];

			$.ajax({
				url: "/dispctg/searchCategoryCtgList.action",
				method: "POST",
				dataType: "JSON"
			})
			.done(function(res) {
				if (res && res.result == "200" && res.data && res.data.length > 0) {
					$.each(res.data, function(i, v) {
						var tempElLi = $('<li/>');
						//추천 테마관 카테고리 onclick 이벤트 삭제(21.02.24)
						if(v.disp_ctg_nm == "추천 테마관" || v.disp_ctg_nm == "2007004596"){
							tempElLi.append([
								'<a href="javascript:void(0);">',
								'<span class="icon">',
								'<img src="' + v.img_off + '" alt="' + v.disp_ctg_nm + '" class="off">',
								'<img src="' + v.img_on + '" alt="' + v.disp_ctg_nm + '" class="on">',
								'</span>',
								v.disp_ctg_nm,
								'</a>',
								'<div class="mnu-sub">',
								'<ul />',
								'</div>'
							].join(''));
						}else {
							tempElLi.append([
								'<a href="javascript:void(0);" onclick="overpass.dispctg.goCtgList({disp_type:\'ETC\',disp_ctg_no:\'' + v.disp_ctg_no + '\'});">',
								'<span class="icon">',
								'<img src="' + v.img_off + '" alt="' + v.disp_ctg_nm + '" class="off">',
								'<img src="' + v.img_on + '" alt="' + v.disp_ctg_nm + '" class="on">',
								'</span>',
								v.disp_ctg_nm,
								'</a>',
								'<div class="mnu-sub">',
								'<ul />',
								'</div>'
							].join(''));
						}
						
						var tempLowerArr = [];
						//추천 테마관 변경(21.02.24)
						if(v.disp_ctg_nm == "추천 테마관" || v.disp_ctg_nm == "2007004596"){
							//추천 테마관 셋팅
							$.each(theme, function(lIdx, lv) {
								tempLowerArr.push('<li><a href="javascript:void(0);" onclick="overpass.dispctg.goDispList({disp_ctg_no:\'' + lv.disp_ctg_no + '\'});">' + lv.title + '</a></li>');
							});
						}else {
							//2뎁스 카테고리 셋팅
							$.each(v.lower_ctg, function(lIdx, lv) {
								tempLowerArr.push('<li><a href="javascript:void(0);" onclick="overpass.dispctg.goCtgList({disp_type:\'ETC\',disp_ctg_no:\'' + v.disp_ctg_no + '\',disp_sub_cate_no:\'' + lv.disp_ctg_no + '\'});">' + lv.disp_ctg_nm + '</a></li>');
							});
						}
						tempElLi.find('ul').append(tempLowerArr.join(''));
						
						$('.gnb-sub-wrap ul.mnu-type').append(tempElLi);
					});
					
					if ($('.gnb-sub-wrap ul.mnu-type li').length > 0) {
						$(".gnb-sub-wrap .mnu-type li").hover(function(e){
							$(this).addClass('active');
							$(lThiz.gnb.sub).find('.mnu-type').addClass('active');
							$(lThiz.gnb.sub).addClass('active2');
						}, function(){
							$(this).removeClass('active');
							$(lThiz.gnb.sub).find('.mnu-type').removeClass('active');
							$(lThiz.gnb.sub).removeClass('active2');
						});
					}
				}
			})
			.fail(function(p) {
//				console.error("Faild is data load", p);
			});
		},
		event: function () {
			var lThiz = this.element;
			var posY;
			
			var prevScrollTop = $(window).scrollTop(),
				nowScrollTop = $(window).scrollTop(),
				//VisualScrollTop = ($("#content").offset().top + 250),
				VisualScrollTop = ($("body").offset().top + 250),
				nowDir = 'down',
				prevDir = 'down';

			nowDir = 'up';

			$(window).on('scroll touchmove', function () {
				nowScrollTop = $(window).scrollTop();
				if (nowScrollTop > 100) {
					nowDir = 'down';
					var h=-($(".header-wrap").outerHeight() - $(lThiz.gnb.wrap).outerHeight())+'px';
					$(".header-wrap").css({'transform':'translateY('+h+')'});
					$(".header-wrap").addClass("scroll");
				} else if (nowScrollTop < prevScrollTop) {
					nowDir = 'up';
					// $(".header-wrap").css({
					// 	'transform':'translateY(0)'
					// });
				}
				if (nowScrollTop === 0) { //top 0
					nowDir = 'up';
					$(".header-wrap").css({'transform':'translateY(0)'});
					$(".header-wrap").removeClass("scroll");
					nowScrollTop = 0;
				}
				prevDir = nowDir;
				prevScrollTop = nowScrollTop;
			});
			//$(window) 셀렉터가 응답이 없어 $("body") 로 바꿈 
			$("body").on('scroll touchmove', function () {
				nowScrollTop = $("body").scrollTop();
				if (nowScrollTop > 100) {
					nowDir = 'down';
					var h=-($(".header-wrap").outerHeight() - $(lThiz.gnb.wrap).outerHeight())+'px';
					$(".header-wrap").css({'transform':'translateY('+h+')'});
					$(".header-wrap").addClass("scroll");
				} else if (nowScrollTop < prevScrollTop) {
					nowDir = 'up';
					// $(".header-wrap").css({
					// 	'transform':'translateY(0)'
					// });
				}
				if (nowScrollTop === 0) { //top 0
					nowDir = 'up';
					$(".header-wrap").css({'transform':'translateY(0)'});
					$(".header-wrap").removeClass("scroll");
					nowScrollTop = 0;
				}
				prevDir = nowDir;
				prevScrollTop = nowScrollTop;
			});
			
			var HeaderHeight = $(".header-wrap").height();
			//$("#container").css({"padding-top":HeaderHeight+"px"});
			//2020.07.22 수정 
//			$("#content").css({"padding-top":HeaderHeight+"px"});
			$(".content").css({"padding-top":269+"px"});
			//2020.07.22 수정
			$(".main").css({"padding-top":(HeaderHeight-90)+"px"});
			
			//상단 검색창
			$(".header-wrap .search-wrap input").on('click',function(){
				$(this).addClass("active");
				$(".search-wrap .sch-box").fadeIn();
			});
			$(".search-wrap .sch-box").on('mouseleave',function(e){
				$(this).fadeOut();
			});

			//상단 배너 닫기
			$(".header-wrap .banner-area .btn-banner-close").on('click',function(){
				$(".header-wrap .banner-area").hide();
			});
			
			//마이더반찬
			$(lThiz.gnb.btnMypage).on('mouseover',function(){
				//로그인 하지 않은 상태에서 작동하지 못하게 변경 
				if($(".my-wrap div ").hasClass('user-info-box')){
					$(this).next(lThiz.gnb.mypageInfo).fadeIn();
					$(this).addClass('active');
					//최근본상품
					var TodayviewSlider = $('.view-box .todayview-slider');
						TodayviewSlider.slick({
						slide: '.item',
						slidesToShow: 3, // 스크롤 할 슬라이드 수
						slidesToScroll: 1, // 표시 할 슬라이드 수
						arrows: true,
						dots: false,
						autoplay: false,
						infinite: false,
					});
					
				}
				
			});
			$(lThiz.gnb.mypageInfo).on('mouseleave',function(e){
				$(lThiz.gnb.mypageInfo).fadeOut();
				$(lThiz.gnb.btnMypage).removeClass('active');
			});

			//gnb
			/*
			$(lThiz.gnb.wrap).find('.inner-box>ul>li').on('mouseover',function(){
				if($(this).hasClass('mnu-all')){
					$(lThiz.gnb.sub).addClass('active');
					if($(lThiz.gnb.sub).hasClass('active')){
						$(lThiz.gnb.wrap).find('.inner-box>ul>li.mnu-all').addClass('active');
					}
					return false;
				}else{
					$(this).addClass('active').siblings('li').removeClass('active');
				}
			});
			*/
			// 20200804 GNB 스크립트 추가
	        const mun_all = $(".mnu-type");
	        const gnb_sub = $(".gnb-sub-wrap");

	        mun_all.on("mouseleave", function () {
	          gnb_sub.removeClass("active");
	        });
	        // //20200804 GNB 스크립트 추가
			//카테고리 선택자 변경 
			$(lThiz.gnb.wrap).find('.inner-box>ul>li>a').on('mouseenter',function(){
				if($(this).parent().hasClass('mnu-all')){
					$(lThiz.gnb.sub).addClass('active');
					if($(lThiz.gnb.sub).hasClass('active')){
						$(lThiz.gnb.wrap).find('.inner-box>ul>li.mnu-all').addClass('active');
					}
					return false;
				}else{
					$(this).parent().addClass('active').siblings('li').removeClass('active');
				}
			});

			$(lThiz.gnb.wrap).find('.inner-box>ul>li').on('mouseleave',function(e){
				if($(this).hasClass('mnu-all')){
					$(lThiz.gnb.sub).removeClass('active');
					if(!$(lThiz.gnb.sub).hasClass('active')){
						$(this).removeClass('active');
					}
					return false;
				}else{
					$(this).removeClass('active');
				}
			});
			
			
			$(lThiz.gnb.sub).hover(function(e){
				$(this).addClass('active');
				$(lThiz.gnb.wrap).find('.inner-box>ul>li.mnu-all').addClass('active');
			}, function(){
				$(this).removeClass('active');
				$(lThiz.gnb.wrap).find('.inner-box>ul>li.mnu-all').removeClass('active');

			});
			
			//quick
			$('.quick-btn .btn-top').on('click', function (e) {
				$('html,body').animate({scrollTop: 0});
			});

			// 앱 최초 알림 닫기
			if ($('.notify-banner').length > 0) {
				$(".btn-close").on('click',function (e) {
					e.preventDefault();
					$(".notify-banner").hide();
				});
			}

			//2depth category
			$(".cate-wrap .item").on("click", function() {
				$(".cate-wrap .item").removeClass("active");
				$(this).addClass("active");
			});

			//toggle
			$('.btn-toggle').each(function () {
				if ($(this).hasClass('close')) {
					$($(this).attr('href')).hide();
				} else {
					$($(this).attr('href')).show();
				}

			});
			$('.btn-toggle').bind('click', function (e) {
				e.preventDefault();
				$(this).toggleClass('close');

				if ($(this).hasClass('close')) {
					$($(this).attr('href')).hide();
				} else {
					$($(this).attr('href')).show();
				}
			});

			//tab
			$('.js-tab li a').on('click', function (e) {
				e.preventDefault();
				$(this).parent('li').addClass('active').siblings('li').removeClass('active');
				if ($(this).attr('href') !== '#') {
					$($(this).attr('href')).addClass('active').siblings('.tab-content').removeClass('active');
					$('.md-slider').slick('setPosition');
				}
			});
			
			//상품 Sold Out 임의로 클릭 이벤트 추가 
			$(document.body).on("click", ".prd-box.soldout", function(e) {
				var _tempEl = $(this).find('.thumb a');
				if (_tempEl && _tempEl.length > 0) {
					eval(_tempEl.attr('onclick'));
				}
			});
		},
		layerPopUp: function (pOption) {
			/*   pOption
			*  {
			*  	 state : 'open'  OR  'close'
			*  	 selId : Layer Selector
			*  }
			*/
			var lThiz = this;
			var lLayer = $(pOption.selId);
			var posY;
			var lLayerBox = $(pOption.selId).find('.pop-wrap');
			var dim = $(pOption.selId).find('.dim');


			if (pOption.st !== 'close') {
				posY = $(window).scrollTop();
				lLayer.fadeIn();
				dim.fadeIn();
				lLayerBox.css('margin-left', '-' + lLayerBox.outerWidth() / 2 + 'px');
				if (lLayerBox.outerHeight() < $(document).height()) {
					lLayerBox.css('margin-top', '-' + lLayerBox.outerHeight() / 2 + 'px');
				} else {
					lLayerBox.css('top', '0');
				}

				//$('.slick-slider').slick('setPosition');//slideSet
				$("html, body").addClass('fixed');
				$("#wrap").css("top", -posY);
			} else {
				var posY = $("#wrap").css("top").replace(/[^-\d\.]/g, '');
				lLayer.fadeOut();
				dim.fadeOut();
				$("#wrap").css("top", 'auto');
				$("html, body").removeClass('fixed');
				$("html, body").animate({scrollTop: -posY}, 0);
			}
			if($(".pop-layer").hasClass("pop-main")){
				$("html, body").removeClass('fixed');
			}
			lLayer.find('.dim').on("click", function (e) {
				e.preventDefault();
				var posY = $("#wrap").css("top").replace(/[^-\d\.]/g, '');
				lLayer.fadeOut();
				dim.fadeOut();
				$("#wrap").css("top", 'auto');
				$("html, body").removeClass('fixed');
				$("html, body").animate({scrollTop: -posY}, 0);
			});

		}
	}
})();

$(document).ready(function () {
	UI.init();
	jQuery.fn.scrollCenter = function(elem, speed) {
		var active = jQuery(this).find(elem); // active element
		var activeWidth = active.width() / 2;
		var pos = active.position().left + activeWidth;
		var elpos = jQuery(this).scrollLeft();
		var elW = jQuery(this).width();
		pos = pos + elpos - elW / 2;
		jQuery(this).animate({
			scrollLeft: pos
		}, speed == undefined ? 1000 : speed);
		return this;
	};
	jQuery.fn.scrollCenterORI = function(elem, speed) {
		jQuery(this).animate({
			scrollLeft: jQuery(this).scrollLeft() - jQuery(this).offset().left + jQuery(elem).offset().left
		}, speed == undefined ? 1000 : speed);
		return this;
	};

});

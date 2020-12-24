//ヘッダ固定マージン
// $(window).on('load resize', function(){
// 	var height = $('#header-height').height();
// 	$('main').css('padding-top',height); 
// });

//スムーズスクロール
$(function(){
	var topBtn = $('.pagetop');
	topBtn.hide();
	$(window).scroll(function () {
		if ($(this).scrollTop() > 90) {
			topBtn.fadeIn();
		} else {
			topBtn.fadeOut();
		}
	});
});

//グローバルメニュー
//$(function(){
//	//モーダルウィンドウを出現させるクリックイベント
//	$("#gnav-open").click(function(){
//		//キーボード操作などにより、オーバーレイが多重起動するのを防止する
//		$(this).blur() ;	//ボタンからフォーカスを外す
//		//オーバーレイを出現させる
//		$("#header").append('<div id="gnav-overlay"></div>');
//		$("#gnav-overlay").fadeIn(200);
//		TweenMax.to(".gnav-content" , .5 , {left:"0px", opacity:1});
//		//[#gnav-overlay]、または[#modal-close]をクリックしたら…
//		$("#gnav-overlay,#modal-close").unbind().click(function(){
//			TweenMax.to(".gnav-content" , .3 , {left:"-100%"});
//			//[#modal-content]と[#gnav-overlay]をフェードアウトした後に…
//			$("#gnav-overlay").fadeOut(1000,function(){
//				//[#gnav-overlay]を削除する
//				$('#gnav-overlay').remove();
//			});
//		});
//	});
//});

//檢查登入
$("#search-open").on("click",function(){
	$.ajax({
		url:'checkLogin',
		type:'post',
		dataType:'json',
		success:function(res){
			console.log(res);	
			if(res.login == false){
				swal({
					  title: "請先登入會員",
					  type: "warning",
					  showCancelButton: true,
					  confirmButtonColor: "#DD6B55",
					  confirmButtonText: "登入會員",
					  cancelButtonText: "取消",
					},
					function(){
					 location.href="loginPage";
				});			
			}else if(res.login == true){					
					$(this).blur() ;	
					$("#header").append('<div id="search-overlay"></div>');
					$("#search-overlay").fadeIn(200);
					TweenMax.to(".search-content" , .5 , {right:"0px", opacity:1, display:"block"});
					$("#search-overlay,#modal-close").unbind().click(function(){
						TweenMax.to(".search-content" , .3 , {right:"-100%"});
						$("#search-overlay").fadeOut(1000,function(){
							$('#search-overlay').remove();
						});
					});		
				}	
			}
		});
	
});


//検索ボックス
//$(function(){
//	//モーダルウィンドウを出現させるクリックイベント
//	$("#search-open").click(function(){
//		//キーボード操作などにより、オーバーレイが多重起動するのを防止する
//		$(this).blur() ;	//ボタンからフォーカスを外す
//		//オーバーレイを出現させる
//		$("#header").append('<div id="search-overlay"></div>');
//		$("#search-overlay").fadeIn(200);
//		// $(".search-content").addcss({right:"0px", opacity:1, display:"block"});
//		TweenMax.to(".search-content" , .5 , {right:"0px", opacity:1, display:"block"});
//		//[#search-overlay]、または[#modal-close]をクリックしたら…
//		$("#search-overlay,#modal-close").unbind().click(function(){
//			// $(".search-content").css({right:"-100%", opacity:"",display:""});
//			TweenMax.to(".search-content" , .3 , {right:"-100%"});
//			//[#modal-content]と[#search-overlay]をフェードアウトした後に…
//			$("#search-overlay").fadeOut(1000,function(){
//				//[#search-overlay]を削除する
//				$('#search-overlay').remove();
//			});
//		});
//	});
//});

//検索ボックス
//$(function(){
//	//モーダルウィンドウを出現させるクリックイベント
//	$("#search-collapse").click(function(){
//		//キーボード操作などにより、オーバーレイが多重起動するのを防止する
//		$(this).blur() ;	//ボタンからフォーカスを外す
//		//オーバーレイを出現させる
//		$("#header").append('<div id="search-overlay"></div>');
//		$("#search-overlay").fadeIn(200);
//		// $(".search-content").addcss({right:"0px", opacity:1, display:"block"});
//		TweenMax.to(".search-content" , .5 , {top:"0px", opacity:1, display:"block"});
//		//[#search-overlay]、または[#modal-close]をクリックしたら…
//		$("#search-overlay,#modal-close").unbind().click(function(){
//			// $(".search-content").css({right:"-100%", opacity:"",display:""});
//			TweenMax.to(".search-content" , .3 , {top:"-100%"});
//			//[#modal-content]と[#search-overlay]をフェードアウトした後に…
//			$("#search-overlay").fadeOut(1000,function(){
//				//[#search-overlay]を削除する
//				$('#search-overlay').remove();
//			});
//		});
//	});
//});

//電話番号リンク（スマホ表示時）
//if (navigator.userAgent.match(/(iPhone|iPad|iPod|Android)/)) {
//$(function() {
//	$('.tel').each(function() {
//		var str = $(this).html();
//		if ($(this).children().is('img')) {
//			$(this).html($('<a>').attr('href', 'tel:' + $(this).children().attr('alt').replace(/-/g, '')).append(str + '</a>'));
//		} else {
//			$(this).html($('<a>').attr('href', 'tel:' + $(this).text().replace(/-/g, '')).append(str + '</a>'));
//		}
//	});
//});
//}
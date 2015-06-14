// JavaScript Document
// for check box and radio box style reset
$(document).ready(function(){
  $('input').iCheck({
    checkboxClass: 'icheckbox_flat-blue',
    radioClass: 'iradio_flat-blue'
  });
});
//left menu tab toggle
$(function() {
	var $items = $('#tabs>li');
	$items.click(function() {
		$items.removeClass('now');
		$(this).addClass('now');
		var index = $items.index($(this));
		$('#tab_conbox>div').hide().eq(index).show();
	}).eq(0).click();
});

//open window and show shadow layer
function popwin(){

    $( "#tabs11" ).tabs({
    collapsible:true,
     active:false,
      beforeLoad: function( event, ui ) {
        ui.jqXHR.error(function() {
          ui.panel.html(
            "����ʧ�ܣ����Ժ����ԡ�" );
        });
      }
    });

	var H1 = $(window).height();
	var H2 = $(document).height();
	var H3 = $(document.body).height();
	var H4 = $(document.body).outerHeight(true); 
	//alert( H1 + '+' + H2 + '+' + H3 + '+' + H4);
	var highter = Math.max(H1,H2);
	$("body").css('overflow','hidden');
	$(".shadow").css('height', highter).show();
	$(".popwin").show();
}
//close window and hide shadow layer
function closewin(){
	$("body").css('overflow','');
	$(".shadow").hide();
	$(".popwin").hide()
}
//scroll for side list if too long
(function($){
	$(window).load(function(){
		$(".sidelist-overflow, .table-overflow").mCustomScrollbar({
			scrollButtons:{
				enable:true
			},
			theme:"dark-thick"
		});
		$(".photobox").mCustomScrollbar({
			scrollButtons:{
				enable:true
			},
			theme:"dark-thick",
			horizontalScroll:true
		});		
	});
})(jQuery);
// for pictures to enlarge
$(function() {
	$('.fancybox').fancybox({
		nextEffect		: 'elastic',
	});
  });	 


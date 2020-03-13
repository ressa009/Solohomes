$(function(){ 
	$(".mo_menu").removeClass("show")
	
	// 메뉴 상단 고정 시 배경색 변경
	$(window).scroll(function() {
	    var scrollPosition = $(window).scrollTop();

	    if (scrollPosition >= 100) {	      
	    	$('header').addClass("bg_white")
	    } else{
	    	$('header').removeClass("bg_white");
	    }
	  });
	
	$(window).width(function() {
		var winWidth = $(window).width();
		if(winWidth > 600){
			$(".mo_menu").removeClass("show");
		}
	});

	// Get the modal
	var modal = document.getElementById('myModal');

	// Get the button that opens the modal
	var btn = document.getElementById("menuBtn");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
			
	
	btn.onclick = function() {	
		var winWidth = $(window).width();
		
		if(winWidth <= 600){
			$(".mo_menu").toggleClass("show");
			modal.style.display = "none";
		} else{
			$(".mo_menu").removeClass("show");
			modal.style.display = "block";	
		}
	}
		
	$(".f").click(function() {
		$(".f_sub").toggleClass("show")
	});
	
	$(".mypage").click(function() {
		$(".my_sub").toggleClass("show")
	});
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {		
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		if (event.target == modal) {
			modal.style.display = "none";
			$(".mo_menu").removeClass("show")
		}
	}
});

$(function(){ 
	// Get the modal
	var modal = document.getElementById('popUp');

	// Get the button that opens the modal
	var btn = document.getElementByClassName("notify");

	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
			
	
	btn.onclick = function() {	
		modal.style.display = "block";	
	}

	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {		
		modal.style.display = "none";
	}

	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
		modal.style.display = "none";
	}
});

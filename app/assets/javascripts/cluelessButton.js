// (function() {
	$(document).on("click", ".clueless-button", function(e){
		e.preventDefault();
		console.log("hi")
		var refractoryTime = 10000
		console.log("click");
		$(".clueless-form").addClass("hidden");
		$('#circle').removeClass('hidden');
		$('#circle').circleProgress({
			thickness: 10,
			animationStartValue: 1,
			reverse: true,
	        value: 0,
	        size: 200,
	        fill: {
	            image: "../assets/images/progressbar.png"
	        },
	        animation: {duration: refractoryTime, easing: "linear"}
	    })
	    
	    setTimeout(function(){
	    	$(".clueless-form").removeClass("hidden");
	    	$("#circle").addClass("hidden");
	    }, refractoryTime)

	// })
}); // .success(function(data))...  data will include refractory length


	$('#circle').circleProgress({
        value: 1,
        size: 200,
    });
// })()

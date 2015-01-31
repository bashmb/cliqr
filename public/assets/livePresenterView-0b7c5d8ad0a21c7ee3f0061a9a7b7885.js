$(".start-lecture-button").click(function(){
	setInterval(function(){
		$.get( "../questions/latest", function( data ) {
  			console.log(data)
		});
	}, 1000)
})
;

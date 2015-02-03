$(".clueless-button").click(function(e){
	e.preventDefault();
	console.log("click")
	var refractoryTime = 6000;

	$.ajax({
  		type: "POST",
  		url: "/questions",
  		data: { 
  			utf8: "\u2713",
			authenticity_token: $('input[name=authenticity_token]').val(),
			question: {
				text: $('.clueless-input').val(),
				user_id: $('.user-id-input').val(),
				upvote: 1,
				downvote: 0
			},
			commit: "Create Question"
  		}
	});

	$(".clueless-form").addClass("hidden-button");
	$('#circle').removeClass('hidden-button');
	$('#circle').circleProgress({
		thickness: 10,
		animationStartValue: 1,
		reverse: true,
        value: 0,
        size: 200,
        fill: {
            image: "/assets/progressbar-d11907eddf4fea6f39c62e38be16ceeb.png"
        },
        animation: {duration: refractoryTime, easing: "linear"}
    })
    
    setTimeout(function(){
    	$(".clueless-form").removeClass("hidden-button");
    	$("#circle").addClass("hidden-button");
      $('.clueless-input').val('')
    }, refractoryTime)

}); // .success(function(data))...  data will include refractory length

	$('#circle').circleProgress({
        value: 1,
        size: 200,
    });

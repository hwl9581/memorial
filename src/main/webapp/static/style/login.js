 $("#login-button").click(function(event){

 	let username = $('[name="username"]').val();
 	let password = $('[name="password"]').val();

 	$.ajax({
		url:'/memorial/user',
		type:'get',
		data:{
			'username':username,
			'password':password
		},
		dataType:'json',
		success: function (obj) {
			console.log(obj);
			console.log(obj.code)
			if (obj.code == 200){
				event.preventDefault();

				$('form').fadeOut(500,function(){
					setTimeout(function(){
						location.href="/memorial/view/index";
					},500);
				});
				$('.wrapper').addClass('form-success');
			} else {
				alert("账号或密码错误");
			}
		}
	})

	
});
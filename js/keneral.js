$(document).ready(function(){
	//加载完毕后进行初始化
	//if(1==window.localStorage.getItem("$islogin")) {
		$("#screen_login").css("display","none");
		$("#screen").css("display","block");
	//}
	//图片切换
	var curIndex=0;
	var timeInterval=3000;
	var arr=new Array();
	arr[0]="http://202.118.89.16:8080/UploadedImages/pic0.png";
	arr[1]="http://202.118.89.16:8080/UploadedImages/pic1.png";
	arr[2]="http://202.118.89.16:8080/UploadedImages/pic2.png";
	arr[3]="http://202.118.89.16:8080/UploadedImages/pic3.png";
	arr[4]="http://202.118.89.16:8080/UploadedImages/pic4.png";
	arr[5]="http://202.118.89.16:8080/UploadedImages/pic5.png";
	arr[6]="http://202.118.89.16:8080/UploadedImages/pic6.png";
	setInterval(changeImg,timeInterval);
	function changeImg()
	{
		var obj=document.getElementById("images");
		if (curIndex==arr.length-1) 
		{
			curIndex=0;
		}
		else
		{
			curIndex+=1;
		}
		obj.src=arr[curIndex];
	}

	// 点击后侧边栏划出
	$("#slider_push_bar").click(function(){
		if(0==$slider_open) {
			$("#main_screen").animate({left:'250px'});
			$slider_open = 1;
			$("#main_slider").css("display","block");
			
			//读求陪伴
			$("#qiupeibans").empty();
			jQuery.getScript("http://202.118.89.16:8080/qiupeiban.php");
			for(i=0;i<qiupeibans.length;i++){
				if(qiupeibans[i].is_end==0){
					if(qiupeibans[i].store_id==($shop_id+1)){
						var $node=$("<div class='state' onClick='show_peiban("+qiupeibans[i].ID+");'>"
							+"<img src='"+users[qiupeibans[i].user_id-1].pic+"' />"
							+"<div class='content'><div class='wenzi' style='font-weight:bold;'>"+users[qiupeibans[i].user_id-1].name+"</div>"
							+"<div class='wenzi'>"+qiupeibans[i].content+"</div>"
							+"<div class='time'>"+qiupeibans[i].time+"</div></div>"
						+"</div>");
						$("#qiupeibans").append($node);
					}
				}
			}
			//读评论
			$("#states").empty();
			jQuery.getScript("http://202.118.89.16:8080/state.php");
			for(i=0;i<states.length;i++){
				if(states[i].store_id==($shop_id+1)){
					var $node=$("<div class='state'>"
						+"<img src='"+users[states[i].user_id-1].pic+"' />"
						+"<div class='content'><div class='wenzi' style='font-weight:bold;'>"+users[states[i].user_id-1].name+"</div>"
						+"<div class='wenzi'>"+states[i].content+"</div>"
						+"<div class='time'>"+states[i].time+"</div></div>"
					+"</div>");
					$("#states").append($node);
				}
			}
		}else {
			$("#main_screen").animate({left:'0px'});
			$slider_open = 0;
			$("#main_slider").css("display","none");
		}
	});
		$("#OKAY").click(function(){
			$("#dialoger").css("display","none");
		});
		$("#button_no").click(function(){
				$("#peiban_input").css("display","none");
				$("#dialoger").css("display","none");
			});
		$("#button_peiban").click(function(){	
			$("#peiban_input").css("display","block");
			$pei_ping=1;
		});
		$("#button_ping").click(function(){
			$("#peiban_input").css("display","block");
			$pei_ping=2;
		});
		
		$("#button_ok").click(function(){
			if($pei_ping==1){
				var $content=$("#yaoyongzhegehuoqu").val();
				var $sid=$shop_id+1;
				var $uid=parseInt(window.localStorage.getItem("$user_id"));
				url="http://202.118.89.16:8080/fapeiban.php?content=" + $content + "&store_id=" + $sid +"&user_id=" + $uid;
				
				jQuery.getScript(url,function(){
					$("#peiban_input").css("display","none");
					$("#qiupeibans").empty();
					jQuery.getScript("http://202.118.89.16:8080/qiupeiban.php",function(){
						for(i=0;i<qiupeibans.length;i++){
							if(qiupeibans[i].is_end==0){
								if(qiupeibans[i].store_id==($shop_id+1)){
									var $node=$("<div class='state' onClick='show_peiban("+qiupeibans[i].ID+");'>"
										+"<img src='"+users[qiupeibans[i].user_id-1].pic+"' />"
										+"<div class='content'><div class='wenzi' style='font-weight:bold;'>"+users[qiupeibans[i].user_id-1].name+"</div>"
										+"<div class='wenzi'>"+qiupeibans[i].content+"</div>"
										+"<div class='time'>"+qiupeibans[i].time+"</div></div>"
									+"</div>");
									$("#qiupeibans").append($node);
								}
							}
						}
					});
				});
			}
			if($pei_ping==2){
				var $content=$("#yaoyongzhegehuoqu").val();
				$sid=$shop_id+1;
				$uid=parseInt(window.localStorage.getItem("$user_id"));
				url="http://202.118.89.16:8080/fapinglun.php?content=" + $content + "&store_id=" + $sid +"&user_id=" + $uid;
				
				jQuery.getScript(url,function(){
					$("#peiban_input").css("display","none");
					jQuery.getScript("http://202.118.89.16:8080/state.php",function(){
						$("#states").empty();
						for(i=0;i<states.length;i++){
							if(states[i].store_id==$sid){
								var $node=$("<div class='state'>"
									+"<img src='"+users[states[i].user_id-1].pic+"' />"
									+"<div class='content'><div class='wenzi' style='font-weight:bold;'>"+users[states[i].user_id-1].name+"</div>"
									+"<div class='wenzi'>"+states[i].content+"</div>"
									+"<div class='time'>"+states[i].time+"</div></div>"
								+"</div>");
								$("#states").append($node);
							}
						}
					});
				});
			}
		});
		$("#button_no").click(function(){
			$("#peiban_input").css("display","none");
			$("#dialoger").css("display","none");
		});
	
	// 点击后侧边栏复位
	$(".content").click(function(){
		if(1==$slider_open){ 
			$("#main_screen").animate({left:'0px'});
			$slider_open = 0;
			$("#main_slider").css("display","none");
		}
	});
	
	//点击后刷新
	$("#refresh").click(function(){
		jQuery.getScript("http://202.118.89.16:8080/store.php");
		$("#sign_num").text("当前签到人数："+stores[$shop_id].num_now);
		var $ifBuzy ="";
		if(stores[$shop_id].num_now<=(2*stores[$shop_id].num_max/3)) {$ifBuzy="忙碌程度：清闲(最完美的服务)";}
		if(stores[$shop_id].num_now>(2*stores[$shop_id].num_max/3)) {$ifBuzy="忙碌程度：适中(不用等座)";}
		if(stores[$shop_id].num_now>stores[$shop_id].num_max) {$ifBuzy="忙碌程度：忙碌(可能需要等座)";}
		$("#if_buzy").text($ifBuzy);
	});
	
	
	// 这一串是底下那个tab的动画
	$("#button1").click(function(){
		$("#bar").animate({left:'0px'});
		
		$("#button1").css("background-image","url(images/map_a.png)");
		$("#button2").css("background-image","url(images/info.png)");
		$("#button3").css("background-image","url(images/shop.png)");
		$("#button4").css("background-image","url(images/more.png)");
			
		$("#con4").css("display","none");
		$("#con2").css("display","none");
		$("#con3").css("display","none");
		$("#con1").css("display","block");
		
		$("#slider_push_bar").css("display","none");
		$("#refresh").css("display","none");
		$("#main_screen").animate({left:'0px'});

		// 加载腾讯地图
		if(0==$importMap) {
			var script = document.createElement("script");
  			script.type = "text/javascript";
			script.src = "http://map.qq.com/api/js?v=2.exp&callback=map_init";
  			document.body.appendChild(script);
			map_init();
			$importMap = 1;
		}
	});
	
	$("#button2").click(function(){
		$("#bar").animate({left:'90px'});
		
		$("#button1").css("background-image","url(images/map.png)");
		$("#button2").css("background-image","url(images/info_a.png)");
		$("#button3").css("background-image","url(images/shop.png)");
		$("#button4").css("background-image","url(images/more.png)");
			
		$("#con1").css("display","none");
		$("#con3").css("display","none");
		$("#con4").css("display","none");
		$("#con2").css("display","block");
		
		$("#slider_push_bar").css("display","none");
		$("#refresh").css("display","none");
		$("#main_screen").animate({left:'0px'});
		$("#qidai").css("display","none");
		$("#shop_frame").css("display","block");
	});
	
	$("#button3,#bar1,#bar3,#bar4").click(function(){
		$("#bar").animate({left:'180px'});
		
		$("#info_list").css("display","block");
		$("#info_message").css("display","none");
		$("#invite_frame").css("display","none");
		
		$("#button1").css("background-image","url(images/map.png)");
		$("#button2").css("background-image","url(images/info.png)");
		$("#button3").css("background-image","url(images/shop_a.png)");
		$("#button4").css("background-image","url(images/more.png)");
			
		$("#con1").css("display","none");
		$("#con2").css("display","none");
		$("#con4").css("display","none");
		$("#con3").css("display","block");
		
		$("#slider_push_bar").css("display","none");
		$("#refresh").css("display","none");
		$("#info_frame").css("display","block");
		$("#main_screen").animate({left:'0px'});
		
		//店铺列表开始从后台读数据
		jQuery.getScript("http://202.118.89.16:8080/store.php");
		$("#info_list").empty();
			for(i=0;i<stores.length;i++){
				var $node = $("<div class='list'><div class='pic'><img src='"+stores[i].picture+"' />"
					+"</div><div class='info_rec' onClick='show_shop_info("+i+");'>"
					+"<div class='shop_name'><h1>"+stores[i].name+"</h1></div>"
					+"<div class='shop_info'>"+stores[i].introduction+"</div>"
					+"<div class='num'>当前签到人数："+stores[i].num_now+"</div></div></div>");
				$("#info_list").append($node);
			}
	});
	
	$("#button4").click(function(){
		$("#bar").animate({left:'270px'});
	
		$("#button1").css("background-image","url(images/map.png)");
		$("#button2").css("background-image","url(images/info.png)");
		$("#button3").css("background-image","url(images/shop.png)");
		$("#button4").css("background-image","url(images/more_a.png)");
			
		$("#con1").css("display","none");
		$("#con2").css("display","none");
		$("#con3").css("display","none");
		$("#con4").css("display","block");
		
		$("#more_list").css("display","block");
		$("#more_user").css("display","none");
		$("#more_message").css("display","none");
		
		$("#slider_push_bar").css("display","none");
		$("#refresh").css("display","none");
	});
	
	//签到
	$("#sign").click(function() {
		$("#dialog").css("display","block");
		$("#dialog_p").text("您的位置不符，请重试！");
		//url="http://202.118.89.16:8080/qiandao.php?store_id="+($shop_id+1);
		//jQuery.getScript(url);
		//alert($shop_id);
	});
	
	//签到完成
	$("#OK").click(function() {
		$("#dialog").css("display","none");
	});
	
	//离开
	$("#leave").click(function() {
		$("#dialog").css("display","block");
		$("#dialog_p").text("您还没有签到，请确认已签到！");
	});
	
	//敬请期待
	$("#bar2,#bar5").click(function() {
		$("#shop_frame").css("display","none");
		$("#qidai").css("display","block");
	});
	
	//点击登录
	$("#login_button").click(function(){
		$("#prompt_text0").css("display","none");
		for(i=0;i<users.length;i++){
			if($("#login_username").val()==users[i].name){
				if($("#login_password").val()==users[i].password){
					window.localStorage.setItem("$user_id",users[i].user_id);
					window.localStorage.setItem("$islogin",1);
					$("#screen_login").css("display","none");
					$("#screen").css("display","block");
					break;
				}
				else{
					$("#prompt_text0").css("display","block");
					$("#prompt_text0").text("用户名或密码错误，请重试！");
				}
			}
			else{
				window.localStorage.setItem("$islogin",0);
			}
		}
	});
	$("#register_button").click(function(){
		$("#screen_register").css("display","block");
	});
	
	//点击注册
	$("#r_register_button").click(function(){
		var m=0;
		var name = $("#register_username").val();
		var password = $("#password_register").val();
		var sex = $("#sex").val();
		var age = parseInt($("#age").val());
		var email = $("#email").val();
		$("#prompt_text").empty();
		if(name==""){
			$("#prompt_text").css("display","block");
			$("#prompt_text").text("用户名不能为空，请重试!");
		}
		else if($("#password_register").val()!=$("#password_again").val()){
			$("#prompt_text").css("display","block");
			$("#prompt_text").text("两次密码不一致，请重试!");
		}
		else{
			for(m=0;m<users.length;m++){
				if(users[m].name==name){
					$("#prompt_text").css("display","block");
					$("#prompt_text").text("该用户名已存在，请重试!");
					break;
				}
			}
			if(m==users.length){
				var url = "http://202.118.89.16:8080/register.php?name="+name+"&password="+password+"&sex="+sex+"&age="+age+"&email="+email;
				jQuery.getScript(url);
				jQuery.getScript("http://202.118.89.16:8080/user.php");
				window.localStorage.setItem("$user_id",users.length+1);
				window.localStorage.setItem("$islogin",1);
				$("#screen_register").css("display","none");
				$("#screen_login").css("display","none");
				$("#screen").css("display","block");
			}
		}
	});
	
	//点击我的账号
	$("#more_button1").click(function(){
		$("#more_list").css("display","none");
		$("#more_message").css("display","none");
		$("#con3").css("display","block");
		$("#info_frame").css("display","none");
		$("#invite_frame").css("display","block");
		$("#history").css("display","block");
		$("#button_yingyue").css("display","none");
		$("#invite").css("display","none");
		$("#dating").css("display","none");
		$("#fasong").css("display","none");
		
		jQuery.getScript("http://202.118.89.16:8080/qiupeiban.php");
			
		//开始读取信息
		$("#invite_img").attr("src",users[window.localStorage.getItem("$user_id")-1].pic);
		$("#qiupeiban_name").text("昵称："+users[window.localStorage.getItem("$user_id")-1].name);
		$("#qiupeiban_sex").text("性别："+users[window.localStorage.getItem("$user_id")-1].sex);
		$("#qiupeiban_age").text("年龄："+users[window.localStorage.getItem("$user_id")-1].age);
		$("#history").empty();
		$("#history").text("历史记录");
		for(i=0;i<qiupeibans.length;i++){
			if(qiupeibans[i].user_id==window.localStorage.getItem("$user_id")){
				var $node = $("<div class='history_record'><div class='record_time'>"+qiupeibans[i].time.substring(5,16)+"</div>"
					+"<div class='record_text'>"+qiupeibans[i].content+"</div>"
					+"<div class='record_num'>共有"+qiupeibans[i].sum_num+"人应约，拒绝"+qiupeibans[i].refuse_num+"人</div>"
					+"</div>");
				$("#history").append($node);
			}
		}
		
	});
	
	//点击我的积分
	$("#more_button2").click(function(){
		$("#more_list").css("display","none");
		$("#more_user").css("display","none");
		$("#more_message").css("display","block");
		$("#more_message").text("程序员正在加班加点开发中，敬请期待~");
	});
	
	//点击我的关注
	$("#more_button3").click(function(){
		$("#more_list").css("display","none");
		$("#more_user").css("display","none");
		$("#more_message").css("display","block");
		$("#more_message").text("程序员正在加班加点开发中，敬请期待~");
	});
	
	//点击版本信息
	$("#more_button4").click(function(){
		$("#more_list").css("display","none");
		$("#more_user").css("display","none");
		$("#jifen").css("display","none");
		$("#more_message").css("display","block");
		$("#more_message").text("一起签 V2.0，你值得拥有！");
	});
	
	//点击我的消息
	$("#more_button5").click(function(){
		$("#more_list").css("display","none");
		$("#more_user").css("display","none");
		$("#jifen").css("display","none");
		$("#more_message").css("display","block");
		$("#more_message").text("亲爱的用户，你目前没有消息！");
	});
	
	//点击退出账号
	$("#more_button6").click(function(){
		$("#screen_login").css("display","block");
		$("#screen").css("display","none");
	});
	
	
});
//显示求陪伴信息
function show_peiban($qiupeiban_id){
	$("#main_screen").animate({left:'0px'});
	$("#invite_frame").css("display","block");
	$("#info_frame").css("display","none");
	$("#slider_push_bar").css("display","none");
	$("#refresh").css("display","none");
	$("#main_slider").css("display","none");
	$("#fasong").css("display","none");
	$("#button_yingyue").css("display","block");
	$("#invite").css("display","block");
	$("#dating").css("display","block");
	$("#history").css("display","none");
	
	jQuery.getScript("http://202.118.89.16:8080/qiupeiban.php");
	
	//读取内容
	$("#invite_img").attr("src",users[qiupeibans[$qiupeiban_id-1].user_id-1].pic);
	$("#qiupeiban_name").text("昵称："+users[qiupeibans[$qiupeiban_id-1].user_id-1].name);
	$("#qiupeiban_sex").text("性别："+users[qiupeibans[$qiupeiban_id-1].user_id-1].sex);
	$("#qiupeiban_age").text("年龄："+users[qiupeibans[$qiupeiban_id-1].user_id-1].age);
	$("#text").text(qiupeibans[$qiupeiban_id-1].content);
	$("#invite_time").text("发布时间："+qiupeibans[$qiupeiban_id-1].time.substring(5,16));
	$("#yingyue_num").text("目前有"+qiupeibans[$qiupeiban_id-1].sum_num+"人应约，已拒绝"+qiupeibans[$qiupeiban_id-1].refuse_num+"人 。");
	
	$("#button_yingyue").click(function(){
		url="http://202.118.89.16:8080/fasong_yy.php?user_id="+window.localStorage.getItem("$user_id")+"&qiupeiban_id="+$qiupeiban_id;
		jQuery.getScript(url);
		$("#fasong").css("display","block");
		jQuery.getScript("http://202.118.89.16:8080/qiupeiban.php");
		$("#yingyue_num").text("目前有"+qiupeibans[$qiupeiban_id-1].sum_num+"人应约，已拒绝"+qiupeibans[$qiupeiban_id-1].refuse_num+"人 。");
	});
	
}

//显示活动信息
function show_shop_info($info_id) {
	$("#info_list").css("display","none");
	$("#info_message").css("display","block");
	$("#slider_push_bar").css("display","block");
	$("#refresh").css("display","block");
	$shop_id=$info_id;
	
	jQuery.getScript("http://202.118.89.16:8080/store.php");
	jQuery.getScript("http://202.118.89.16:8080/discount.php");
	jQuery.getScript("http://202.118.89.16:8080/introduction.php");
	
	//开始从数据库中读取数据
	$("#shop_msg_h").text(stores[$shop_id].name);
	$("#shop_msg_img").attr("src",stores[$shop_id].picture);
	$("#sign_num").text("当前签到人数："+stores[$shop_id].num_now);
	var $ifBuzy ="";
	if(stores[$shop_id].num_now<=(2*stores[$shop_id].num_max/3)) {$ifBuzy="忙碌程度：清闲(最完美的服务)";}
	if(stores[$shop_id].num_now>(2*stores[$shop_id].num_max/3)) {$ifBuzy="忙碌程度：适中(不用等座)";}
	if(stores[$shop_id].num_now>stores[$shop_id].num_max) {$ifBuzy="忙碌程度：忙碌(可能需要等座)";}
	$("#if_buzy").text($ifBuzy);
	var $discount_content = "";
	$("#discount").text("测试用（此处显示折扣）");
	for(i=0;i<discounts.length;i++){
		if(discounts[i].store_id==($shop_id+1)){
			$discount_content += discounts[i].day+discounts[i].time_start.substring(0,5)+"-"+discounts[i].time_end.substring(0,5)+" "+discounts[i].content+" ";
		}
	}
	$("#discount").text($discount_content);
	$("#shop_intro").text(stores[$shop_id].intro_detail);
	$("#command").empty();
	for(i=0;i<introductions.length;i++){
		if(introductions[i].store_id==($shop_id+1)){
			if(introductions[i].available==1){
				var $node = $("<img src="+introductions[i].pic+" />"
								+"<p class='intro'>"+introductions[i].content+"</p>");
				$("#command").append($node);
			}
		}
	}
}


// 腾讯地图加载
function map_init() {
	var myLatlng = new qq.maps.LatLng(39.961593,116.358062);
  	var myOptions = {
		zoom: 15,
		center: myLatlng,
    	mapTypeId: qq.maps.MapTypeId.ROADMAP
	}
  	var map = new qq.maps.Map(document.getElementById("map_frame"), myOptions);
}

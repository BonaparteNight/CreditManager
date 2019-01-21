/*	window.onload = function() {
	var oActionBlock = document.getElementById('action-block');
	var oActionBar = document.getElementById('action-bar');
	var oScrollBar = document.getElementById('scroll-bar');
	var oShowAmount = document.getElementById('showAmount').getElementsByTagName('input')[0];
	var length = 550;

	clickSlide(oActionBlock, oActionBar, oScrollBar, 300, length, oShowAmount);
	drag(oActionBlock, oActionBar, 300, length, oShowAmount);
	addScale(60, 300, length, oScrollBar);
	inputBlur(oActionBlock, oActionBar, length, oShowAmount);
}		*/

function SlideBar(data){
	var _this = this;
	var oActionBlock = document.getElementById(data.actionBlock);
	var oActionBar = document.getElementById(data.actionBar);
	var oSlideBar = document.getElementById(data.slideBar);
	var barLength = data.barLength;
	var interval = data.interval;
	var maxNumber = data.maxNumber;
	var oShowArea = null;
	if(data.showArea){
		oShowArea = document.getElementById(data.showArea);	
	}

	if(oShowArea){
		_this.addScale(oSlideBar, interval, maxNumber, barLength);
		_this.inputBlur(oActionBlock, oActionBar, maxNumber, barLength, oShowArea);
		_this.clickSlide(oActionBlock, oActionBar, oSlideBar, maxNumber, barLength, oShowArea);
		_this.drag(oActionBlock, oActionBar, maxNumber, barLength, oShowArea);
	}
	else{
		_this.addScale(oSlideBar, interval, maxNumber, barLength);
		_this.clickSlide(oActionBlock, oActionBar, oSlideBar, maxNumber, barLength);
		_this.drag(oActionBlock, oActionBar, maxNumber, barLength);
	}
	
}

SlideBar.prototype = {
	//åå§å(æ·»å å»åº¦çº¿)
	addScale : function(slideBar, interval, total, barLength){
		// intervalä»£è¡¨å»åº¦ä¹é´é´éå¤å°, totalä»£è¡¨æå¤§å»åº¦
		// slideBarè¡¨ç¤ºå¨åªä¸ªå®¹å¨æ·»å å»åº¦

		var num = total / interval; //numä¸ºåºè¯¥æå¤å°ä¸ªå»åº¦

		for (var i = 1; i < num + 1; i++) {
			var oScale = document.createElement('div');
			oScale.style.width = '2px';
			oScale.style.height = '14px';
			oScale.style.position = 'absolute';
			oScale.style.background = '#AFAFAF';
			oScale.style.zIndex = '-10';
			oScale.style.left = (i * interval * barLength) / total + 'px';
			slideBar.appendChild(oScale);

			var oText = document.createElement('div');
			oText.style.position = 'absolute';
			oText.style.top = '16px';
			oText.style.height = '16px';
			oText.innerHTML = i * interval;
			slideBar.appendChild(oText);
			oText.style.left = ((i * interval * barLength) / total) - (oText.offsetWidth / 2) + 'px';
		}
	},

	// çå¬è¾å¥æ¡
	inputBlur : function(actionBlock, actionBar, maxNumber, barLength, input){
		//actionBlockææ»å,actionBarææ¾ç¤ºæ¡,inputææ¾ç¤ºçè¾å¥æ¡
		var _this = this;
		input.onblur = function(){
			var inputVal = this.value;
			_this.autoSlide(actionBlock, actionBar, maxNumber, barLength, inputVal);
		}
	},

	/* å¨è¾å¥æ¡è¾å¥å¼åèªå¨æ»å¨	*/
	autoSlide : function(actionBlock, actionBar, total, barLength, inputVal){
		//inputValè¡¨ç¤ºè¾å¥æ¡ä¸­è¾å¥çå¼
		var _this = this;
		var target = (inputVal / total * barLength);
		_this.checkAndMove(actionBlock, actionBar, target);
	},

	/*	æ£æ¥target(ç¡®è®¤ç§»å¨æ¹å)å¹¶æ»å¨	*/
	checkAndMove : function(actionBlock, actionBar, target){
	var actionBarSpeed=0;
		if(target > actionBar.offsetWidth){
			actionBarSpeed = 8;		//actionBarçç§»å¨åº¦åæ¹å
		}
		else if(target == actionBar.offsetWidth){
			return;
		}
		else if(target < actionBar.offsetWidth){
			actionBarSpeed = -8;
		}
		
		var timer = setInterval(function(){
			var actionBarPace = actionBar.offsetWidth + actionBarSpeed;

			if(Math.abs(actionBarPace - target) < 10){
				actionBarPace = target;
				clearInterval(timer);
			}
			actionBar.style.width = actionBarPace + 'px';
			actionBlock.style.left = actionBar.offsetWidth - (actionBlock.offsetWidth / 2) + 'px';
		},30);
	},

	/*	é¼ æ ç¹å»å»åº¦æ»å¨åèªå¨æ»å¨	*/
	clickSlide : function(actionBlock, actionBar, slideBar, total, barLength, showArea){
		var _this = this;
		slideBar.onclick = function(ev){
			var ev = ev || event;
			var target = ev.clientX - slideBar.offsetLeft;
			if(target < 0){
				//è¡¨ç¤ºé¼ æ å·²ç»è¶åºé£ä¸ªèå´
				target = 0;
			}
			if(target > barLength){
				target = barLength;
			}
			_this.checkAndMove(actionBlock, actionBar, target);
			if(showArea){
				var value = Math.round(target / barLength * total);
				if(value == 0)
				{
					showArea.value = 1;	
					value = 1;
				}
				else
				{
					showArea.value = value;	
				}
				
				document.getElementById("validate_data").value = 10-value;
			}
		}
	},

	/*	é¼ æ æçæå¨æ»å¨æ¡	*/
	drag : function(actionBlock, actionBar, total, barLength, showArea){
		/*	åæ°åå«æ¯ç¹å»æ»å¨çé£ä¸ªå,æ»å¨çè·ç¦»,æ»å¨æ¡çæå¤§æ°å¼,æ¾ç¤ºæ°å¼çå°æ¹(è¾å¥æ¡)	*/
		actionBlock.onmousedown = function(ev) {
			var ev = ev || event;
			var thisBlock = this;
			var disX = ev.clientX;
			var currentLeft = thisBlock.offsetLeft;

			document.onmousemove = function(ev) {
				var ev = ev || event;
				var left = ev.clientX - disX;

				if (currentLeft + left <= (barLength - thisBlock.offsetWidth / 2 ) && currentLeft + left >= 0 - thisBlock.offsetWidth / 2) {
					thisBlock.style.left = currentLeft + left + 'px';
					actionBar.style.width = currentLeft + left + (actionBlock.offsetWidth / 2) + 'px';
					if(showArea){
						var value1 = Math.round(actionBar.offsetWidth / barLength * total);
						if(value1 == 0)
						{
							showArea.value = 1;
							value1=1;
						}
						else
						{
							showArea.value =value1;
						}
						document.getElementById("validate_data").value = 10-value1;
					}
				}
				return false;
			}

			document.onmouseup = function() {
				document.onmousemove = document.onmouseup = null;
			}

			return false;
		}
	},

	getStyle : function(obj, attr){
		return obj.currentStyle?obj.currentStyle[attr]:getComputedStyle(obj)[attr];
	}
}
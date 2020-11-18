var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

ctx.font = 'bold 32px sans';
ctx.fillStyle = 'yellow';
ctx.textAlign = 'right';

var framecount = 0;
var zeroes = '00000000';
var score = 0, scount = 0;
var mx = 320, my = 500;

function main() {
	window.ship = document.getElementById('ship');
	canvas.onclick = function() {
		score += 25;
	};
	canvas.onmousemove = function(e) {
		mx = e.pageX - canvas.offsetLeft;
		my = e.pageY - canvas.offsetTop;
	};
	(function loop() {
		requestAnimationFrame(loop);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		ship.draw(mx, my);
		scount += scount < score;
		ctx.fillText(zeroes + scount, ctx.measureText(zeroes).width, 40);
		++framecount;
	})();
}
var toload = 1;
var imgs = document.getElementsByTagName('img');
for (var i = imgs.length; i--;) {
	++toload;
	imgs[i].onload = function() {
		var w = this.width;
		var h = this.height;
		this.draw = function(x, y) {
			ctx.drawImage(this, x - w/2 | 0, y - h/2 | 0);
		};
		--toload || main();
	};
	imgs[i].src = imgs[i].id + '.png';
}
--toload || main();

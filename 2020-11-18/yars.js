var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

ctx.font = 'bold 32px sans';
ctx.fillStyle = 'yellow';
ctx.textAlign = 'right';

var framecount = 0;
var zeroes = '00000000';
var score = 0, scount = 0;
var mx = 320, my = 500;

function family(a) {
	return function(fn) {
		for (var i = a.length; i--;) a[i][fn]();
	};
}

var sprite = {
	draw: function() {
		this.img.draw(this.x, this.y);
	}
};

function Ship() {
	this.img = document.getElementById('ship');
	this.move = function() {
		this.x = mx;
		this.y = my;
	};
}
Ship.prototype = sprite;

var fired = 0;

function Bullet() {
	this.y = -999;
	this.img = document.getElementById('bullet');
	this.move = function() {
		if (this.y > -99) {
			this.y -= 20;
		}
		else if (!--fired) {
			this.x = ship.x;
			this.y = ship.y - 50;
		}
	};
}
Bullet.prototype = sprite;

var lag = 0;

function Invader(num) {
	this.lag = lag += 25;
	this.img = document.getElementById('inv' + num);
	this.move = function() {
		var t = 2 * Math.sin((framecount - this.lag) / 300);
		this.moveTo(t, 0);
	};
	this.moveTo = function(x, y) {
		this.x = canvas.width * (0.5 - x);
		this.y = canvas.height * (0.5 - y);
	};
}
Invader.prototype = sprite;

function main() {
	window.ship = new Ship();
	var good = family([
		ship,
		new Bullet(), new Bullet(), new Bullet(), new Bullet(),
	]);
	var bad = family([
		new Invader(1), new Invader(1), new Invader(1), new Invader(1),
		new Invader(2), new Invader(2), new Invader(2), new Invader(2),
		new Invader(3), new Invader(3), new Invader(3), new Invader(3),
	]);
	canvas.onclick = function() {
		fired = 1;
	};
	canvas.onmousemove = function(e) {
		mx = e.pageX - canvas.offsetLeft;
		my = e.pageY - canvas.offsetTop;
	};
	(function loop() {
		requestAnimationFrame(loop);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		bad('move');
		good('move');
		bad('draw');
		good('draw');
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

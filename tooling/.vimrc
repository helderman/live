set laststatus=0
set tabstop=4
set shiftwidth=4
set visualbell
set t_vb=

ia doc	<!DOCTYPE html><CR><meta charset="utf-8" />
ia title	<title>YARS</title><Left><Left><Left><Left><Left><Left><Left><Left>
ia css	<link rel="stylesheet" href="yars.css" />
ia js		<script src="yars.js"></script>
ia canvas	<canvas id="canvas" width="640" height="580"></canvas>
ia im	<img id="ship" src="ship.png" />
ia audio	<audio id="pew" preload><CR><source src="pew.mp3" type="audio/mpeg"></source><CR></audio>

ia black	#canvas {<CR>background: black;<CR>}
ia bg		url(stars.jpg) repeat-y;<CR>animation: scrolling 40s linear infinite;
ia key	@keyframes scrolling {<CR>from { background-position-y: 0; }<CR>to { background-position-y: 640px; }<CR>}
ia none	img {<CR>display: none;<CR>}

ia can	var canvas = document.getElementById('canvas');
ia ctx	var ctx = canvas.getContext('2d');
ia varframe var framecount = 0;
ia fmain	function main() {<CR><CR>}<CR>main();
ia floop	(function loop() {<CR>requestAnimationFrame(loop);<CR><CR>++framecount;<CR>})();
ia clear	ctx.clearRect(0, 0, canvas.width, canvas.height);
ia ctx1	ctx.font = 'bold 32px sans';<CR>ctx.fillStyle = 'yellow';<CR>ctx.textAlign = 'right';
ia varz	var zeroes = '00000000';
ia zero	var zeroes = '00000000';
ia text	ctx.fillText(zeroes, ctx.measureText(zeroes).width, 40);
ia click	canvas.onclick = function() {<CR>score += 25;<CR>};
ia sc		scount += scount < score;

ia varmx	var mx = 320, my = 500;
ia ship1	window.ship = document.getElementById('ship');
ia ship2	ctx.drawImage(ship, mx, my);

ia mouse	canvas.onmousemove = function(e) {<CR>mx = e.pageX - canvas.offsetLeft;<CR>my = e.pageY - canvas.offsetTop;<CR>};
ia toload1	var toload = 1;<CR><CR>--toload <Bar><Bar>
ia toload2	var imgs = document.getElementsByTagName('img');<CR>for (var i = imgs.length; i--;) {<CR>++toload;<CR>imgs[i].onload = function() {<CR><CR>};<CR>}
ia toload3	imgs[i].src = imgs[i].id + '.png';
ia thisdraw	var w = this.width;<CR>var h = this.height;<CR>this.draw = function(x, y) {<CR>ctx.drawImage(this, x - w/2 <Bar> 0, y - h/2 <Bar> 0);<CR>};

ia csprite	var sprite = {<CR>draw: function() {<CR>this.img.draw(this.x, this.y);<CR>}<CR>};
ia cship	function Ship() {<CR>this.img = document.getElementById('ship');<CR>this.move = function() {<CR>this.x = mx;<CR>this.y = my;<CR>};<CR>}<CR>Ship.prototype = sprite;
ia cbullet	function Bullet() {<CR>this.y = -999;<CR>this.img = document.getElementById('bullet');<CR>this.move = function() {<CR>if (this.y > -99) {<CR>this.y -= 20;<CR>}<CR>else if (!--fired) {<CR>this.x = ship.x;<CR>this.y = ship.y - 50;<CR>}<CR>};<CR>}<CR>Bullet.prototype = sprite;
ia cfamily	function family(a) {<CR>return function(fn) {<CR>for (var i = a.length; i--;) a[i][fn]();<CR>};<CR>}
ia vargood	var good = family([<CR>ship,<CR>new Bullet(), new Bullet(), new Bullet(), new Bullet(),<CR>]);
ia callgood	good('move');<CR>good('draw');
ia cinv	function Invader(num) {<CR>this.img = document.getElementById('inv' + num);<CR>this.move = function() {<CR>var t = 2 * Math.sin(framecount / 300);<CR>this.moveTo(t, 0);<CR>};<CR>this.moveTo = function(x, y) {<CR>this.x = canvas.width * (0.5 - x);<CR>this.y = canvas.height * (0.5 - y);<CR>};<CR>}<CR>Invader.prototype = sprite;
ia varbad	var bad = family([<CR>new Invader(1), new Invader(1), new Invader(1), new Invader(1),<CR>new Invader(2), new Invader(2), new Invader(2), new Invader(2),<CR>new Invader(3), new Invader(3), new Invader(3), new Invader(3),<CR>]);

ia thislag	this.lag = lag += 25;
ia varshape	ctx.drawImage(this, 0, 0);<CR>var shape = ctx.getImageData(0, 0, w, h).data;<CR>ctx.clearRect(0, 0, w, h);
ia thiscoll	this.collide = function(x, y) {<CR>var a = ctx.getImageData(x - w/2 <Bar> 0, y - h/2 <Bar> 0, w, h).data;<CR>for (var i = 3; i < a.length; i += 4) {<CR>if (a[i] + shape[i] > 500) return true;<CR>}<CR>return false;<CR>};
ia coll	collide: function() {<CR>this.hit = this.img.collide(this.x, this.y);<CR>},
ia expl	explode: function() {<CR>if (this.hit) {<CR>this.dead = framecount + this.xsize;<CR>score += this.xscore;<CR>}<CR>},<CR>dead: 0,<CR>xsize: 15,<CR>xscore: 0
ia ifdead	if (this.dead) return;
ia ift	if (t < -1.9 <Bar><Bar> t > 1.9) this.dead = 0;

ia ctx2	ctx.strokeStyle = 'white';<CR>ctx.lineCap = 'round';<CR>ctx.lineWidth = 10;
ia varcos	var cos = Math.cos(1);<CR>var sin = Math.sin(1);
ia vara	var a = this.dead - framecount;<CR>if (a > 0) {<CR><CR>}
ia varx	var x = 10 * (this.xsize - a), y = 0;
ia varrnd	var rnd = this.dead / 10;
ia ctx3	ctx.globalAlpha = 3 * a / this.xsize;<CR>ctx.beginPath();<CR><CR>ctx.stroke();<CR>ctx.globalAlpha = 1;
ia forrnd	for (var i = 3 * this.xsize; i--;) {<CR>rnd = rnd * 1.3 % 1 + 0.1;<CR><CR>}
ia ctx4	ctx.moveTo(this.x + x * rnd, this.y + y * rnd);<CR>ctx.lineTo(this.x + x * rnd * 0.9, this.y + y * rnd * 0.9);
ia rot	a = x * cos - y * sin;<CR>y = x * sin + y * cos;<CR>x = a;

ia au	function audio(id) {<CR>var a = document.getElementById(id);<CR>return function() {<CR>if (a.paused) a.play(); else a.currentTime = 0;<CR>};<CR>}<CR><CR>var pew = audio('pew');<CR>var bang = audio('bang');
ia ifbang	if (this.xsize > 10) bang();

ia swi	switch (num) {<CR>case 1:<CR>this.moveTo(t, 2*t*t);<CR>break;<CR>case 2:<CR>this.moveTo(t*(t-1)*(t+1), 0.5*t*t-0.2);<CR>break;<CR>case 3:<CR>this.moveTo(t*(t-1)*(t+1), 2*(t-1)*(t-0.5)*(t+0.5)*(t+1));<CR>break;<CR>}
ia xy	x += 0.1 * Math.sin((framecount - this.lag) / 17);<CR>y += 0.1 * Math.sin((framecount - this.lag) / 27);

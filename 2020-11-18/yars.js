var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

ctx.font = 'bold 32px sans';
ctx.fillStyle = 'yellow';
ctx.textAlign = 'right';

var framecount = 0;
var zeroes = '00000000';
var score = 0, scount = 0;

function main() {
	canvas.onclick = function() {
		score += 25;
	};
	(function loop() {
		requestAnimationFrame(loop);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		scount += scount < score;
		ctx.fillText(zeroes + scount, ctx.measureText(zeroes).width, 40);
		++framecount;
	})();
}
main();

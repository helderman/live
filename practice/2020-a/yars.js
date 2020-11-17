var canvas = document.getElementById('canvas');
var ctx = canvas.getContext('2d');

var framecount = 0;

function main() {
	(function loop() {
		requestAnimationFrame(loop);
		ctx.clearRect(0, 0, canvas.width, canvas.height);
		++framecount;
	})();
}
main();

var W = 400,
	H = 400;
	
var totalDist = 0;
var i = 1;
	
function createPoint() {
	point = {};
	point.a = random(0, 360);
	point.x = 100 * cos(point.a);
	point.y = 100 * sin(point.a);
	return point;
}
	
function setup() {
	createCanvas(W, H);
	
	ellipseMode(RADIUS);
	angleMode(DEGREES);
}

function settingsCircle() {
	noFill();
	stroke(255);
	strokeWeight(5);
}

function settingsOther() {
	fill(255, 0, 255);
	stroke(255, 0, 255);
}

function draw() {
	background(51);
	translate(W/2, H/2);
	
	settingsCircle();
	ellipse(0, 0, 100);

	pointA = createPoint();
	pointB = createPoint();
	distAB = sqrt( sq(pointA.x - pointB.x) + sq(pointA.y - pointB.y) ) / 100;
	
	totalDist += distAB;
	
	settingsOther();
	ellipse(pointA.x, pointA.y, 3);
	ellipse(pointB.x, pointB.y, 3);
	line(pointA.x, pointA.y, pointB.x, pointB.y);
	
	strokeWeight(1);
	text(totalDist/i, -200, -200);
	
	i++;
	if (i == 10000) noLoop();
}
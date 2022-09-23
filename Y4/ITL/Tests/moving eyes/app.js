var eyes = document.querySelectorAll('.eye');

document.onmousemove = function (e) {
    var x = e.pageX;
    var y = e.pageY;
    eyes.forEach(function (eye) {
        var eyeX = (eye.getBoundingClientRect().left) + (eye.clientWidth / 2);
        var eyeY = (eye.getBoundingClientRect().top) + (eye.clientHeight / 2);
        var radianDegrees = Math.atan2(x - eyeX, y - eyeY);
        var rotationDegrees = (radianDegrees * (180 / Math.PI) * -1) + 90;
        eye.style.transform = `rotate(${rotationDegrees}deg)`;
    });
};
document.addEventListener("DOMContentLoaded", function(){
    let canvasEl = document.getElementById("mycanvas");
    canvasEl.width = 500;
    canvasEl.height = 500;

    let ctx = canvasEl.getContext("2d");
    ctx.fillStyle = "red";
    ctx.fillRect(100, 100, 100, 100);

    ctx.beginPath();
    ctx.arc(200, 200, 200, 0, 2*Math.PI);
    ctx.strokeStyle = "yellow";
    ctx.lineWidth = 100;
    ctx.stroke();
    ctx.fillStyle = "white";
    ctx.fill();
});

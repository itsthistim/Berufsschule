window.addEventListener('load', (event) => {
    document.getElementById("b1").onmouseover=function() 
    {
        document.images[0].src="assets/img/What-is-Bootstrap-Facebook.webp"; 
        document.getElementById("outRoll").innerHTML += "<p>aktuelles Bild: What is Bootstrap: Bild2</p>";
    }       
    document.getElementById("b1").onmouseout=function() 
    {
        document.images[0].src="assets/img/bootstrap-v5-new-logo.jpeg"; 
        document.getElementById("outRoll").innerHTML += "<p>aktuelles Bild: Bootstrap Logo Groß Bild1</p>";
    }
});
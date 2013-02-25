var script = document.createElement("script");
  script.type = "text/javascript";
  script.async = true;
  script.src = "http://code.jquery.com/jquery-1.9.1.min.js"
  script.onload = function() { doThis() }
  document.body.appendChild(script);

  // Create and draw the form here
  // function onSubmit(){
  // 	window.alert("sometext");
  // }

  function doThis() {
    $("body").append("<form><input type=\"text\" name=\"url\"><input type=\"text\" name=\"title\"></form>");
  }

  
  doThis();


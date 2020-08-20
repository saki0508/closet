window.addEventListener('load', function(){
  document.addEventListener("turbolinks:load"
  , function () {
  var button = document.getElementById("text-button")
  button.onclick = function() {
    
    var request = new XMLHttpRequest();
   var API_KEY = process.env.OPEN_WEATHER_MAP_API
   request.open("GET", "http://api.openweathermap.org/data/2.5/weather?id=1850147&lang=ja&units=metric&APPID="+API_KEY, true);
    request.responseType = 'json'
    request.send();

   request.onload = function (){
  
   var data = this.response;

   var img = document.createElement('img');

   img.src = "http://openweathermap.org/img/w/"+data.weather[0].icon+".png";

   img.alt = data.weather[0].main;

   var temperature = Math.floor(data.main.temp) ;

   var weather = data.weather[0].description;


   document.getElementById('weather').innerHTML = weather;

   document.getElementById('icon').appendChild(img);

   document.getElementById('temp').innerHTML = "気温："+ temperature + "℃";


   }
  };
 })

})

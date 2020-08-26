
window.addEventListener('load', function(){

  document.addEventListener("turbolinks:load", function () {
    var input = document.getElementById("input_city")
    var button = document.getElementById("input_button")

    button.onclick = function() {
      var city = input.value;
      var request = new XMLHttpRequest();
      var API_KEY = process.env.OPEN_WEATHER_MAP_API
      request.open("GET", "http://api.openweathermap.org/data/2.5/weather?q="+city+"&lang=ja&units=metric&APPID="+API_KEY, true);
      request.responseType = 'json'
      request.send();

      request.onload = function (){
        if (request.status != 200) {
          alert(`Error ${request.status}: ${request.statusText}`);
          return null;
        }
        var data = this.response;
        var img = document.createElement('img');
        img.src = "http://openweathermap.org/img/w/"+data.weather[0].icon+".png";
        img.alt = data.weather[0].main;
        var temperature = Math.floor(data.main.temp) ;
        var weather = data.weather[0].description;

        document.getElementById('weather').innerHTML = weather
        document.getElementById('icon').appendChild(img);
        document.getElementById('temp').innerHTML =  temperature;
      }
    }
  })
})
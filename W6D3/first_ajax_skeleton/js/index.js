console.log("Hello from the JavaScript console!");

// Your AJAX request here
$.ajax({
  type: 'GET',
  url: "http://api.openweathermap.org/data/2.5/weather?q=NY,NY&appid=2f3067e032951e61cd199da1657832b2",
  success(data) {
    console.log(data);
  },
  error() {
    console.error("Error occured.");
  },
});
// Add another console log here, outside your AJAX request
console.log('Weather request complete.');

document.addEventListener('turbolinks:load', () => {
  const timerDiv = document.querySelector('#countdown');
  if (timerDiv) {
    const finishTime = timerDiv.dataset.finishTime;
    const interval = setInterval(function() {
      var currentTime = new Date().getTime()
      var distance = finishTime - currentTime

      var days = Math.floor(distance / (1000 * 60 * 60 * 24));
      var hours = Math.floor((distance % (1000 * 60 * 60 * 24)) / (1000 * 60 * 60));
      var minutes = Math.floor((distance % (1000 * 60 * 60)) / (1000 * 60));
      var seconds = Math.floor((distance % (1000 * 60)) / 1000);
      document.getElementById("countdown").innerHTML = days + "d " + hours + "h "
          + minutes + "m " + seconds + "s ";

      if (distance < 0) {
        clearInterval(interval);
        document.getElementById("countdown").innerHTML = "¯\\\_(ツ)_/¯";
        document.getElementById("submit-with-timer").click()
      }

    }, 1000);
  }
});

document.addEventListener("turbolinks:load", function() {

  let countdown;
  const timerDisplay = document.querySelector('.display__time-left');
  const button = document.getElementById('timer_start_button');

  function timer(seconds) {
    clearInterval(countdown);
    const now = Date.now();
    const then = now + seconds * 1000;
    displayTimeLeft(seconds);

    countdown = setInterval(() => {
      const secondsLeft = Math.round((then - Date.now()) / 1000);
      if(secondsLeft < 0) {
        clearInterval(countdown);
        alert("Time's Up!");
        return;
      }
      displayTimeLeft(secondsLeft);
    }, 1000);
  }

  function displayTimeLeft(seconds){
  const minutes = Math.floor(seconds/60);
  const remainderSeconds = seconds % 60;
  const display = `${minutes}:${remainderSeconds < 10 ? '0' : '' }${remainderSeconds}`;``
  document.title = display;
  timerDisplay.textContent = display;
  }

  function startTimer() {
  const seconds = parseInt(this.dataset.time);
  timer(seconds);
  }

  button.addEventListener('click', startTimer);

});

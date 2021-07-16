export class Timer {
  constructor(time_limit, time_now, time_start) {
    this.end_time = parseInt(time_start, 10) + parseInt(time_limit, 10)
    this.time_now = parseInt(time_now, 10)
    this.time_left = this.end_time - this.time_now
  }

  set_timer() {
    if (this.end_time > this.time_now) {
      setTimeout(this.expire_by_end_of_time, this.time_left);
    } else {
      this.expire_by_end_of_time()
    }
    setInterval(this.clock_tick.bind(this), 1000)
  }

  clock_tick() {
    const clock = document.querySelector('.time-left')

    if (clock) {
      this.time_left = this.time_left - 1000
      const time = [Math.floor(this.time_left / 3600000),
                    Math.floor(this.time_left / 60000),
                    Math.floor(this.time_left / 1000)]
      time.forEach((item, i) => {
        if (item < 10) {
          time[i] = "0" + item
        }
      })

      clock.textContent = time[0] + ":" + time[1] + ":" + time[2]
    }
  }

  expire_by_end_of_time() {
    if (location.href.search('test_passage')) {
      location.replace(location.href + '/interrupt')
    }
  }
}

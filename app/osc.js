(function() {
  'use strict';

  var NotesArray = function (config) {
    config = config || {};
    
    this.onTick = config.onTick || {};
    this.level = config.level || 5;

    this.context = new AudioContext();
    this.oscillator = this.context.createOscillator();
    this.oscillator.type = config.type || 'square';

    this.oscillator.connect(this.context.destination);

    this.inner = [10, 10, 10, 10, 10, 10,
                  10, 10, 10, 10, 10, 10,
                  10, 10, 10, 10, 10, 10,
                  10, 10, 10, 10, 10, 10,
                  10, 10, 10, 10, 10, 10, 10];
    this.oscillator.frequency.value = this.inner[0] * this.level;
    this.current = 0;
  };

  NotesArray.prototype.init = function () {
    setInterval(function () {
      if (this.current === this.inner.length) {
        this.current = 0;
      }
      this.oscillator.frequency.value = this.inner[this.current] * this.level;
      this.onTick();
      this.current += 1;
    }.bind(this), 100);
    this.oscillator.start(0);
  };
  module.exports = {'NotesArray': NotesArray};
}());

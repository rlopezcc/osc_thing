<app>
  <style>
    * * {
      box-sizing: border-box;
    }
    html {
      background-color: black;
    }

    html, body {
      margin: 0;
      padding: 0;
    }

    app {
      display: flex;
      flex-direction: column;
      justify-content: center;
      align-items: center;
      margin-top: 100px;
      width: 100%;
    }
  </style>
  <sliders></sliders>
  <sliders></sliders>
  <script>
  </script>
</app>

<sliders>
   <style>
     sliders {
       align-items: center;
       background-color: #333;
       display: flex;
       height: 300px;
       justify-content: center;
       padding: 0 3%;
       width: 90%;
     }
   </style>
  <slider each={value, index in this.notesArray.inner}></slider>
  <script>
      var osc = require('./osc');
      this.notesArray = new osc.NotesArray(
        {type: 'triangle', 
         level: 4});
      this.notesArray.onTick = this.update;
      this.notesArray.init();
  </script>
</sliders>

<slider onclick={updateOsc} onmousemove={updateOsc} class={'active': index === this.parent.notesArray.current}>
    <style>
      slider {
        box-shadow: 1px 0 0 1px #222;
        background-color: #ddd;
        height: 90%;
        margin-right: 15px;
        position: relative;
        width: 100%;
      }
  
      slider.active:after {
        background-color: white;
        bottom: -2px;
        box-shadow: 0 0 10px 1px white;
        content: ' ';
        display: block;
        height: 2px;
        position: absolute;
        width: 100%;
        z-index: 0;
      }
  
      slider div {
        background: orange;
        bottom: 0;
        height: calc(90% - 20px);
        position: absolute;
        width: 100%;
        z-index: 3;
      }
    </style>
    <div style="height:{value}%" item="{index}"></div>
    <script>
      this.updateOsc = function(ev) {
        var elementHeight = this.root.clientHeight;
        var y = ev.pageY - this.root.offsetTop;
        this.parent.notesArray.inner[this.index] = Math.ceil(100 - y*100/elementHeight);
      };
    </script>
</slider>

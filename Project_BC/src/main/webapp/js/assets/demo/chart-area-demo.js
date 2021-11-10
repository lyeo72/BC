// Set new default font family and font color to mimic Bootstrap's default styling
//CHART.DEFAULTS.GLOBAL.DEFAULTFONTFAMILY = '-APPLE-SYSTEM,SYSTEM-UI,BLINKMACSYSTEMFONT,"SEGOE UI",ROBOTO,"HELVETICA NEUE",ARIAL,SANS-SERIF';
//CHART.DEFAULTS.GLOBAL.DEFAULTFONTCOLOR = '#292B2C';

// Area Chart Example

//$(documemt).ready(function(){
//    
//    ajax({
//        url : 'chart.ad',
//        type : 'Post',
//        dataType : 'json',
//        su
//        
//        
//    });
//    
//});


var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  data: {
    labels: ["Mar 1", "Mar 2", "Mar 3", "Mar 4", "Mar 5", "Mar 6", "Mar 7", "Mar 8", "Mar 9", "Mar 10", "Mar 11", "Mar 12", "Mar 13"],
    datasets: [{
      label: "Sessions",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [10000, 10000, 30000, 40000, 60000, 50000, 30000, 10000, 10000, 10000, 10000, 10000, 10000],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 7
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 100000,
          maxTicksLimit: 10
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
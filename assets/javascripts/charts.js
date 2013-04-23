google.load("visualization", "1", {packages:["corechart"]});
      // google.setOnLoadCallback(drawChart);
window.drawChart = function(json) {
  json.unshift(['date', 'closed', 'open'])
  var data = google.visualization.arrayToDataTable(json)
  var chart = new google.visualization.LineChart(document.getElementById('chart'));
  chart.draw(data, {});
}
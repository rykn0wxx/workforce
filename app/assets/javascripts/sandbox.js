// // Place all the behaviors and hooks related to the matching controller here.
// // All this logic will automatically be available in application.js.
//
// window
// <%= javascript_tag do %>
//   window.jQuery(function () {

//   });
// <% end %>
$(function () {
  Highcharts.chart('dchart', {
    chart: {
      type: 'column'
    },
    title: {
      text: null
    },
    subtitle: {
      text: 'Sub title'
    },
    xAxis: {
      type: 'category'
    },
    yAxis: {
      min: 0
    },
    series: [{
      name: 'Sample',
      data: [
        ['Shanghai', 23.7],
        ['Lagos', 16.1],
         ['Karachi', 14.0]
      ]
    }]
  });  
});

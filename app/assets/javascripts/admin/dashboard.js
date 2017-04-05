// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
  var ready;

  executeScript = function() {
    if($(".dashboard.index").length > 0) {
      var pollsID = $('#poll-list').data('poll-ids').toString().split(',');
      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});
      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawCharts);

      function drawCharts() {
        pollsID.forEach(function(pollID) {
          console.log(pollID);
          drawChart(pollID);
        });
      }

      function drawChart(pollID) {
        var $pollResults = $(`#poll-results-${pollID}`);
        var yesCount = $pollResults.data('yes');
        var noCount = $pollResults.data('no');

        // Create the data table.
        var data = new google.visualization.arrayToDataTable([
          ['Vote', 'Yes', 'No'],
          ['', yesCount, noCount],
        ]);

        // Set chart options
        var options = {
          hAxis: {
            minValue: 4,
            format: '#',
          },
          vAxis: {
            title: 'Votes',
            titleTextStyle: {
              fontSize: 14,
              bold: true,
              color: '#317EAC'
            }
          }
        };

        // Instantiate and draw our chart, passing in some options.
        if(yesCount || noCount || abstainCount) {
          var chart = new google.visualization.BarChart(document.getElementById(`poll-results-${ pollID }`));
          chart.draw(data, options);
        } else {
          $pollResults.append('<div>There are no votes at this time.</div>');
        }
      }

      // // Event handlers for the page
      // $(`#poll-item-${pollID}`).hover(function() {
      //   $(this).append(`<a href='/admin/delete_poll/${pollID}' data-confirm='Are you sure you want to delete this post?' data-method='delete' rel='nofollow' data-remote='true'><i class='fa fa-trash' aria-hidden='true'></i></a>`);
      //   }, function() {
      //     $(this).find("a:last").remove();
      // });
    }
  }

$(document).ready(executeScript);


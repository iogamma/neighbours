// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
// You can use CoffeeScript in this file: http://coffeescript.org/
  var ready;

  executeScript = function() {
    if($(".dashboard.index").length > 0) {
      var pollsID = $('#poll-list').data('poll-ids').toString().split(',');

      function drawCharts() {
        pollsID.forEach(function(pollID) {
          drawChart(pollID);
        });
      }

      // Load the Visualization API and the corechart package.
      google.charts.load('current', {'packages':['corechart']});
      // Set a callback to run when the Google Visualization API is loaded.
      google.charts.setOnLoadCallback(drawCharts);
      // Callback that creates and populates a data table,
      // instantiates the pie chart, passes in the data and
      // draws it.
      function drawChart(pollID) {
        var $pollItem = $(`#poll-item-${pollID}`);
        var yesCount = $pollItem.data('yes');
        var noCount = $pollItem.data('no');
        var abstainCount = $pollItem.data("abstain");

        // Create the data table.
        var data = new google.visualization.DataTable();
        data.addColumn('string', 'Vote');
        data.addColumn('number', 'Count');
        data.addRows([
          ['Yes', yesCount],
          ['No', noCount],
          ['Abstiain', abstainCount]
        ]);

        // Set chart options
        var options = {'width':400,
                       'height':300};

        // Instantiate and draw our chart, passing in some options.
        if(yesCount || noCount || abstainCount) {
          var chart = new google.visualization.PieChart(document.getElementById(`poll-item-${ pollID }`));
          chart.draw(data, options);
        } else {
          $pollItem.append('<div>There are no votes at this time.</div>');
        }

        // Event handlers for the page
        $(`#poll-item-${pollID}`).hover(function() {
          $(this).append(`<a href='/admin/delete_poll/${pollID}' data-confirm='Are you sure you want to delete this post?' data-method='delete' rel='nofollow' data-remote='true'><i class='fa fa-trash' aria-hidden='true'></i></a>`);
          }, function() {
            $(this).find("a:last").remove();
        });
      }
    }
  }

$(document).ready(executeScript);


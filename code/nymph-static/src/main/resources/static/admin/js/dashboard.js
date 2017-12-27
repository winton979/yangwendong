jQuery(document).ready(function(){
    
    "use strict";

    function showTooltip(x, y, contents) {
	jQuery('<div id="tooltip" class="tooltipflot">' + contents + '</div>').css( {
	    position: 'absolute',
	    display: 'none',
	    top: y + 5,
	    left: x + 5
	}).appendTo("body").fadeIn(200);
    }
    
    /*****SIMPLE CHART*****/
    
    
    
    
    /*****CHART 2 *****/
    
   
	
    
    
    /*****CHART 3 *****/
    
    /***** BAR CHART *****/
 
  var bardatass = [ [20, 10],[21, 23], [22, 23], [23, 18],[24, 21], [25, 18],[26, 16], [27, 23], [28, 28],[29, 30], [30, 18]];
    
    	 jQuery.plot("#barchart", [ bardatass ], {
    		  series: {
            lines: {
              lineWidth: 1  
            },
    				bars: {
    					show: true,
    					barWidth: 0.5,
    					align: "center",
               lineWidth: 0,
               fillColor: "#428BCA"
    				}
    		  },
        grid: {
            borderColor: '#ddd',
            borderWidth: 1,
            labelMargin: 10
    		  },
    		  xaxis: {
    				mode: "categories",
    				tickLength: 0
    		  }
    	 });





    /***** BAR CHART *****/
    

    
	    var mm5 = new Morris.Donut({
        element: 'donut-chart',
        data: [
          {label: "入园人数", value: 12},
          {label: "请假人数", value: 30}
        ]
    });

    var delay = (function() {
	var timer = 0;
	return function(callback, ms) {
	    clearTimeout(timer);
	    timer = setTimeout(callback, ms);
	};
    })();

    jQuery(window).resize(function() {
	delay(function() {
	  
		mm5.redraw();
	}, 200);
    }).trigger('resize');
    
    
   
    
});
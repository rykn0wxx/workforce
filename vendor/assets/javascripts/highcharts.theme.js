(function(factory) {
  if (typeof module === 'object' && module.exports) {
    module.exports = factory;
  } else {
    factory(Highcharts);
  }
}(function (Highcharts) {

  (function (Highcharts) {
    'use strict';

    Highcharts.SparkLine = function (a, b, c) {
    	var hasRenderToArg = typeof a === 'string' || a.nodeName;
    	var options = arguments[hasRenderToArg ? 1 : 0];
    	var defaultOptions = {
  			chart: {
  				renderTo: (options.chart && options.chart.renderTo) || this,
  				backgroundColor: null,
  				borderWidth: 0,
  				type: 'area',
  				margin: [2, 0, 2, 0],
  				width: 120,
  				height: 20,
  				style: {
  					overflow: 'visible'
  				},

  				// small optimalization, saves 1-2 ms each sparkline
  				skipClone: true
  			},
  			title: {
  				text: ''
  			},
  			credits: {
  				enabled: false
  			},
  			xAxis: {
  				labels: {
  					enabled: false
  				},
  				title: {
  					text: null
  				},
  				startOnTick: false,
  				endOnTick: false,
  				tickPositions: []
  			},
  			yAxis: {
  				endOnTick: false,
  				startOnTick: false,
  				labels: {
  					enabled: false
  				},
  				title: {
  					text: null
  				},
  				tickPositions: [0]
  			},
  			legend: {
  				enabled: false
  			},
  			tooltip: {
  				backgroundColor: null,
  				borderWidth: 0,
  				shadow: false,
  				useHTML: true,
  				hideDelay: 0,
  				shared: true,
  				padding: 0,
  				positioner: function (w, h, point) {
  					return {
  						x: point.plotX - w / 2,
  						y: point.plotY - h
  					};
  				}
  			},
  			plotOptions: {
  				series: {
  					animation: false,
  					lineWidth: 1,
  					shadow: false,
  					states: {
  						hover: {
  							lineWidth: 1
  						}
  					},
  					marker: {
  						radius: 1,
  						states: {
  							hover: {
  								radius: 2
  							}
  						}
  					},
  					fillOpacity: 0.25
  				},
  				column: {
  					negativeColor: '#910000',
  					borderColor: 'silver'
  				}
  			}
  		};

    	options = Highcharts.merge(defaultOptions, options);

    	return hasRenderToArg ?
    		new Highcharts.Chart(a, options, c) :
    		new Highcharts.Chart(options, b);
    };

    Highcharts.theme = {
			chart: {
				backgroundColor: {
					linearGradient: { x1: 0, y1: 0, x2: 1, y2: 1 },
					stops: [
						[0, '#313035'],
						[1, '#515054']
					]
				},
				style: {
					fontFamily: 'Roboto',
					fontSize: '12px'
				}
			},
			lang: {
				contextButtonTitle: 'ACA context menu',
				decimalPoint: '.',
				downloadJPEG: 'Export as JPG',
				downloadPDF: 'Export as PDF',
				downloadSVG: 'Export as SVG',
				drillUpText: 'Back to {series.name}',
				loading: 'This will be awesome...',
				months: ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December'],
				noData: 'No data to display',
				numericSymbols: ['k', 'M', 'G', 'T', 'P', 'E'],
				printChart: 'Export Chart',
				resetZoom: 'Reset zoom',
				resetZoomTitle: 'Reset zoom level 1:1',
				shortMonths: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
				thousandsSep: ',',
				weekdays: ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
			},
			credits: {
				enabled: true,
				href: 'mailto:ariel.andrade@stefanini.com?subject=Stefanini Dashboard Query',
				text: 'Created by ACAndrade',
				style: {
					fontSize: '10px',
					fontFamily: 'Roboto, sans-serif',
					color: 'rgba(255,255,255,0.2)'
				}
			},
			title: {
				style: {
					fontFamily: 'Roboto, sans-serif',
					color: 'rgba(255,255,255,0.8)',
					textTransform: 'uppercase',
					fontSize: '16px',
					fontWeight: 'medium'
				}
			},
			subtitle: {
				style: {
					textTransform: 'uppercase',
					fontSize: '14px',
					fontFamily: 'Roboto, sans-serif',
					fontStyle: 'italic',
					color: 'rgba(255,255,255,0.6)'
				}
			},
			legend: {
				itemStyle: {
					color: 'rgba(0,0,0,0.7)',
					fontWeight: 300
				},
				itemHiddenStyle: {
					color: 'rgba(255,255,255,0.1)'
				},
				itemHoverStyle: {
					color: 'rgba(0,0,0,0.9)'
				},
			},
			plotOptions: {
				bar: {
					borderWidth: 1,
					borderColor: 'rgba(0,0,0,0.1)'
				},
				series: {
					borderWidth: 1,
					borderColor: 'rgba(0,0,0,0.1)',
					groupPadding: 0.01,
					dataLabels: {
						style: {
							backgroundColor: 'rgba(0,0,0,0.4)',
							color: 'rgba(255,255,255,0.7)'
						}
					}
				},
				column: {
					groupPadding: 0.1,
					pointPadding: 0.05,
					borderWidth: 0,
					borderColor: 'rgba(0,0,0,0.1)',
					borderRadius: 1,
					states: {
						hover: {
							enabled: true
						}
					},
					dataLabels: {
						style: {
							backgroundColor: 'rgba(0,0,0,0.4)',
							color: 'rgb(255,0,0)'
						}
					}
				},
				spline: {
					lineWidth: 2,
					marker: {
						lineWidth: 2,
						fillColor: '#fff',
						lineColor: '#484343',
						symbol: 'circle'
					},
					dataLabels: {
						style: {
							color: '#808080',
							fontWeight: 'regular',
							fontSize: '10px',
							fontFamily: 'Roboto, sans-serif',
						}
					}
				},
				line: {
					lineWidth: 1
				}
			},
			tooltip: {
        formatter: function() {
          return Highcharts.dateFormat("%B %e, %Y", this.x) + ': ' +
            Highcharts.numberFormat(this.y, 2);
        },
        useHTML: true,
				backgroundColor: 'rgba(0, 0, 0, 0.5)',
				style: {
					fontSize: '11px',
					color: '#F0F0F0'
				}
			},
			labels: {
				style: {
					color: '#707073'
				}
			},
			yAxis: {
				gridLineColor: 'rgba(0,0,0,0.1)',
				labels: {
					style: {
						color: 'rgba(255,255,255,0.4)'
					}
				},
				lineColor: 'rgba(0,0,0,0.1)',
				lineWidth: 0,
				tickColor: 'rgba(0,0,0,0.4)',
				title: {
					style: {
						color: 'rgba(255,255,255,0.5)'
					},
					text: null
				}
			},
			xAxis: {
				gridLineColor: '#707073',
				labels: {
					style: {
						color: 'rgba(255,255,255,0.4)',
						fontSize: '10px'
					}
				},
				lineColor: 'rgba(0,0,0,0.1)',
				lineWidth: 0,
				tickColor: 'rgba(0,0,0,0.4)',
				title: {
					style: {
						color: 'rgba(255,255,255,0.5)'
					}
				}
			},
			exporting: {
				buttons: {
					contextButton: {
						menuItems: [{
							text: 'Export to PNG (small)',
							onclick: function() {
								this.exportChart({
									width: 250
								});
							}
						}, {
							text: 'Export to PNG (large)',
							onclick: function() {
								this.exportChart();
							},
							separator: false
						}, {
							text: 'Export as SVG',
							onclick: function() {
								this.exportChartLocal({
									type: 'image/svg+xml'
								});
							},
							separator: false
						}]
					}
				}
			},
			drilldown: {
				activeAxisLabelStyle: {
					color: '#F0F0F3'
				},
				activeDataLabelStyle: {
					color: '#F0F0F3'
				}
			},
			navigation: {
				buttonOptions: {
					symbolStroke: '#DDDDDD',
					theme: {
						fill: '#505053'
					}
				}
			},
			rangeSelector: {
				buttonTheme: {
					fill: '#505053',
					stroke: '#000000',
					style: {
						color: '#CCC'
					},
					states: {
						hover: {
							fill: '#707073',
							stroke: '#000000',
							style: {
								color: 'white'
							}
						},
						select: {
							fill: '#000003',
							stroke: '#000000',
							style: {
								color: 'white'
							}
						}
					}
				},
				inputBoxBorderColor: '#505053',
				inputStyle: {
					backgroundColor: '#333',
					color: 'silver'
				},
				labelStyle: {
					color: 'silver'
				}
			},
			navigator: {
				handles: {
					backgroundColor: '#666',
					borderColor: '#AAA'
				},
				outlineColor: '#CCC',
				maskFill: 'rgba(255,255,255,0.1)',
				series: {
					color: '#7798BF',
					lineColor: '#A6C7ED'
				},
				xAxis: {
					gridLineColor: '#505053'
				}
			},
			scrollbar: {
				barBackgroundColor: '#808083',
				barBorderColor: '#808083',
				buttonArrowColor: '#CCC',
				buttonBackgroundColor: '#606063',
				buttonBorderColor: '#606063',
				rifleColor: '#FFF',
				trackBackgroundColor: '#404043',
				trackBorderColor: '#404043'
			},
			legendBackgroundColor: 'rgba(0, 0, 0, 0.5)',
			background2: '#505053',
			dataLabelsColor: '#B0B0B3',
			textColor: '#C0C0C0',
			contrastTextColor: '#F0F0F3',
			maskColor: 'rgba(255,255,255,0.3)',
			colors: ['#5DA3E7', '#686868', '#75E95D', '#F9953A', '#7077FF', '#F15A60', '#E4D354', '#B8D2EC', '#D98880', '#87CEFA', '#CCCCCC', '#E7B2D4']
		};

    Highcharts.setOptions(Highcharts.theme);

  }(Highcharts));

}));

(function() {
  'use strict';

  angular
    .module('mud', [
      'ngAnimate',
			'ngAria',
			'ngMessages',
			'ngMaterial',
			'ui.router',
			'templates'
    ])
    .config(['$mdThemingProvider', '$sceDelegateProvider', function (mdTheme, sceDel) {

			mdTheme.theme('default')
				.primaryPalette('indigo')
				.accentPalette('pink')
				.warnPalette('deep-orange')
				.dark();
			sceDel.resourceUrlWhitelist([
				'self', '**'
			]);

		}]);

})();

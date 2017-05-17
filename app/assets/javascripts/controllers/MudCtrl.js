angular
  .module('mud')
  .controller('MudCtrl', ['$scope', '$location', '$rootScope', function ($scope, $loc, $rootS) {
    var me = this;
    this.$scope = $scope;
    this.$loc = $loc;

    $scope.tasklist = [
      'Cras dapibus leo at libero cursus rutrum.',
      'Vivamus rutrum enim in rutrum iaculis.',
      'In quis arcu dapibus, sollicitudin dui eget, varius mi.',
      'Aenean in leo in neque suscipit vehicula at et lectus.',
      'Sed scelerisque neque placerat semper pellentesque.',
      'Sed tristique leo id elit convallis, nec condimentum turpis congue.'
    ];
  }]);

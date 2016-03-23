/**
 * app modules
 */
var app = angular.module('eCommerceApp', [
    'ngRoute',
    'appComponents',
    'appConstants',
]);
var appComponents = angular.module('appComponents', []);
var appConstants = angular.module('appConstants', []);


/**
 * app headers config
 */
app.config(function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content;
});


angular.module('appConstants', []).constant('constants', {
    categories: '/categories'
});


/**
 * app routes
 */
app.config(function ($routeProvider, $locationProvider, constants) {
    console.log($routeProvider)
    $routeProvider
        .when('/', {
            controller: 'CategoriesIndexController',
            templateUrl: 'components/index.html'
        })
        .when(constants.categories + '/:chapterId', {
            templateUrl: 'chapter.html',
            controller: 'ChapterController'
        });
    $locationProvider.html5Mode(false);
});

appComponents.controller('CategoriesIndexController', function ($scope, $routeParams) {
    $scope.name = "BookController";
    $scope.params = $routeParams;
});

appComponents.controller('MainController', function ($scope, $routeParams) {
    console.log(44444444)
    console.log($routeParams)
});

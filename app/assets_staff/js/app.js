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


app.run(function ($templateCache) {
    $templateCache.put('templateId.html', 'This is the content of the template');
});
/**
 * app routes
 */
app.config(['$routeProvider', '$locationProvider', 'constants', '$templateCache', function ($routeProvider, $locationProvider, constants, $templateCache) {
    console.log($routeProvider)
    $routeProvider
        .when('/', {
            controller: 'CategoriesIndexController',
            templateUrl: $templateCache.get('templateId.html'),
        })
        .when(constants.categories + '/:chapterId', {
            templateUrl: 'chapter.html',
            controller: 'ChapterController'
        });
    $locationProvider.html5Mode(false);
}]);

appComponents.controller('CategoriesIndexController', function ($scope, $routeParams) {
    $scope.name = "BookController";
    $scope.params = $routeParams;
});

appComponents.controller('MainController', function ($scope, $routeParams) {
    console.log(44444444)
    console.log($routeParams)
});

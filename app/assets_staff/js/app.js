/**
 * app modules
 */
var app = angular.module('eCommerceApp', [
    'ngRoute',
    'appComponents',
    'appConstants',
    'templates',
    'ui.bootstrap',
    'ui.codemirror'
]);
angular.module('templates', []);
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
//app.config(function ($routeProvider, $locationProvider, constants) {
//    $locationProvider.html5Mode(true);
//    $routeProvider
//        .when(constants.categories, {
//            controller: 'CategoriesIndexController',
//            templateUrl: 'index.html'
//        })
//        .when(constants.categories + '/:chapterId', {
//            templateUrl: 'chapter.html',
//            controller: 'ChapterController'
//        });
//});


appComponents.controller('MainController', function ($scope, $routeParams) {

});

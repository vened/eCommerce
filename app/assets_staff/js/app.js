/**
 * app modules
 */
var app = angular.module('eCommerceApp', [
    'ngRoute',
    'appComponents',
    'appConstants',
    'templates',
    'ui.bootstrap',
    'ui.codemirror',
    'ngMaterial'
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

/**
 * app modules
 */
var app = angular.module('eCommerceApp', [
    'appComponents',
    'templates',
    'ui.bootstrap',
    'ui.codemirror',
    'ngMaterial',
    'angularFileUpload'
]);
angular.module('templates', []);
var appComponents = angular.module('appComponents', []);

/**
 * app headers config
 */
app.config(function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content;
});

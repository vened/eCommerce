/**
 * app modules
 */
var app = angular.module('eCommerceApp', [
    'ui.bootstrap'
]);
/**
 * app headers config
 */
app.config(function ($httpProvider) {
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').content;
});

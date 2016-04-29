appComponents.controller('UploaderController', function ($scope, FileUploader, $http) {

    $scope.productId = null;


    var uploader = $scope.uploader = new FileUploader();

    // console.log(Routes.staff_api_v1_product_photo_products_path(1))

    // $http.get(Routes.staff_api_v1_product_photo_products_path($scope.productId));

    $scope.startUpload = function () {
        $scope.uploader.url = Routes.staff_api_v1_product_photo_products_path($scope.productId);
        console.log($scope.uploader)
        setTimeout(function () {
            console.log($scope.uploader)
            $scope.uploader.uploadAll();
        }, 10);
    }

    // CALLBACKS

    uploader.onWhenAddingFileFailed = function (item /*{File|FileLikeObject}*/, filter, options) {
        // console.info('onWhenAddingFileFailed', item, filter, options);
    };
    uploader.onAfterAddingFile = function (fileItem) {
        // console.info('onAfterAddingFile', fileItem);
    };
    uploader.onAfterAddingAll = function (addedFileItems) {
        // console.info('onAfterAddingAll', addedFileItems);
    };
    uploader.onBeforeUploadItem = function (item) {
        // console.info('onBeforeUploadItem', item);
    };
    uploader.onProgressItem = function (fileItem, progress) {
        // console.info('onProgressItem', fileItem, progress);
    };
    uploader.onProgressAll = function (progress) {
        // console.info('onProgressAll', progress);
    };
    uploader.onSuccessItem = function (fileItem, response, status, headers) {
        // console.info('onSuccessItem', fileItem, response, status, headers);
    };
    uploader.onErrorItem = function (fileItem, response, status, headers) {
        // console.info('onErrorItem', fileItem, response, status, headers);
    };
    uploader.onCancelItem = function (fileItem, response, status, headers) {
        // console.info('onCancelItem', fileItem, response, status, headers);
    };
    uploader.onCompleteItem = function (fileItem, response, status, headers) {
        // console.info('onCompleteItem', fileItem, response, status, headers);
    };
    uploader.onCompleteAll = function () {
        // console.info('onCompleteAll');
    };

    // console.info('uploader', uploader);


});

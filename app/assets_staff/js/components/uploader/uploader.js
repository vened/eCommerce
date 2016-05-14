appComponents.directive('productPhotoUploader', function (FileUploader, $templateCache, $http) {
    return {
        restrict: 'E',
        template: $templateCache.get('uploader/photoUploader.html'),
        scope: {
            productId: '=',
            photos: '='
        },
        controller: function ($rootScope, $scope) {


            $scope.selectFile = function () {
                $("#file").click();
            }

            var uploader = $scope.uploader = new FileUploader({
                url: Routes.staff_api_v1_product_photo_products_path($scope.productId),
                alias: 'attach',
                autoUpload: true
            });

            // FILTERS
            uploader.filters.push({
                name: 'imageFilter',
                fn: function (item) {
                    var type = '|' + item.type.slice(item.type.lastIndexOf('/') + 1) + '|';
                    return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
                }
            });


            uploader.onCompleteItem = function (item, response) {
                item.remove();
                $scope.photos = response;
            };


            $scope.photoDestroy = function (photo_id) {
                $http.delete(Routes.staff_api_v1_product_photo_product_path($scope.productId, photo_id))
                    .then(function (res) {
                        $scope.photos = res.data;
                    })
            }


        }
    }
});

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
    uploader.onCompleteAll = function (resp) {
        // console.info('onCompleteAll');
    };

    // console.info('uploader', uploader);


});

/**
 appServices.service('UploadedPhotosService', function ($http) {

    this.find = function (resource_name, resource_id) {
        return $http.get("/staff/api/" + resource_name + "/" + resource_id + "/photos");
    }

    this.edit = function (obj) {
        return $http.put("/admin/photos/edit/" + obj.id, obj);
    }

    this.destroy = function (resource_name, resource_id, photo_id) {
        return $http.delete("/staff/api/" + resource_name + "/" + resource_id + "/photos/" + photo_id);
    }

});
 */

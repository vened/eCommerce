appComponents.directive('uploaderComponent', function (FileUploader, $templateCache) {
    return {
        restrict: 'E',
        template: $templateCache.get('uploader/uploaderComponent.html'),
        scope: {
            uploadUrl: '@uploadUrl'
        },
        controller: function ($rootScope, $scope) {

            var uploader = $scope.uploader = new FileUploader({
                url: $scope.uploadUrl,
                alias: 'file',
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
                $rootScope.$broadcast('onCompleteItemUpload', response.photos);
            };

        }
    }
});

appComponents.directive('photosUpload', function ($templateCache) {
    return {
        restrict: 'E',
        template: $templateCache.get('uploader/photosUploaded.html'),
        scope: {
            photos: '=',
            showForm: '@'
        },
        controller: function ($rootScope, $scope) {
            $scope.showForm = false;

            console.log($scope.photos);

            $scope.findPhoto = function () {
                // UploadedPhotosService.find($scope.resourceName, $scope.resourceId)
                //     .success(function (val) {
                //         $scope.photos = val;
                //     })
            }
            $scope.findPhoto();


            $scope.photoDestroy = function (resourceName, resourceId, photo_id) {
                // UploadedPhotosService.destroy(resourceName, resourceId, photo_id).success(function (val) {
                //     $scope.findPhoto();
                // })
            }


            $scope.saveDataPhoto = true;
            $scope.submit = function (photo) {
                $scope.saveDataPhoto = false;
                photo.photo = null;
                // UploadedPhotosService.edit(photo).success(function (data) {
                //     $scope.saveDataPhoto = true;
                // })
            }


            $rootScope.$on('onCompleteItemUpload', function ($e) {
            });

        }
    }
});

appDirectives.directive('uploaderThumb', function ($window) {
    var helper = {
        support: !!($window.FileReader && $window.CanvasRenderingContext2D),
        isFile: function (item) {
            return angular.isObject(item) && item instanceof $window.File;
        },
        isImage: function (file) {
            var type = '|' + file.type.slice(file.type.lastIndexOf('/') + 1) + '|';
            return '|jpg|png|jpeg|bmp|gif|'.indexOf(type) !== -1;
        }
    };
    return {
        restrict: 'A',
        template: '<canvas/>',
        link: function (scope, element, attributes) {
            if (!helper.support) {
                return;
            }
            var params = scope.$eval(attributes.uploaderThumb);
            if (!helper.isFile(params.file)) {
                return;
            }
            if (!helper.isImage(params.file)) {
                return;
            }
            var canvas = element.find('canvas');
            var reader = new FileReader();
            reader.onload = onLoadFile;
            reader.readAsDataURL(params.file);
            function onLoadFile (event) {
                var img = new Image();
                img.onload = onLoadImage;
                img.src = event.target.result;
            }

            function onLoadImage () {
                var width = params.width || this.width / this.height * params.height;
                var height = params.height || this.height / this.width * params.width;
                canvas.attr({ width: width, height: height });
                canvas[0].getContext('2d').drawImage(this, 0, 0, width, height);
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

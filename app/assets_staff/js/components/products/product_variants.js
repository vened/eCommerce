appComponents.controller('ProductVariantsController', function ($rootScope, $scope, $mdToast, ProductVariants) {

    // $scope.setProductId = function (product_id) {
    //     $scope.product_id = product_id;
    // }

    $scope.getProductVariants = function (product_id) {
        ProductVariants.index(product_id)
            .then(function (res) {
                if (res.status == 200) {
                    $scope.product_variants = res.data;
                }
            })
    };


    $scope.updateProduct = function (product_id, data) {
        Product.put(product_id, data)
            .then(function (res) {
                if (res.status == 200) {
                    showCustomToast('Продукт ' + product_id + ' обновлен!')
                    $scope['staff_product_hit_' + product_id] = res.data.hit;
                }
            })
    }

    function showCustomToast(text) {
        var toast = $mdToast.simple()
            .textContent(text)
            .action('Закрыть')
            .hideDelay(1500)
            .position('bottom right');
        $mdToast.show(toast);
    };


});


appComponents.service('ProductVariants', function ($http) {
    return {
        index: function (product_id) {
            return $http({
                url: Routes.staff_api_v1_product_product_variants_path(product_id),
                method: "get"
            })
        },
        put: function (id, obj) {
            return $http({
                url: Routes.staff_api_v1_product_path(id),
                method: "put",
                data: obj
            });
        }
    };
});


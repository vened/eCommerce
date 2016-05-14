appComponents.controller('ProductVariantsController', function ($scope, $timeout, ProductVariants) {

    $scope.ProductVariantForm = {
        show: false
    };

    function setProductVariants(res) {
        $timeout(function () {
            $scope.product_variants = res.data.product_variants;
            console.log($scope.product_variants);
        }, 0);
    }

    $scope.getProductVariants = function (product_id) {
        ProductVariants.index(product_id)
            .then(function (res) {
                $scope.product_variants = res.data.product_variants;
            })
    };


    $scope.newProductVariant = function (product_id) {
        $scope.ProductVariantForm = {
            sku: 'sku',
            name: 'name',
            price: 1000,
            old_price: 500,
            product_id: product_id
        }
        ProductVariants.create(product_id, $scope.ProductVariantForm)
            .then(function (res) {
                setProductVariants(res);
            });
    };


    $scope.updateProductVariant = function (data) {
        ProductVariants.update(data.product_id, data.id, data)
            .then(function (res) {
                // setProductVariants(res);
            });
    };


    $scope.destroyProductVariant = function (data) {
        ProductVariants.destroy(data.product_id, data.id)
            .then(function (res) {
                setProductVariants(res);
            })
    }


});


appComponents.service('ProductVariants', function ($http) {
    return {
        index: function (product_id) {
            return $http({
                url: Routes.staff_api_v1_product_product_variants_path(product_id),
                method: "get"
            })
        },
        create: function (product_id, obj) {
            return $http({
                url: Routes.staff_api_v1_product_product_variants_path(product_id),
                method: "post",
                data: obj
            });
        },
        update: function (product_id, id, obj) {
            return $http({
                url: Routes.staff_api_v1_product_product_variant_path(product_id, id),
                method: "put",
                data: obj
            });
        },
        destroy: function (product_id, id) {
            return $http({
                url: Routes.staff_api_v1_product_product_variant_path(product_id, id),
                method: "delete"
            });
        },
    };
});


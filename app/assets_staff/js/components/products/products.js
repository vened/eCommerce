appComponents.controller('ProductsIndexController', function ($scope, Product) {

    $scope.updateProduct = function (product_id, data) {
        Product.put(product_id, data)
            .then(function (res) {
                if (res.status == 200) {
                    $scope['staff_product_hit_' + product_id] = res.data.hit;
                    $scope['staff_product_new_' + product_id] = res.data.new;
                    $scope['staff_product_action_' + product_id] = res.data.action;
                    $scope['staff_product_active_' + product_id] = res.data.active;
                }
            })
    }


});

appComponents.controller('ProductsFormController', function () {

});


appComponents.service('Product', function ($http) {
    return {
        put: function (id, obj) {
            return $http({
                url: Routes.staff_api_v1_product_path(id),
                method: "put",
                data: obj
            });
        }
    };
});


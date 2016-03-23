
var app = angular.module('myGallery', ['jkuri.gallery']);

app.controller('Ctrl', ['$http',function(http) {
	var self = this;
	self.images = [];

    http ({ method: 'GET',
            url: $('#image_gal').data("url")
         }).then(function (response){

        angular.forEach(response.data, function (img, index) {

            self.images.push({thumb: img.thumbnail_url, img: img.url, description: 'Image' + index});

        });
    });

}]);
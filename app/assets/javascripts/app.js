
var app = angular.module('myGallery', ['jkuri.gallery']);

app.controller('Ctrl', [function() {
	var self = this;

	self.images = [
		{thumb: 'images/thumbs/1.jpg', img: 'images/1.jpg', description: 'Image 1'},
		{thumb: 'images/thumbs/2.jpg', img: 'images/2.jpg', description: 'Image 2'},
		{thumb: 'images/thumbs/3.jpg', img: 'images/3.jpg', description: 'Image 3'},
		{thumb: 'images/thumbs/4.jpg', img: 'images/4.jpg', description: 'Image 4'},
		{thumb: 'images/thumbs/5.jpg', img: 'images/5.jpg', description: 'Image 5'},
		{thumb: 'images/thumbs/6.jpg', img: 'images/6.jpg', description: 'Image 6'},
        {thumb: 'images/thumbs/7.jpg', img: 'images/7.jpg', description: 'Image 7'},
        {thumb: 'images/thumbs/8.jpg', img: 'images/8.jpg', description: 'Image 8'},
        {thumb: 'images/thumbs/9.jpg', img: 'images/9.jpg', description: 'Image 9'},
        {thumb: 'images/thumbs/10.jpg', img: 'images/10.jpg', description: 'Image 10'},
        {thumb: 'images/thumbs/11.jpg', img: 'images/11.jpg', description: 'Image 11'}
	];
}]);
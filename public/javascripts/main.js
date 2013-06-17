// initial vars
var images = [],
  count = 0;

// when DOM content is loaded, setup the things up
document.addEventListener("DOMContentLoaded", function () {
  var i = 0,
    // function responsible to iterate images and show them
    imageIterator = function() {
      if (i >= count) {
        i = 0;
      }
      showImage(i);
      i++;
    };
  // get all document images
  images = document.getElementsByTagName('img');
  // cache the image count
  count = images.length;
  // setup the function interval
  setInterval(imageIterator, 20000);
  // show the first image
  showImage(i);
});

// adds the hidden class to each image, and then, shows the image with the
// given index.
function showImage (index) {
  for (i = 0; i < count; i++) {
    images[i].className = 'hidden';
  }
  images[index].className = '';
}

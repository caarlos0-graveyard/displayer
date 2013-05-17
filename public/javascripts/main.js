var images, count;

document.addEventListener("DOMContentLoaded", function () {
  var i = 0;
  images = document.getElementsByTagName('img');
  count = images.length;
  setInterval(function() {
    i++;
    if (i > count) {
      i = 0;
    }
    showImage(i);
  }, 20000);
  showImage(i);
});

function showImage (index) {
  for (i = 0; i < count; i++) {
    var image = images[i];
    if (!image.className) {
      image.className = 'hidden';
    }
  }
  images[index].className = '';
}

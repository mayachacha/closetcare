/*global $*/
document.addEventListener('turbo:load', function () {
  $('.slick').slick({
    autoplay:true,
    slidesToShow:6,
    infinite:false,
    slidesToScroll:1,
    adaptiveHeight: true,
    prevArrow: '<button class="slick-prev" aria-label="Previous" type="button">◀︎</button>',
    nextArrow: '<button class="slick-next" aria-label="Next" type="button">▶︎</button>'
    });
});
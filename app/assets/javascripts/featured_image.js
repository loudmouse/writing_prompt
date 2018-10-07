$(window).bind("load", function() {

  const div = document.getElementById('featured-photo');

  const photog_url = 'https://api.unsplash.com/photos/random?&query=camp&client_id=3af8662ba60ee5845668e501d7ecd832331c22e5d9c1b95de45e008c734adea1';

  function createNode(element) {
     return document.createElement(element); //
   }

  function append(parent, el) {
   return parent.appendChild(el);
  }

  fetch(photog_url)
   .then((resp) => resp.json())

   .then(function(data) {
     let photos = data;
     let unsplash = photos["links"]["html"];

     let unsplash_data = createNode('li'),
         img = createNode('img'),
         ul = createNode('ul'),
         container = createNode('div');



       unsplash_data.className = "featured-unsplash";
       img.className = "featured-image";
       ul.className = "featured-ul";
       container.className = "featured-image-container";




       img.src = photos["urls"]["small"];
       unsplash_data.innerHTML = `Unsplash: ${unsplash}`;

       // append(div, img); //add image to div
       append(ul, unsplash_data);
       append(container, img);
       append(container, ul);
       append(div, container);
       // append(div, ul);
       // append(li, span);
  })

});

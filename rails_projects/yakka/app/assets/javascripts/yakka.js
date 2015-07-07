window.Yakka = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() { 

    all_categories = [
      {id: 1, nom: "Linge", stat: 15},
      {id: 2, nom: "Meuble", stat: 15}
    ];
    new YakkaRouter();
    console.log(all_categories);
     Backbone.history.start({pushState: true});
  }
}

$(document).ready(function() {
  Yakka.initialize()
  
});




  


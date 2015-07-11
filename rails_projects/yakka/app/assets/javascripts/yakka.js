window.Yakka = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function() { 
    
//     all_categories = [
//       new CategoryModel({id: 1, nom: "Linge", stat: 15}),
//       new CategoryModel({id: 2, nom: "Meuble", stat: 15})
//     ];
    this.AllCategories = new CategoriesCollection();
    var superthisAllCat = this.AllCategories
    this.AllCategories.fetch().done(function(){
      var yr = new YakkaRouter();
      console.log(superthisAllCat);
      var view = new CategoryView({collection: superthisAllCat, el:$("#container")});
      Backbone.history.start();
      
    }); 
    
    
   //$("a.menu").click(function(e){e.preventDefault();}); 
  }
}
Yakka.initialize()
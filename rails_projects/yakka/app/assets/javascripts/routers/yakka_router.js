var YakkaRouter = Backbone.Router.extend({
		routes: {
      
 			'': 'index',
      'lol': 'showCategory',
      'categories/:id': 'showCategory'
		},
  
    index: function() {
      console.log(" on est sur l'index");
      console.log(this.AllCategories);
      view = new CategoryView({collection: this.AllCategories,el:$("#container")});
      return false;
    },
    
    showCategory: function (id) {
			console.log(" category avec l'id " + id);
      category = Yakka.AllCategories.get(id);
      view = new EditCategory({model: category,el:$("#container")});
      return false;
		}

		
	});

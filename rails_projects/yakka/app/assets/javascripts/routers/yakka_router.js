var YakkaRouter = Backbone.Router.extend({
		routes: {
      
 			'': 'index',
      'lol': 'showCategory',
      'categories/:id': 'showCategory'
		},
  
    index: function() {
      alert(" ça marche mon gars 2X");
   //   view = new CategoryView({collection: this.AllCategories,el:$("#container")});
      return false;
    },
    
    showCategory: function (id) {
			alert(" category avec l'id " + id);
      category = Yakka.AllCategories.get(id);
      view = new EditCategory({model: category,el:$("#container")});
      //return false;
		}

		
	});

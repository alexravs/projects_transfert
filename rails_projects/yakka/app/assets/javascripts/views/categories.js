CategoryView = Backbone.View.extend({
    template:null,
    initialize:function(){
      //constructeur
      //écouteur d'event
       this.render();
    },
    render:function(){
      //construire la vue
      this.$el.html("<p>" + _.toArray(this.collection).join(",")+ "</p>");
      return this;
    }
  
  
});
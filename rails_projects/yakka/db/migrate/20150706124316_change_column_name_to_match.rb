class ChangeColumnNameToMatch < ActiveRecord::Migration
  def change
    rename_column :characteristics, :car_fk_products, :product_id
    rename_column :characteristics, :car_fk_properties, :property_id
    rename_column :clients, :cli_fk_pays, :pays_id
    rename_column :combinaisons, :com_fk_characteristics, :identifiant_combi_id
    rename_column :identifiant_combi, :idc_fk_prices, :price_id
    rename_column :order_rows, :row_fk_orders, :order_id
    rename_column :order_rows, :row_fk_identifiant_combi, :identifiant_combi_id
    rename_column :orders, :com_fk_clients, :client_id
    rename_column :products, :prod_fk_sub_categories, :sub_category_id
    rename_column :sub_categories, :sscat_fk_categories, :category_id
  end
end

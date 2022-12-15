class OrderProductRecordDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "OrderProductRecord.id", cond: :eq },
      order_id: { source: "OrderProductRecord.order_id", cond: :like },
      user_email: { source: "OrderProductRecord.user_email", cond: :like },
      product: { source: "OrderProductRecord.product", cond: :like },
      price: { source: "OrderProductRecord.price", cond: :like },
      quantity: { source: "OrderProductRecord.quantity", cond: :like },
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        order_id: record.order_id,
        user_email: User.joins(orders: [:order_product_records]).where("order_product_records.id = #{record.id}").first.email,
        product: Product.joins(:order_product_records).where(id: record.product_id).first.name,
        price: record.price,
        quantity: record.quantity,
      }
    end
  end

  def get_raw_records
    # insert query here
    products_ids = []
    options[:current_user].products.each { |product| products_ids.push product.id }
    p ' 1231231231233333333333333333333333333', products_ids
    OrderProductRecord.where(product_id: products_ids)
  end

end

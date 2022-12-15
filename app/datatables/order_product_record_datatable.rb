class OrderProductRecordDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "OrderProductRecord.id", cond: :eq },
      order_id: { source: "OrderProductRecord.order_id", cond: :like },
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
        user_email: record.id,
        order_id: record.order_id,
        product: Product.find(record.product_id),
        price: record.price,
        quantity: record.quantity,
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    OrderProductRecord.all
  end

end

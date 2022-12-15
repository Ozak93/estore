class OrderDatatable < AjaxDatatablesRails::ActiveRecord

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      id: { source: "Order.id" },
      total_price: { source: "Order.total_price" }
    }
  end

  def data
    records.map do |record|
      {
        # example:
        id: record.id,
        total_price: record.total_price,
        # product_name: record.products.first,
        DT_RowID: record.id
      }
    end
  end

  def get_raw_records
    # insert query here
    # User.all
    p 'FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF'
    Order.order(updated_at: :desc)
  end

end

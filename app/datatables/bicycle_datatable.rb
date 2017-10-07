class BicycleDatatable < AjaxDatatablesRails::Base
  def_delegators :@view, :link_to, :edit_users_bicycle_path, :truncate, :current_user

  def view_columns
    # Declare strings in this format: ModelName.column_name
    # or in aliased_join_table.column_name format
    @view_columns ||= {
      name: { source: 'Bicycle.name', cond: :like, searchable: true },
      description: { source: 'Bicycle.description' },
      category: { source: 'Category.name' },
      created_at: { source: 'Bicycle.created_at' }
    }
  end

  def data
    records.map do |record|
      {
        name: link_to(truncate(record.name, length: 15), edit_users_bicycle_path(record)),
        description: truncate(record.description, length: 15),
        category: record.category.name,
        created_at: record.created_at.localtime.strftime('%d %b %Y %r'),
      }
    end
  end

  private

  def get_raw_records
    current_user.bicycles.includes(:category).references(:category).all
  end

  # ==== These methods represent the basic operations to perform on records
  # and feel free to override them

  # def filter_records(records)
  # end

  # def sort_records(records)
  # end

  # def paginate_records(records)
  # end

  # ==== Insert 'presenter'-like methods below if necessary
end

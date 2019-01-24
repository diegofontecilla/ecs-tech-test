class TableRowsProcessor

  attr_reader :returned_indexes

  def initialize
    @returned_indexes = []
  end

  def process_table_row(table_rows)
    table_rows.each do |row|
      table_data_row_array = get_selenium_table_data_row(row).map {|cell| cell.text.to_i}
      left_group = table_data_row_array.take(1)
      center_group = [table_data_row_array[1]]
      right_group = table_data_row_array.drop(2)
      groups_matcher(left_group, center_group, right_group)
      add_index(table_data_row_array, center_group, right_group)
    end

    returned_indexes
  end

  def get_selenium_table_data_row(row)
    row.find_elements(:tag_name, 'td')
  end

  def groups_matcher(left_group, center_group, right_group)
    while sum(left_group) != sum(right_group)
      break if right_group.empty?
      group_permutator(left_group, center_group, right_group)
    end
  end

  def add_index(table_data_row_array, center_group, right_group)
    if !right_group.empty?
      returned_indexes << table_data_row_array.find_index(center_group[0])
    else
      returned_indexes << nil
    end
  end

  def group_permutator(left_group, center_group, right_group)
    left_group << center_group.shift
    center_group << right_group.shift
  end

  def sum(array)
    array.inject(0) { |sum, i| sum + i }
  end
end

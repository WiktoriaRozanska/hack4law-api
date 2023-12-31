# frozen_string_literal: true

class CategorySerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :icon, :subcategories

  def title
    object.title.capitalize
  end

  def subcategories
    # Category.where
    Category.where(parent_category_id: object.id).map do |category|
      {
        id: category.id,
        title: category.title,
        description: category.description
      }
    end
  end
end

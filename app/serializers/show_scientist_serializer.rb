class ShowScientistSerializer < ActiveModel::Serializer
    attributes :id, :name, :field_of_study, :avatar
  
    has_many :planets
    #has_many :missions



end
class Garfield::API::Person < Grape::API
  resource :people do
    params do
      optional :name, type: String
    end
    get do
      data_set = configuration[:Person]
      if (params.key?(:name))
        data_set = data_set.filter_by_name(params[:name])
      end

      data_set.all
    end
  end
end
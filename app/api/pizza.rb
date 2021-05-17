class Garfield::API::Pizza < Grape::API
  resource :pizzas do
    params do
      optional :type, type: String
    end
    get do
      data_set = configuration[:Pizza]
      if (params.key?(:type))
        data_set = data_set.filter_by_type(params[:type])
      end

      data_set.all
    end

    params do
      requires :id, type: Integer
      requires :type, type: String
    end
    put ':id' do
      pizza = configuration[:Pizza][params[:id]]
      pizza.update(type: params[:type])
      pizza
    end

    params do
      requires :type, type: String
    end
    post do
      configuration[:Pizza].create(type: params[:type])
    end

    params do
      requires :id, type: Integer
    end
    delete ':id' do
      configuration[:Pizza][params[:id]].delete
    end
  end
end
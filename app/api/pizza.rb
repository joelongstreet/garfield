class Garfield::API::Pizza < Grape::API
  resource :pizzas do
    params do
      optional :type, type: String
    end
    get do
      data_set = Garfield::Models::Pizza
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
      pizza = Garfield::Models::Pizza[params[:id]]
      pizza.update(type: params[:type])
      pizza
    end

    params do
      requires :type, type: String
    end
    post do
      Garfield::Models::Pizza.create(type: params[:type])
    end

    params do
      requires :id, type: Integer
    end
    delete ':id' do
      Garfield::Models::Pizza[params[:id]].delete
    end
  end
end
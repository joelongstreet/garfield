class Garfield::API::Pizza < Grape::API
  resource :pizzas do
    get do
      Garfield::Models::Pizza.all
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
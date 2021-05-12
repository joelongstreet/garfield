class Garfield::API::Pizza < Grape::API
  resource :pizzas do
    get do
      Garfield::Models::Pizza.all
    end

    put ':id' do
      params do
        requires :id, type: Integer
        requires :type, type: String
      end

      pizza = Garfield::Models::Pizza[params[:id]]
      pizza.update(type: params[:type])
      pizza
    end

    post do
      params do
        requires :type, type: String
      end

      Garfield::Models::Pizza.create(type: params[:type])
    end
  end
end
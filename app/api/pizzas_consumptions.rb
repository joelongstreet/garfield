class Garfield::API::Pizzas_Consumptions < Grape::API
  resource :pizzas_consumptions do
    get do
      Garfield::Models::Pizzas_Consumptions.all
    end

    params do
      optional :month_id, type: Integer
    end
    get '/count-by-day' do
      data_set = Garfield::Models::Pizzas_Consumptions
        .group_by_eaten_at
        .order_by_count
      
      if (params.key?(:month))
        data_set = data_set.filter_by_month(params[:month])
      end

      if (params.key?(:year))
        data_set = data_set.filter_by_year(params[:year])
      end

      data_set.naked
    end
  end
end
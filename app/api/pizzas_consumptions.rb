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

    get '/streakz' do
      jagged_streaks = []
      consumptions_by_date = Garfield::Models::Pizzas_Consumptions
        .group_by_eaten_at
        .order_by_eaten_at
        .naked
      
      consumptions_by_date.each{ |n|
        last_streak = jagged_streaks.last

        if !last_streak
          jagged_streaks.append([n])
        elsif last_streak.last[:count] < n[:count]
          last_streak.append(n)
        else
          jagged_streaks.append([n])
        end
      }

      jagged_streaks
    end
  end
end
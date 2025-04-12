module BookingsHelper
  def booking_border_color(status)
    case status
    when "pending" then "border-yellow-400"
    when "approved" then "border-blue-500"
    when "taken" then "border-indigo-600"
    when "returned" then "border-green-500"
    when "rejected" then "border-red-500"
    else "border-gray-300"
    end
  end

  def booking_badge_color(status)
    case status
    when "pending" then "bg-yellow-100 text-yellow-800"
    when "approved" then "bg-blue-100 text-blue-800"
    when "taken" then "bg-indigo-100 text-indigo-800"
    when "returned" then "bg-green-100 text-green-800"
    when "rejected" then "bg-red-100 text-red-800"
    else "bg-gray-100 text-gray-800"
    end
  end

  def booking_status_icon(status)
    case status
    when "pending" then "🕒"
    when "approved" then "✅"
    when "taken" then "📚"
    when "returned" then "🔁"
    when "rejected" then "❌"
    else "📖"
    end
  end

  def booking_status_hint(status)
    case status
    when "pending"
      "Ожидает подтверждения библиотекарем"
    when "approved"
      "Вы можете забрать книги"
    when "taken"
      "Книги у вас — не забудьте вернуть их вовремя"
    when "returned"
      "Вы успешно вернули книги"
    when "rejected"
      "Запрос отклонён библиотекарем. Книги не могут быть выданы"
    else
      ""
    end
  end

  def booking_status(status)
    case status
    when "pending"
      "Ожидает подтверждения"
    when "approved"
      "Одобрено"
    when "taken"
      "Выдано"
    when "returned"
      "Возвращено"
    when "rejected"
      "Отклонено"
    else
      ""
    end
  end
end

module ApplicationHelper
  def date_or_undef date
    date.try(:strftime, "%d/%m/%Y") || "Não definida"
  end
end

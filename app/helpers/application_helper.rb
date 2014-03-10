module ApplicationHelper
  def date_or_undef date
    date.try(:strftime, "%d/%m/%Y") || "Não definida"
  end

  def short_date_or_undef date
    date.try(:strftime, "%d %h %H:%M") || "Não definida"
  end

  def date_time_or_undef date
    date.try(:strftime, "%d %h %H:%M") || "Não definida"
  end

  def phases_deadline_to_hash(phases)
    phases.collect do |p|
      '{title: "Entrega ' + p.project.name + ': ' + p.name + '" , start: new Date("' + p.begin_date.to_time.strftime('%Y %m %d') + '")}'
    end
  end
end

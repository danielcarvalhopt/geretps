class AcademicYearValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A\d{4}\/\d{4}\z/i
      record.errors[attribute] << (options[:message] || "Ano Letivo inválido")
    end
  end
end

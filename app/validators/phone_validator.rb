class PhoneValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    unless value =~ /\A\d{9}\z/i
      record.errors[attribute] << (options[:message] || "Número de telefone inválido")
    end
  end
end

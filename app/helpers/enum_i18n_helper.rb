module EnumI18nHelper

  # Returns an array of the possible key/i18n values for the enum
  # Example usage:
  # enum_options_for_select(Usuario, :apsimuladol_state)
  def enum_options_for_select(class_name, enum)
    class_name.send(enum.to_s.pluralize).map do |key, _|
      [enum_i18n(class_name, enum, key), key]
    end
  end


  def enum_options_for_select_value(class_name, enum)
    class_name.send(enum.to_s.pluralize).map do |key, value|
        [enum_i18n(class_name, enum, key), value]
    end
  end

  # Returns the i18n version the the models current enum key
  # Example usage:
  # enum_l(user, :apsimuladol_state)
  def enum_l(model, enum)
    enum_i18n(model.class, enum, model.send(enum))
  end

  # Returns the i18n string for the enum key
  # Example usage:
  # enum_i18n(Usuario, :apsimuladol_state, :unprocessed)
  def enum_i18n(class_name, enum, key)
    unless key.blank?
      I18n.t("activerecord.attributes.#{class_name.model_name.i18n_key}.#{enum.to_s.pluralize}.#{key}")
    end
  end

end

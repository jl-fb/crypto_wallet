module ApplicationHelper
    def locale
        if I18n.locale == :en
            "Estados Unidos"
        elsif I18n.locale == :pt
            "Portugues Portugal"
        else
            "Português Brasil"
        end
    end
    def ambiente_rails
        if Rails.env.development?
            "Desenvolvimento"
        elsif Rail.env.production?
            "Produção"
        else
            "Teste"
        end
    end
end

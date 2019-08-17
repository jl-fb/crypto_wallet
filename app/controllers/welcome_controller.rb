class WelcomeController < ApplicationController
  def index
    #cookies[:curso] = "Curso Ruby on Rails - Joao - [COOKIES]" 
    session[:curso] = "Curso Ruby on Rails - Joao - [SESSION]" 
    @meu_nome = params[:nome]
    @meu_curso = params[:curso]
  end
end

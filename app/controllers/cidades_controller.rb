class CidadesController < ApplicationController
    layout 'cruds'
    before_action :set_cidade, only: [:show, :edit, :update, :destroy]

    # GET /cidades
    def index
        unless request.format.in?(['html', 'js'])
            @cidades = Cidade.all
        end
        respond_to do |format|
            format.html
            format.json
            format.js
        end
    end

    # GET /cidades/1
    def show;end

    # GET /cidades/new
    def new
        @cidade = Cidade.new(cidade_params)
    end

    # GET /cidades/1/edit
    def edit;end

    # POST /cidades
    def create
        @cidade = Cidade.new(cidade_params)
        notice = 'Cidade cadastrado(a) com sucesso.'
        respond_to do |format|
            if @cidade.save
                remote = params.try(:[], :remote)
                location = [@cidade]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : cidades_path, notice: notice}
                format.json { render :show, status: :created, location: @cidade }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @cidade.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /cidades/1
    def update
        notice = 'Cidade alterado(a) com sucesso.'
        respond_to do |format|
            if @cidade.update(cidade_params)
                remote = params.try(:[], :remote)
                location = [@cidade]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : cidades_path, notice: notice}
                format.json { render :show, status: :ok, location: location }
                format.js { flash[:notice] = notice}
            else
                format.html { render :edit, status: :unprocessable_entity  }
                format.json { render json: @cidade.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /cidades/1
    def destroy
        @cidade.destroy
        notice = 'Cidade removido(a) com sucesso.'
        respond_to do |format|
            format.html { redirect_to params[:controller].split("/").map(&:to_sym), notice: notice }
            format.json { head :no_content }
            format.js { render partial: 'shared/errors', locals: {errors: @cidade.errors} }
        end
    end

    def datatable
        respond_to do |format|
            format.json { render json: CidadesDatatable.new(view_context) }
        end
    end

    def search
        respond_to do |format|
            format.json { render json: Cidade.search(params[:search])  }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_cidade
            @cidade = Cidade.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def cidade_params
            if params[:cidade]
                    params.require(:cidade).permit(:nome, :estado_id, :deleted_at)
            end
        end


end
    
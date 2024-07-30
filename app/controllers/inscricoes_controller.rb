class InscricoesController < ApplicationController
    layout 'cruds'
    before_action :set_inscricao, only: [:show, :edit, :update, :destroy]

    # GET /inscricoes
    def index
        unless request.format.in?(['html', 'js'])
            @inscricoes = Inscricao.all
        end
        respond_to do |format|
            format.html
            format.json
            format.js
        end
    end

    # GET /inscricoes/1
    def show;end

    # GET /inscricoes/new
    def new
        @inscricao = Inscricao.new(inscricao_params)
    end

    # GET /inscricoes/1/edit
    def edit;end

    # POST /inscricoes
    def create
        @inscricao = Inscricao.new(inscricao_params)
        notice = 'Inscricao cadastrado(a) com sucesso.'
        respond_to do |format|
            if @inscricao.save
                remote = params.try(:[], :remote)
                location = [@inscricao]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : inscricoes_path, notice: notice}
                format.json { render :show, status: :created, location: @inscricao }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @inscricao.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /inscricoes/1
    def update
        notice = 'Inscricao alterado(a) com sucesso.'
        respond_to do |format|
            if @inscricao.update(inscricao_params)
                remote = params.try(:[], :remote)
                location = [@inscricao]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : inscricoes_path, notice: notice}
                format.json { render :show, status: :ok, location: location }
                format.js { flash[:notice] = notice}
            else
                format.html { render :edit, status: :unprocessable_entity  }
                format.json { render json: @inscricao.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /inscricoes/1
    def destroy
        @inscricao.destroy
        notice = 'Inscricao removido(a) com sucesso.'
        respond_to do |format|
            format.html { redirect_to params[:controller].split("/").map(&:to_sym), notice: notice }
            format.json { head :no_content }
            format.js { render partial: 'shared/errors', locals: {errors: @inscricao.errors} }
        end
    end

    def datatable
        respond_to do |format|
            format.json { render json: InscricoesDatatable.new(view_context) }
        end
    end

    def search
        respond_to do |format|
            format.json { render json: Inscricao.search(params[:search])  }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_inscricao
            @inscricao = Inscricao.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def inscricao_params
            if params[:inscricao]
                    params.require(:inscricao).permit(:curso_id, :nome, :sexo, :data_nascimento, :cidade, :nome_pai, :nome_mae, :rg, :cpf, :orgao_expedidor, :data_expedicao, :celular, :telefone_residencial,  :pagamento_matricula)
            end
        end


end
    
class EstadosController < ApplicationController
    layout 'cruds'
    before_action :set_estado, only: [:show, :edit, :update, :destroy]

    # GET /estados
    def index
        unless request.format.in?(['html', 'js'])
            @estados = Estado.all
        end
        respond_to do |format|
            format.html
            format.json
            format.js
        end
    end

    # GET /estados/1
    def show;end

    # GET /estados/new
    def new
        @estado = Estado.new(estado_params)
    end

    # GET /estados/1/edit
    def edit;end

    # POST /estados
    def create
        @estado = Estado.new(estado_params)
        notice = 'Estado cadastrado(a) com sucesso.'
        respond_to do |format|
            if @estado.save
                remote = params.try(:[], :remote)
                location = [@estado]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : estados_path, notice: notice}
                format.json { render :show, status: :created, location: @estado }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @estado.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /estados/1
    def update
        notice = 'Estado alterado(a) com sucesso.'
        respond_to do |format|
            if @estado.update(estado_params)
                remote = params.try(:[], :remote)
                location = [@estado]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : estados_path, notice: notice}
                format.json { render :show, status: :ok, location: location }
                format.js { flash[:notice] = notice}
            else
                format.html { render :edit, status: :unprocessable_entity  }
                format.json { render json: @estado.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /estados/1
    def destroy
        @estado.destroy
        notice = 'Estado removido(a) com sucesso.'
        respond_to do |format|
            format.html { redirect_to params[:controller].split("/").map(&:to_sym), notice: notice }
            format.json { head :no_content }
            format.js { render partial: 'shared/errors', locals: {errors: @estado.errors} }
        end
    end

    def datatable
        respond_to do |format|
            format.json { render json: EstadosDatatable.new(view_context) }
        end
    end

    def search
        respond_to do |format|
            format.json { render json: Estado.search(params[:search])  }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_estado
            @estado = Estado.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def estado_params
            if params[:estado]
                    params.require(:estado).permit(:nome, :sigla, :deleted_at)
            end
        end


end
    
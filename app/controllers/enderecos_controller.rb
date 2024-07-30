class EnderecosController < ApplicationController
    layout 'cruds'
    before_action :set_endereco, only: [:show, :edit, :update, :destroy]

    # GET /enderecos
    def index
        unless request.format.in?(['html', 'js'])
            @enderecos = Endereco.all
        end
        respond_to do |format|
            format.html
            format.json
            format.js
        end
    end

    # GET /enderecos/1
    def show;end

    # GET /enderecos/new
    def new
        @endereco = Endereco.new(endereco_params)
    end

    # GET /enderecos/1/edit
    def edit;end

    # POST /enderecos
    def create
        @endereco = Endereco.new(endereco_params)
        notice = 'Endereco cadastrado(a) com sucesso.'
        respond_to do |format|
            if @endereco.save
                remote = params.try(:[], :remote)
                location = [@endereco]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : enderecos_path, notice: notice}
                format.json { render :show, status: :created, location: @endereco }
            else
                format.html { render :new, status: :unprocessable_entity }
                format.json { render json: @endereco.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # PATCH/PUT /enderecos/1
    def update
        notice = 'Endereco alterado(a) com sucesso.'
        respond_to do |format|
            if @endereco.update(endereco_params)
                remote = params.try(:[], :remote)
                location = [@endereco]
                location.unshift(params[:controller].split("/")[0].to_sym) if params[:controller].split("/").length > 1
                format.html { redirect_to remote.blank? || remote == 'false' ? location : enderecos_path, notice: notice}
                format.json { render :show, status: :ok, location: location }
                format.js { flash[:notice] = notice}
            else
                format.html { render :edit, status: :unprocessable_entity  }
                format.json { render json: @endereco.errors, status: :unprocessable_entity }
                format.turbo_stream { render :form_update, status: :unprocessable_entity }
            end
        end
    end

    # DELETE /enderecos/1
    def destroy
        @endereco.destroy
        notice = 'Endereco removido(a) com sucesso.'
        respond_to do |format|
            format.html { redirect_to params[:controller].split("/").map(&:to_sym), notice: notice }
            format.json { head :no_content }
            format.js { render partial: 'shared/errors', locals: {errors: @endereco.errors} }
        end
    end

    def datatable
        respond_to do |format|
            format.json { render json: EnderecosDatatable.new(view_context) }
        end
    end

    def search
        respond_to do |format|
            format.json { render json: Endereco.search(params[:search])  }
        end
    end

    private
        # Use callbacks to share common setup or constraints between actions.
        def set_endereco
            @endereco = Endereco.find(params[:id])
        end

        # Never trust parameters from the scary internet, only allow the white list through.
        def endereco_params
            if params[:endereco]
                    params.require(:endereco).permit(:cep, :logradouro, :numero, :bairro, :deleted_at, :estado_id, :cidade_id)
            end
        end


end
    
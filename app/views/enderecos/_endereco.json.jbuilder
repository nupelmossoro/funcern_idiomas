json.extract! endereco, :id, :cep, :logradouro, :numero, :bairro, :deleted_at, :estado_id, :cidade_id, :created_at, :updated_at
json.url endereco_url(endereco, format: :json)

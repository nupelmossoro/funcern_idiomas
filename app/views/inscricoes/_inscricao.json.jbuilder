json.extract! inscricao, :id, :nome, :sexo, :data_nascimento, :cidade, :nome_pai, :nome_mae, :rg, :cpf, :orgao_expedidor, :data_expedicao, :celular, :telefone, :residencial, :forma_pagamento, :secretaria, :data_pagamento, :observacao, :created_at, :updated_at
json.url inscricao_url(inscricao, format: :json)

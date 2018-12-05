function individuo = operacao_mutacao(individuo, tipo_mutacao, dados_originais)
  
  qtd_atributos = size(individuo(1).atributos)(2)
  
  if(tipo_mutacao == 1)
  
    qtd_alterados = 1
    atributos_alterados = [randi(qtd_atributos)]
    
  elseif(tipo_mutacao == 2)
  
    qtd_alterados = randi(qtd_atributos)
    atributos_alterados = []
    
    while(size(atributos_alterados)(2) != qtd_alterados)
      
      posicoes_geradas = randi(qtd_atributos, 1, qtd_alterados)
      atributos_alterados = unique(posicoes_geradas)    
    
    endwhile
  
  else
    
    qtd_alterados = qtd_atributos
    atributos_alterados = 1:qtd_atributos
  
  endif
  
  qtd_instancias = size(individuo)(2)

  for indice_instancia = 1:qtd_instancias
    
    atributos_instancia = individuo(indice_instancia).atributos
    limites_atributos = dados_originais(indice_instancia).atributos
         
    for num_alteracao = 1:qtd_alterados
      
      posicao_alterado = atributos_alterados(num_alteracao)
      limite = abs(limites_atributos(posicao_alterado))
      
      mutacao = -1*limite + 2*limite*rand(1)
      novo_valor = atributos_instancia(posicao_alterado) + mutacao
      novo_valor = intervalo_valido(novo_valor, limite)
      
      atributos_instancia(posicao_alterado) = novo_valor  
    
    endfor
    
    individuo(indice_instancia).atributos = atributos_instancia
    
  endfor
  
endfunction
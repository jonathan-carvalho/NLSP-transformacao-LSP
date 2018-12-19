function salvar_melhor_individuo(nome_arq, populacao, distribuicao_classes, dados_originais)
  
  qtd_individuos = size(populacao)(2)
  qtd_instancias = size(populacao(1).repr)(2)
  qtd_atributos = size(populacao(1).repr(1).atributos)(2)
  
  valores_fitness = zeros(1, qtd_individuos)
  
  for indice_individuo = 1:qtd_individuos
    valores_fitness(indice_individuo) = populacao(indice_individuo).fitness
  endfor
  
  [valor_max, posicao_max] = max(valores_fitness)
  
  melhor_individuo_struct = populacao(posicao_max).repr
  melhor_individuo_cell = {}
  
  melhor_individuo_struct = calcular_parametro_b(melhor_individuo_struct, distribuicao_classes, dados_originais)
  
  for indice_instancia = 1:qtd_instancias
    
    instancia = melhor_individuo_struct(indice_instancia)
    
    for indice_atributo = 1:qtd_atributos
      melhor_individuo_cell(indice_instancia, 2*indice_atributo - 1) = real(instancia.atributos(indice_atributo))
      melhor_individuo_cell(indice_instancia, 2*indice_atributo) = imag(instancia.atributos(indice_atributo))
    endfor
      melhor_individuo_cell(indice_instancia, 2*qtd_atributos+1) = instancia.classe
      
  endfor
    
  cell2csv(nome_arq, melhor_individuo_cell)

endfunction

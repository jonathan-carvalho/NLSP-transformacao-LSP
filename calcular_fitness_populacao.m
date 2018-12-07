function populacao = calcular_fitness_populacao(populacao, distribuicao_classes, dados_originais)
  
  tamanho_populacao = size(populacao)(2)
  
  for indice_individuo = 1:tamanho_populacao
  
    individuo = populacao(indice_individuo).repr
    
    valor_fitness = calcular_fitness_individuo(individuo, distribuicao_classes, dados_originais)
    
    populacao(indice_individuo).fitness = valor_fitness
  
  endfor

endfunction
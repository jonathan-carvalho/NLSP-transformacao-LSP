function populacao_alterada = adicionar_melhor_descendente(novos_individuos, populacao, distribuicao_classes, dados_originais)
  
  fitness_novos_individuos = zeros(1,4)
  
  for indice_individuo = 1:4
    valor_fitness = calcular_fitness_individuo(novos_individuos(indice_individuo).repr, distribuicao_classes, dados_originais)
    fitness_novos_individuos(indice_individuo) = valor_fitness
  endfor
  
  [valor_melhor_descendente, posicao_melhor_descendente] = max(fitness_novos_individuos)
  
  populacao_alterada = adicionar_individuo_populacao(novos_individuos(posicao_melhor_descendente).repr, valor_melhor_descendente, populacao, 0)
    
endfunction

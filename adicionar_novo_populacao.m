function populacao_alterada = adicionar_novo_populacao(novos_individuos, populacao, distribuicao_classes)
  
  fitness_novos_individuos = zeros(1,4)
  
  for indice_individuo = 1:4
    valor_fitness = calcular_fitness_individuo(novos_individuos(indice_instancia), distribuicao_classes)
    fitness_novos_individuos(indice_instancia) = valor_fitness  
  endfor
  
  tamanho_populacao = size(populacao(2))
  aptidoes_populacao = zeros(1, tamanho_populacao)
  
  for indice_individuo = 1:tamanho_populacao  
    aptidoes_populacao(indice_individuo) = populacao(indice_individuo).fitness
  endfor
  
  valor_melhor_descendente, posicao_melhor_descendente = max(fitness_novos_individuos)
  valor_pior_populacao, posicao_pior_populacao = min(aptidoes_populacao)
  
  if(valor_melhor_descendente > valor_pior_populacao)
    
    populacao(posicao_pior_populacao).repr = novos_individuos(posicao_melhor_descendente)
    populacao(posicao_pior_populacao).fitness = valor_melhor_descendente 
    
  endif
  
  populacao_alterada = populacao  
  
endfunction

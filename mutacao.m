function populacao = mutacao(individuos, prob_mutacao, populacao, distribuicao_classes, dados_originais)
  
  substituicao_exigida = 1
  substituicao_condicional = 0
  
  for indice_individuo = 1:4
    
    individuo = individuos(indice_individuo).repr
    
    for indice_mutante = 1:3
      
      mutante = operacao_mutacao(individuo, indice_mutante, dados_originais)
      
      valor_fitness = calcular_fitness_individuo(mutante, distribuicao_classes, dados_originais)
      
      prob_mutacao_gerado = rand
      
      if(prob_mutacao_gerado <= prob_mutacao)
        modo_substituicao = substituicao_exigida
      else
        modo_substituicao = substituicao_condicional
      endif
        
      populacao = adicionar_individuo_populacao(mutante, valor_fitness, populacao, modo_substituicao)
    
    endfor

  endfor  

endfunction
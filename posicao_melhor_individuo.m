function posicao_max = posicao_melhor_individuo(populacao)
  
  tamanho_populacao = size(populacao)(2)
  aptidoes_populacao = zeros(1, tamanho_populacao)
   
  for indice_individuo = 1:tamanho_populacao
    aptidoes_populacao(indice_individuo) = populacao(indice_individuo).fitness
  endfor
  
  [valor_max, posicao_max] = max(aptidoes_populacao)

endfunction

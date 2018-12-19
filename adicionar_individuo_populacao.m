function populacao = adicionar_individuo_populacao(individuo, fitness, populacao, modo_substituicao)

  substituicao_exigida = 1
  substituicao_condicional = 0
  
  tamanho_populacao = size(populacao)(2)
  aptidoes_populacao = zeros(1, tamanho_populacao)
  
  for indice_individuo = 1:tamanho_populacao
    aptidoes_populacao(indice_individuo) = populacao(indice_individuo).fitness
  endfor
  
  [valor_pior_populacao, posicao_pior_populacao] = min(aptidoes_populacao)
  
  if(modo_substituicao == substituicao_exigida || fitness > valor_pior_populacao)
    
    populacao(posicao_pior_populacao).repr = individuo
    populacao(posicao_pior_populacao).fitness = fitness
    
  endif
  
endfunction

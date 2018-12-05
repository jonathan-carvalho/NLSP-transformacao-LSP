function [selecionado1, selecionado2] = selecao_roleta(populacao)
  
  tamanho_populacao = size(populacao(2))
  aptidoes = zeros(1, tamanho_populacao)
  
  for indice_individuo = 1:tamanho_populacao  
    aptidoes(indice_individuo) = populacao(indice_individuo).fitness
  endfor

  idx_aptidoes = zeros(tamanho_populacao, 2)
  idx_aptidoes(:,1) = 1:tamanho_populacao
  idx_aptidoes(:,2) = aptidoes
  
  indice_selecionado1 = selecao_individuo(idx_aptidoes)
  
  idx_aptidoes(indice_selecionado1, :) = []
  indice_selecionado2 = selecao_individuo(idx_aptidoes)
  
  selecionado1 = populacao(indice_selecionado1).repr
  selecionado2 = populacao(indice_selecionado2).repr
  
endfunction

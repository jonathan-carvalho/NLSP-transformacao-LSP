function indice_escolhido = selecao_individuo(aptidoes)
  
  soma = sum(aptidoes(:,2))
  aptidoes
  aptidoes(:,2) = aptidoes(:,2) / soma
  
  valor_aleatorio = rand
  acumulo = 0
  indice_escolhido = 0
  
  while(indice_escolhido == 0)
    
    [valor, idx] = min(aptidoes(:,2))
    
    acumulo += valor
    
    if(acumulo >= valor_aleatorio)
      indice_escolhido = aptidoes(idx, 1)
    else
      aptidoes(idx,:) = []
    endif
  
  endwhile

endfunction

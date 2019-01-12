function qtd_iteracoes_estagnadas = verificar_estagnacao(melhor_fitness_anterior, melhor_fitness_atual, qtd_iteracoes_estagnadas)
  
  if(melhor_fitness_anterior == melhor_fitness_atual)
    qtd_iteracoes_estagnadas += 1;
  else
    qtd_iteracoes_estagnadas = 0;
  endif

endfunction

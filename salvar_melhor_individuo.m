function salvar_melhor_individuo(nome_arq, populacao, distribuicao_classes, dados_originais)
  
  qtd_instancias = size(populacao(1).repr)(2);
  qtd_atributos = size(populacao(1).repr(1).atributos)(2);
  
  posicao_max = posicao_melhor_individuo(populacao);
  melhor_individuo_struct = populacao(posicao_max).repr;
  melhor_individuo_cell = {};
  
  melhor_individuo_struct = calcular_parametro_b(melhor_individuo_struct, distribuicao_classes, dados_originais);
  
  for indice_instancia = 1:qtd_instancias
    
    instancia = melhor_individuo_struct(indice_instancia);
    
    for indice_atributo = 1:qtd_atributos
      melhor_individuo_cell(indice_instancia, 2*indice_atributo - 1) = real(instancia.atributos(indice_atributo));
      melhor_individuo_cell(indice_instancia, 2*indice_atributo) = imag(instancia.atributos(indice_atributo));
    endfor
      melhor_individuo_cell(indice_instancia, 2*qtd_atributos+1) = instancia.classe;
      
  endfor
    
  cell2csv(nome_arq, melhor_individuo_cell);

endfunction

function nova_geracao = cruzamento(individuo1, individuo2, w, dados_originais)
  
  tamanho_amostra = size(dados_originais)(2);
  qtd_atributos = size(dados_originais(1).atributos)(2);
  
  novo1 = struct();
  novo2 = struct();
  novo3 = struct();
  novo4 = struct();
  
  for indice_instancia = 1:tamanho_amostra
    
    representacao_original = dados_originais(indice_instancia).atributos;
    classe_instancia = dados_originais(indice_instancia).classe;
    
    representacao1 = individuo1(indice_instancia).atributos;
    representacao2 = individuo2(indice_instancia).atributos;
    
    representacao_final1 = representacao_final2 = representacao_final3 = representacao_final4 = zeros(1, qtd_atributos);
    
    for indice_atributo = 1:qtd_atributos
      
      limite = abs(representacao_original(indice_atributo));
      
      resultante1 = (representacao1(indice_atributo) + representacao2(indice_atributo)) / 2;
      resultante2 = limite*(1-w) + max(representacao1(indice_atributo), representacao2(indice_atributo))*w;
      resultante3 = -1*limite*(1-w) + min(representacao1(indice_atributo), representacao2(indice_atributo))*w;
      resultante4 = resultante1*w;
      
      resultante1 = intervalo_valido(resultante1, limite);
      representacao_final1(indice_atributo) = resultante1;
      
      resultante2 = intervalo_valido(resultante2, limite);
      representacao_final2(indice_atributo) = resultante2;
      
      resultante3 = intervalo_valido(resultante3, limite);
      representacao_final3(indice_atributo) = resultante3;
      
      resultante4 = intervalo_valido(resultante4, limite);
      representacao_final4(indice_atributo) = resultante4;
    
    endfor
    
    novo1(indice_instancia).atributos = representacao_final1;
    novo1(indice_instancia).classe = classe_instancia;
    
    novo2(indice_instancia).atributos = representacao_final2;
    novo2(indice_instancia).classe = classe_instancia;
    
    novo3(indice_instancia).atributos = representacao_final3;
    novo3(indice_instancia).classe = classe_instancia;
    
    novo4(indice_instancia).atributos = representacao_final4;
    novo4(indice_instancia).classe = classe_instancia;
    
  endfor
  
  nova_geracao = struct();
  nova_geracao(1).repr = novo1;
  nova_geracao(2).repr = novo2;
  nova_geracao(3).repr = novo3;
  nova_geracao(4).repr = novo4;
  
endfunction
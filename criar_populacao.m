function populacao = criar_populacao(tamanho_populacao, amostra)
  
  qtd_instancias = size(amostra)(2);
  dimensao = size(amostra(1).atributos)(2);
  
  populacao = struct();
  
  for indice_individuo = 1:tamanho_populacao
   
    individuo = amostra;
    
    for indice_instancia = 1:qtd_instancias
      
      instancia_transformada = individuo(indice_instancia);
      
      for indice_atributo = 1:dimensao
        
        limite = abs(instancia_transformada.atributos(indice_atributo));
        
        instancia_transformada.atributos(indice_atributo) = -1*limite + 2*limite*rand(1); 
      
      endfor
      
      individuo(indice_instancia) = instancia_transformada;    
    
    endfor
    
    populacao(indice_individuo).repr = individuo;
   
  endfor
  
endfunction

function individuo = calcular_parametro_b(individuo, distribuicao_classes, dados_originais)
  
  nomes_classes = fieldnames(distribuicao_classes)
  qtd_instancias = size(individuo)(2)
  qtd_atributos = size(individuo(1).atributos)(2)
  
  for indice_instancia = 1:qtd_instancias
    
    atributos_transformados = individuo(indice_instancia).atributos
    atributos_originais = dados_originais(indice_instancia).atributos
    
    comparacao = strcmp(nomes_classes, individuo(indice_instancia).classe)
    posicao_classe = find(1 == comparacao)
    mudanca_sinal = (-1)^(mod(posicao_classe,2))
    
    for indice_atributo = 1:qtd_atributos
      
      valor_a = atributos_transformados(indice_atributo)
      valor_original = atributos_originais(indice_atributo)
      
      valor_b = sqrt((valor_original^2) - (valor_a^2))
      valor_b *= mudanca_sinal
      
      atributos_transformados(indice_atributo) = valor_a + i*valor_b
    
    endfor
   
    individuo(indice_instancia).atributos = atributos_transformados
   
  endfor

endfunction

function distribuicao_classes = contador_classes(amostra)
  
  qtd_instancias = size(amostra)(2)
  
  distribuicao_classes = struct()
  
  for indice_instancia = 1:qtd_instancias
    
    valor_classe = amostra(indice_instancia).classe
    
    if(isfield(distribuicao_classes, valor_classe))
      distribuicao_classes.(valor_classe) += 1
    
    else
    
      distribuicao_classes.(valor_classe) = 1
    
    endif
  
  endfor

endfunction

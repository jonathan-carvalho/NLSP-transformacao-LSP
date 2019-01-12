function conjunto_structs = transformar_cells_structs(conjunto_cells)
  
  qtd_instancias = size(conjunto_cells)(1);
  dimensao = size(conjunto_cells)(2) - 1;
    
  conjunto_structs = struct();
  
  for indice = 1:qtd_instancias
    
    celula = conjunto_cells(indice,:);
    
    conjunto_structs(indice).atributos = cell2mat(celula(1,1:dimensao));
    conjunto_structs(indice).classe = cell2mat(celula(1,dimensao+1));
  
  endfor

endfunction

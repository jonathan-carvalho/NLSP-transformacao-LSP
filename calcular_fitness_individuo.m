function valor_fitness = calcular_fitness_individuo(individuo, distribuicao_classes, dados_originais)
  
  num_classes = numfields(distribuicao_classes)
  nomes_classes = fieldnames(distribuicao_classes)
  
  qtd_instancias = size(individuo)(2)
  qtd_atributos = size(individuo(1).atributos)(2)
  
  vetores_centroides = zeros(num_classes, qtd_atributos)
  
  for indice_instancia = 1:qtd_instancias
   
   atributos_transformados = individuo(indice_instancia).atributos
   atributos_originais = dados_originais(indice_instancia).atributos
   
   for indice_atributo = 1:qtd_atributos
      
      valor_a = atributos_transformados(indice_atributo)
      valor_original = atributos_originais(indice_atributo)
      
      valor_b = sqrt((valor_original^2) - (valor_a^2))
      mudanca_sinal = (-1)^(mod(randi(2),2))
      valor_b *= mudanca_sinal
      
      atributos_transformados(indice_atributo) = valor_a + i*valor_b

   endfor
   
   individuo(indice_instancia).atributos = atributos_transformados
   
   comparacao = strcmp(nomes_classes, individuo(indice_instancia).classe)
   linha_centroide = find(1 == comparacao)
   vetores_centroide(linha_centroide, :) += atributos_transformados
   
  endfor
  
  for indice_classe = 1:num_classes
    
   classe = cell2mat(nomes_classe(indice_classe))
   qtd_classe_atual = distribuicao_classes.(classe)
   vetores_centroide(indice_classe) /= qtd_classe_atual
  
  endfor

  distancia_classes = 0
  
  for idx_classe_1 = 1:(num_classes-1)
    
    for idx_classe_2 = (idx_classe_1+1) : num_classes
      
      centroide_1 = vetores_centroide(idx_classe_1, :)
      centroide_2 = vetores_centroide(idx_classe_2, :)
      distancia = centroide_1 - centroide_2
      
      distancia_classes += norm(distancia)
    
    endfor
    
  endfor
  
  conjunto_variancias = zeros(1, num_classes)
  
  for indice_instancia = 1:qtd_instancias
    
   instancia = individuo(indice_instancia)
    
   comparacao = strcmp(nomes_classes, instancia.classe)
   posicao_classe = find(1 == comparacao)
   
   vetor_desvio = instancia.atributos - vetores_centroide(posicao_classe, :) 
   conjunto_variancias(posicao_classe) += norm(vetor_desvio)  
  
  endfor
  
  for indice_classe = 1:num_classes
    
   classe = cell2mat(nomes_classe(indice_classe))
   qtd_classe_atual = distribuicao_classes.(classe)
   
   conjunto_variancias(indice_classe) /= (qtd_classe_atual-1)
  
  endfor
  
  conjunto_variancias = sqrt(conjunto_variancias)
  
  variancias_classes = 1 + sum(conjunto_variancias)
  
  valor_fitness = distancias_classes / variancias_classes

endfunction

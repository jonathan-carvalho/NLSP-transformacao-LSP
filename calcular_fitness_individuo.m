function valor_fitness = calcular_fitness_individuo(individuo, distribuicao_classes, dados_originais)
  
  num_classes = numfields(distribuicao_classes)
  nomes_classes = fieldnames(distribuicao_classes)
  
  qtd_instancias = size(individuo)(2)
  qtd_atributos = size(individuo(1).atributos)(2)
  
  vetores_centroides = zeros(num_classes, qtd_atributos)
  
  individuo = calcular_parametro_b(individuo, distribuicao_classes, dados_originais)
  
  for indice_instancia = 1:qtd_instancias
   
   comparacao = strcmp(nomes_classes, individuo(indice_instancia).classe)
   posicao_classe = find(1 == comparacao)   
   vetores_centroides(posicao_classe, :) += individuo(indice_instancia).atributos
   
  endfor
  
  for indice_classe = 1:num_classes
    
   classe = cell2mat(nomes_classes(indice_classe))
   qtd_classe_atual = distribuicao_classes.(classe)
   vetores_centroides(indice_classe) /= qtd_classe_atual
  
  endfor

  distancias_classes = 0
  
  for idx_classe_1 = 1:(num_classes-1)
    
    for idx_classe_2 = (idx_classe_1+1) : num_classes
      
      centroide_1 = vetores_centroides(idx_classe_1, :)
      centroide_2 = vetores_centroides(idx_classe_2, :)
      distancia = centroide_1 - centroide_2
      
      distancias_classes += norm(distancia)
    
    endfor
    
  endfor
  
  conjunto_variancias = zeros(1, num_classes)
  
  for indice_instancia = 1:qtd_instancias
    
   instancia = individuo(indice_instancia)
    
   comparacao = strcmp(nomes_classes, instancia.classe)
   posicao_classe = find(1 == comparacao)
   
   vetor_desvio = instancia.atributos - vetores_centroides(posicao_classe, :) 
   conjunto_variancias(posicao_classe) += norm(vetor_desvio)  
  
  endfor
  
  for indice_classe = 1:num_classes
    
   classe = cell2mat(nomes_classes(indice_classe))
   qtd_classe_atual = distribuicao_classes.(classe)
   
   conjunto_variancias(indice_classe) /= (qtd_classe_atual-1)
  
  endfor
  
  conjunto_variancias = sqrt(conjunto_variancias)
  
  variancias_classes = 1 + sum(conjunto_variancias)
  
  valor_fitness = distancias_classes / variancias_classes

endfunction
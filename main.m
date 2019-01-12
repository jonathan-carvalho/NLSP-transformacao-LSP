#! /usr/bin/octave -qf

clear;
pkg load io;

base_dados = argv(){1};

dados_originais = csv2cell(["../Datasets/" base_dados "/original/dataset.csv"]);
dados_originais = transformar_cells_structs(dados_originais);

distribuicao_classes = contador_classes(dados_originais);

qtd_individuos = 5;
qtd_geracoes_total = 1000;
prob_mutacao = 0.1;

populacao = criar_populacao(qtd_individuos, dados_originais);
populacao = calcular_fitness_populacao(populacao, distribuicao_classes, dados_originais);

melhor_fitness_anterior = 0;
contagem_estagnacao = 0;

for num_geracao = 1:qtd_geracoes_total

  [selecionado1, selecionado2] = selecao_roleta(populacao);
  nova_geracao = cruzamento(selecionado1, selecionado2, 0.8, dados_originais);
  populacao = adicionar_melhor_descendente(nova_geracao, populacao, distribuicao_classes, dados_originais);
  populacao = mutacao(nova_geracao, prob_mutacao, populacao, distribuicao_classes, dados_originais);
  
  if(num_geracao > 100)
    
    posicao_max = posicao_melhor_individuo(populacao);
    melhor_fitness_atual = populacao(posicao_max).fitness;
    contagem_estagnacao = verificar_estagnacao(melhor_fitness_anterior, melhor_fitness_atual, contagem_estagnacao);
     
    if(contagem_estagnacao == 50)
      break;
    endif
    
    melhor_fitness_anterior = melhor_fitness_atual;
  
  endif
     
endfor

salvar_melhor_individuo(["../Datasets/" base_dados "/transformado/dataset.csv"], populacao, distribuicao_classes, dados_originais);

pkg load io

dados_originais = csv2cell("../Datasets/iris.csv");
dados_originais = transformar_cells_structs(dados_originais)

distribuicao_classes = contador_classes(dados_originais)

qtd_individuos = 10
qtd_geracoes = 1

populacao = criar_populacao(qtd_individuos, dados_originais)
populacao = calcular_fitness_populacao(populacao, distribuicao_classes)

for num_geracao = 1:qtd_geracoes
  
  [selecionado1, selecionado2] = selecao_roleta(populacao)
  nova_geracao = cruzamento(selecionado1, selecionado2, 0.8, dados_originais)
  populacao = adicionar_novo_populacao(nova_geracao, populacao, distribuicao_classes)
  %mutacao(nova_geracao)

endfor 


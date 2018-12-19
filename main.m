clear
pkg load io

dados_originais = csv2cell("../Datasets/circulos_concentricos.csv")
dados_originais = transformar_cells_structs(dados_originais)

distribuicao_classes = contador_classes(dados_originais)

qtd_individuos = 5
qtd_geracoes = 20
prob_mutacao = 0.1

populacao = criar_populacao(qtd_individuos, dados_originais)
populacao = calcular_fitness_populacao(populacao, distribuicao_classes, dados_originais)

for num_geracao = 1:qtd_geracoes
  
  [selecionado1, selecionado2] = selecao_roleta(populacao)
  nova_geracao = cruzamento(selecionado1, selecionado2, 0.8, dados_originais)
  populacao = adicionar_melhor_descendente(nova_geracao, populacao, distribuicao_classes, dados_originais)
  populacao = mutacao(nova_geracao, prob_mutacao, populacao, distribuicao_classes, dados_originais)

endfor

salvar_melhor_individuo("../Datasets/resultado.csv", populacao, distribuicao_classes, dados_originais)

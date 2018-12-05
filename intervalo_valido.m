function novo_valor = intervalo_valido(valor_calculado, limite)
  
  if(valor_calculado > limite)
    novo_valor = limite
  elseif(valor_calculado < -1*limite)
    novo_valor = -1*limite
  else
    novo_valor = valor_calculado    
  endif

endfunction

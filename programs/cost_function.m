function cost = cost_function(o,y)
  cost = sum((o-y).^2);
endfunction
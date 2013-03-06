
reds = 0:0.001:6;
denom = Ez(0.3,0.7,reds).*(1+reds).^(1/3);

% type = ['h' 'f' 'w' 'n' 's'];

rate_int.h = zeros(size(reds));

  for i=1:length(reds)
    
    rate_int.h(i) = BC_rate_6(reds(i),0.02,'h')./denom(i);
    
  end
  
  rate_int.f = zeros(size(reds));

  for i=1:length(reds)
    
    rate_int.f(i) = BC_rate_6(reds(i),0.02,'f')./denom(i);
    
  end
  
  rate_int.w = zeros(size(reds));

  for i=1:length(reds)
    
    rate_int.w(i) = BC_rate_6(reds(i),0.02,'w')./denom(i);
    
  end
  
  rate_int.n = zeros(size(reds));

  for i=1:length(reds)
    
    rate_int.n(i) = BC_rate_6(reds(i),0.02,'n')./denom(i);
	
  end
  
  rate_int.s = zeros(size(reds));
  
  for i=1:length(reds)
    
    rate_int.s(i) = BC_rate_6(reds(i),0.02,'s')./denom(i);    
  end

save('rate6_integrand_20.mat','reds','rate_int');

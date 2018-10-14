% beginning
% A=[0,1,0,1]
% B=[1,0,1,0]

% A * B'

% k = 1 % 4 7

k = 7;
L0 = 10000;
L = L0;
p = 0.3 %0.05 % 0.1 0.2 0.3
err = 0;

while L > 0

	v = abs(round(rand(1, 7)));
	e=abs(round(rand(1, 7)-0.5+p));
	r = mod((v+e),2);
	
	err = err + sum(mod((r-v),2));
	
	L = L-1;
end

err/(k*L0)
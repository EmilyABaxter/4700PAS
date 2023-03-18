Is = 0.01e-12;
Ib = 0.1e-12;
Vb = 1.3;
Gp = 0.1; 

V = linspace(-1.95,0.7,200);
I = Is*((exp((1.2/0.025)*V))-1) + (Gp*V) - ((Ib)*((exp((-1.2/0.025)*(V+Vb)))-1));
I2 = I + (0.2*(randn(1,200) - 0.5));

x = transpose(V);
fo1 = fittype('A.*(exp(1.2*x/25e-3)-1) + 0.1.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fo2 = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C*(exp(1.2*(-(x+1.3))/25e-3)-1)');
fo = fittype('A.*(exp(1.2*x/25e-3)-1) + B.*x - C*(exp(1.2*(-(x+D))/25e-3)-1)');

I = transpose(I);
ff = fit(x,I,fo);
If = ff(x);

ff1 = fit(x,I,fo1);
If1 = ff1(x);

ff2 = fit(x,I,fo2);
If2 = ff2(x);

subplot(4,2,1); hold on;
plot(V, I2);
plot(V, I);
hold off;

subplot(4,2,2); hold on;
semilogy(V, abs(I2));
semilogy(V, abs(I));
hold off;

subplot(4,2,3); hold on;
plot(V, I);
p1 = polyfit(V,I,8);
p12 = polyfit(V,I,4);
poly1 = polyval(p1,V);
poly12 = polyval(p12,V);
plot(V,poly1);
plot(V,poly12);
hold off;

subplot(4,2,4); hold on;
semilogy(V, abs(I2));
p2 = polyfit(V,I2,8);
p21 = polyfit(V,I2,4);
poly2 = polyval(p2,V);
poly21 = polyval(p21,V);
semilogy(V,abs(poly2));
semilogy(V,abs(poly21));
hold off;

subplot(4,2,5); hold on;
plot(transpose(V),transpose(If));
plot(transpose(V),transpose(If1));
plot(transpose(V),transpose(If2));
hold off;

subplot(4,2,6); hold on;
semilogy(transpose(V),abs(transpose(If)));
semilogy(transpose(V),abs(transpose(If1)));
semilogy(transpose(V),abs(transpose(If2)));
hold off;

inputs = V;
targets = transpose(I);
hiddenLayerSize = 10;
net = fitnet(hiddenLayerSize);
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 15/100;
net.divideParam.testRatio = 15/100;
[net,tr] = train(net,inputs,targets);
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs);
view(net);
Inn = outputs;

figure
plot(V,Inn);

figure 
semilogy(V,abs(Inn));


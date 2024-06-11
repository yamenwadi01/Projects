historical_prices = [100, 200, 300, 400, 500, 600, 700, 800, 900];
current_prices = [200, 300, 400, 500, 600, 700, 800, 900, 1000];
time = [1, 2, 3, 4, 5, 6, 7, 8, 9];
inputs = [historical_prices; current_prices; time];
targets = current_prices;
hiddenLayerSize = 20;
net = fitnet(hiddenLayerSize, 'trainlm');
net.divideParam.trainRatio = 0.7; 
net.divideParam.valRatio = 0.15; 
net.divideParam.testRatio = 0.15; 
[net,tr] = train(net,inputs,targets);
outputs = net(inputs);
errors = gsubtract(outputs,targets);
performance = perform(net,targets,outputs);
future_prices = net([current_prices; time; zeros(1,length(time))]);

% Plot historical prices
figure;
subplot(3,1,1);
plot(time, historical_prices, 'b');
title('Historical Prices');
xlabel('Time');
ylabel('Prices');

% Plot current prices
subplot(3,1,2);
plot(time, current_prices, 'r');
title('Current Prices');
xlabel('Time');
ylabel('Prices');

% Plot future prices
subplot(3,1,3);
plot(time, future_prices, 'g');
title('Future Prices');
xlabel('Time');
ylabel('Prices');
rng('default');
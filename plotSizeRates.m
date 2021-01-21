clf

subplot(3,1,1)
panelSizeRates(100, 0.03, 0.02, @parametersDutkiewicz)
xlabel('')
set(gca,'xticklabel','')

subplot(3,1,2)
panelSizeRates(20, 0.03, 0.02, @parametersDutkiewicz)
xlabel('')
set(gca,'xticklabel','')

subplot(3,1,3)
panelSizeRates(100, 0.03, 0.005, @parametersDutkiewicz)

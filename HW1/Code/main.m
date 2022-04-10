% Foundation of Neuroscience/ HW1 
clc; clear; close all;

% all functions are defined at the end of the code

%% question2
clc; clear; close all;

meanHeight = 15.7; % standard mean of the sunflower

measuredHeights = [11.5 11.8 15.7 16.1 14.1 ...
    10.5 9.3 15.0 11.1 15.2 19.0 12.8 12.4 ...
    19.2 13.5 12.2 13.3 16.5 13.5 14.4 16.7 ...
    10.9 13.0 10.3 15.8 15.1 17.1 13.3 12.4 ...
    8.5 14.3 12.9 13.5]; % measured heights of the flower sample

% one-sample t-test
df = length(measuredHeights)-1;
[h,p,ci,stats] = ttest(measuredHeights,meanHeight);
tValue = stats.tstat;
CriticaltValue = tinv(p,df);

% draw t distribution
x = -5:.1:5;
y = tpdf(x,df);

figure;
plot(x,y);
grid on; grid minor;

% critical t value
hold on;
x1 = xline(CriticaltValue,'--r',{'Critical t-Value'},'Color','red');
xl.LabelVerticalAlignment = 'middle';
xl.LabelHorizontalAlignment = 'center';

% test t-value
x2 = xline(tValue,'--r',{'t-Value'},'Color','black');

x2.LabelVerticalAlignment = 'middle';
x2.LabelHorizontalAlignment = 'center';

legend('df = 32');

% data distribution
figure;
histfit(measuredHeights,7);
ylim([1 15]);
grid on; grid minor;
legend('df = 32');
% critical t value
hold on;
x1 = xline(CriticaltValue+mean(measuredHeights),'--r',{'Critical t-Value'},'Color','red');
xl.LabelVerticalAlignment = 'middle';
xl.LabelHorizontalAlignment = 'center';

% test t-value
x2 = xline(tValue+mean(measuredHeights),'--r',{'t-Value'},'Color','black');
x2.LabelVerticalAlignment = 'middle';
x2.LabelHorizontalAlignment = 'center';

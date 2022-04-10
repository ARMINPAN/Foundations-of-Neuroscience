 % hw5 - Foundations of Neuroscience - Prof. Ghazizadeh
 % simulations
 % Armin Panjehpour - 98101288
 
 %% Question 2.3 - unsupervised learning
 clc; clear; close all;
 
 data = load('Neural_Inputs.mat');
 u = data.inputs;

 
w1 = 0.01;  % initial
w2 = 0.01;  % initial
dw = 0;
dt = 1;
tau_w = 10*dt;

% calculation of intial v, v = w.u
v = zeros(1,length(u));
v(1) = w1*u(1,1) + w2*u(2,1); % initial v
dw = zeros(2,1);
w = zeros(2,length(u));
w(:,1) = [w1; w2];

% updating the weights using hebbian learning | covariance rule | numerical
for i=1:length(u)-1
    dw = (v(i).*(u(:,i)))./tau_w;
    w(:,i+1) = w(:,i) + dw*dt;
    v(i+1) = w(1,i+1)*u(1,i+1) + w(2,i+1)*u(2,i+1);
end
figure;
subplot(1,2,1)
plot(w(1,:))
grid on; grid minor;
title('w1','interpreter','latex');
xlabel('time(samples)','interpreter','latex');

subplot(1,2,2)
plot(w(2,:))
grid on; grid minor;
title('w2','interpreter','latex');
xlabel('time(samples)','interpreter','latex');


%% Question 3 - Percentage of correct responses for perceptron
clc; clear; close all;


fun = @(x,t) sqrt(x./(2*pi)).*exp(-x./2.*t.^2); % x is Nu/(Ns-1)
xp =  0.001:0.001:10;
p = 0.5*ones(1,length(xp)); % initial probabilities
for i=1:length(xp)
    p(i) = integral(@(t) fun(xp(i),t),-inf,1);
end

plot(xp,p)
grid on; grid minor;
ylabel('probability correct','interpreter','latex');
xlabel('$\frac{N_u}{N_s-1}$','interpreter','latex');
title('perceptron','interpreter','latex');

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Question 4 - Reinforcement Learning 
%% Q.4.1 - Rescorla-Wagner Rule
% number of trials = 200
clc; clear; close all;

w = zeros(1,200);  % initial
dw = 0;
u = ones(1,200); % stimulus
LR = 0.05; % learning rate
v = zeros(1,200); % output \ expection of reward
rewards = [ones(1,100), zeros(1,100)];

for i = 1:200-1
    v(i) = u(i)*w(i);
    delta = rewards(i) - v(i);% prediction error
    dw = LR*delta*u(i);
    w(i+1) = w(i) + dw;
end

scatter(1:200,w);
grid on; grid minor;
title('Rescorla-Wagner Rule','interpreter','latex');
ylabel('weights` values','interpreter','latex');
xlabel('time(trial`s numnber)','interpreter','latex');


%% Q.4.2 - Rescorla-Wagner Rule with probabilistic rewards
% number of trials = 200
clc; clear; close all;

% for alpha = 0.25
w = zeros(1,200);  % initial
dw = 0;
u = ones(1,200); % stimulus
LR = 0.05; % learning rate
v = zeros(1,200); % output \ expection of reward


alpha = 0.25; % probability of reward to be given
rewards = rand(1,200) < alpha; % rewards

for i = 1:200-1
    v(i) = u(i)*w(i);
    delta = rewards(i) - v(i);% prediction error
    dw = LR*delta*u(i);
    w(i+1) = w(i) + dw;
end

figure;
subplot(1,2,1);
scatter(1:200,w);
grid on; grid minor;
title('Probabilistic Rescorla-Wagner Rule for alpha = 0.25','interpreter','latex');
ylabel('weights` values','interpreter','latex');
xlabel('time(trial`s numnber)','interpreter','latex');

% for alpha = 0.75
w = zeros(1,200);  % initial
dw = 0;
u = ones(1,200); % stimulus
LR = 0.05; % learning rate
v = zeros(1,200); % output \ expection of reward
alpha = 0.75; % probability of reward to be given
rewards2 = rand(1,200) < alpha; % rewards

for i = 1:200-1
    v(i) = u(i)*w(i);
    delta = rewards2(i) - v(i);% prediction error
    dw = LR*delta*u(i);
    w(i+1) = w(i) + dw;
end

subplot(1,2,2)
scatter(1:200,w);
grid on; grid minor;
title('Probabilistic Rescorla-Wagner Rule for alpha = 0.75','interpreter','latex');
ylabel('weights` values','interpreter','latex');
xlabel('time(trial`s numnber)','interpreter','latex');

%% Q.4.4 - Rescorla-Wagner Rule 
% number of trials = 200

clc; clear; close all;

% probabilistic rewards
% for alpha = 0.5
w = zeros(1,200);  % initial
dw = 0;
u = ones(1,200); % stimulus
LR = 0.05; % learning rate
v = zeros(1,200); % output \ expection of reward


alpha = 0.5; % probability of reward to be given
rewards = rand(1,200) < alpha; % rewards

for i = 1:200-1
    v(i) = u(i)*w(i);
    delta = rewards(i) - v(i);% prediction error
    dw = LR*delta*u(i);
    w(i+1) = w(i) + dw;
end

figure;
scatter(1:200,w);
grid on; grid minor;
title('Probabilistic Rescorla-Wagner Rule for alpha = 0.25','interpreter','latex');
ylabel('weights` values','interpreter','latex');
xlabel('trial`s numnber','interpreter','latex');


% deterministic reward with a value of .5

w = zeros(1,200);  % initial
dw = 0;
u = ones(1,200); % stimulus
LR = 0.05; % learning rate
v = zeros(1,200); % output \ expection of reward
rewards = 0.5*ones(1,200);

for i = 1:200-1
    v(i) = u(i)*w(i);
    delta = rewards(i) - v(i);% prediction error
    dw = LR*delta*u(i);
    w(i+1) = w(i) + dw;
end

hold on;
scatter(1:200,w);
grid on; grid minor;
title('Rescorla-Wagner Rule','interpreter','latex');
ylabel('weights` values','interpreter','latex');
xlabel('time(trial`s numnber)','interpreter','latex');
legend('p(r) = 0.5','r = 0.5');
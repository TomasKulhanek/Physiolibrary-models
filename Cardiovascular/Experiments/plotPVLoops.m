% plotPVLoops
clear; close all;
file = 'LVFailure_Ecmo_LVDrainNonLin0';
% file = 'LVFailure_Ecmo0';
load([file '_1.mat']);
n = name';
% heart.heart.ventricles.VLV
% n(201, :) 
% heart.heart.ventricles.pLV  
% n(205, :)
col_v = dataInfo(2, 201);
col_p = dataInfo(2, 205);
lineStyle = {'-b', '-r', '-g', '-k', '-m','-c','--b', '--r', '--g', '--k'};
lineWidth = [1, 1, 1, 1, 1, 1, 2, 2];

figure();
clf;hold on;
axis([60 165 0 140]);
ylabel('LV volume [ml]');
xlabel('LV pressure [mmHg]');

t = data_2(1, :);
v = data_2(col_v, :);
p = data_2(col_p, :);
rng = t >= 14.06 & t < 14.94;


plot(v(rng)*1e6, p(rng)/133.32, lineStyle{1});
for i = 2:8
    load([file num2str(i-1) '.mat']);
    t = data_2(1, :);
    v = data_2(col_v, :);
    p = data_2(col_p, :);
    rng = t >= 14.06 & t < 14.94;
    plot(v(rng)*1e6, p(rng)/133.32, lineStyle{i}, 'LineWidth', lineWidth(i));
end
legend('0.1 l/min', '1 l/min', '2 l/min', '3 l/min', '4 l/min', ...
    '5 l/min', '6 l/min', '7 l/min')

%% plot them all 
figure();
clf;hold on;
axis([60 165 0 140]);
ylabel('LV volume [ml]');
xlabel('LV pressure [mmHg]');

col_v = dataInfo(2, 201);
col_p = dataInfo(2, 205);

load('Healthy_noEcmo.mat')
    t = data_2(1, :);
    v = data_2(col_v, :);
p = data_2(col_p, :);
rng = t >= 14.06 & t < 14.94;
plot(v(rng)*1e6, p(rng)/133.32, 'k');

load('LVFailure_noEcmo.mat');
    t = data_2(1, :);
    v = data_2(col_v, :);
p = data_2(col_p, :);
rng = t >= 14.06 & t < 14.94;
plot(v(rng)*1e6, p(rng)/133.32, 'g');

file = 'LVFailure_Ecmo0';
load([file '5.mat']);
    t = data_2(1, :);
    v = data_2(col_v, :);
p = data_2(col_p, :);
rng = t >= 14.06 & t < 14.94;
plot(v(rng)*1e6, p(rng)/133.32, 'r');

file = 'LVFailure_Ecmo_LVDrainNonLin0';
load([file '5.mat']);
    t = data_2(1, :);
    v = data_2(col_v, :);
p = data_2(col_p, :);
rng = t >= 14.06 & t < 14.94;
plot(v(rng)*1e6, p(rng)/133.32, 'b');


legend('Healthy', 'Cardiogenic shock', 'ECMO 5 l/min', 'LVU ECMO 5 l/min');

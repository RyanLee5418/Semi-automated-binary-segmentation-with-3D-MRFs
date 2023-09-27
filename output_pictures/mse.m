close all
clear all

%% mse of no.47 frame
gt47 = double(imread('Hula.Fore.ACKGT.00047.png')) ./ 255;
my2d_47 = double(imread('2d.47.png')) ./ 255;
my2d_47 = my2d_47(:, :, 1);

my3d_47 = double(imread('3d.47.png')) ./ 255;
my3d_47 = my3d_47(:, :, 1);

my3dmc_47 = double(imread('3dmc.47.png')) ./ 255;
my3dmc_47 = my3dmc_47(:, :, 1);

MSE_47_2d = mean((gt47 - my2d_47) .^ 2, 'all');
MSE_47_3d = mean((gt47 - my3d_47) .^ 2, 'all');
MSE_47_3dmc = mean((gt47 - my3dmc_47) .^ 2, 'all');

%% mse of no.48 frame
gt48 = double(imread('Hula.Fore.ACKGT.00048.png')) ./ 255;
myML = double(imread('ML.48.png')) ./ 255;
myML = myML(:, :, 1);

my40 = double(imread('3Dmc60.48.png')) ./ 255;
my40 = my40(:, :, 1);

my2d_48 = double(imread('2d.48.png')) ./ 255;
my2d_48 = my2d_48(:, :, 1);

my3d_48 = double(imread('3d.48.png')) ./ 255;
my3d_48 = my3d_48(:, :, 1);

my3dmc_48 = double(imread('3dmc.48.png')) ./ 255;
my3dmc_48 = my3dmc_48(:, :, 1);

MSE_48_ML = mean((gt48 - myML) .^ 2, 'all');
MSE_48_2d = mean((gt48 - my2d_48) .^ 2, 'all');
MSE_48_3d = mean((gt48 - my3d_48) .^ 2, 'all');
MSE_48_3dmc = mean((gt48 - my3dmc_48) .^ 2, 'all');
MSE_40 = mean((gt48 - my40) .^ 2, 'all');
%% mse of no.49 frame
gt49 = double(imread('Hula.Fore.ACKGT.00049.png')) ./ 255;
my2d_49 = double(imread('2d.49.png')) ./ 255;
my2d_49 = my2d_49(:, :, 1);

my3d_49 = double(imread('3d.49.png')) ./ 255;
my3d_49 = my3d_49(:, :, 1);

my3dmc_49 = double(imread('3dmc.49.png')) ./ 255;
my3dmc_49 = my3dmc_49(:, :, 1);

MSE_49_2d = mean((gt49 - my2d_49) .^ 2, 'all');
MSE_49_3d = mean((gt49 - my3d_49) .^ 2, 'all');
MSE_49_3dmc = mean((gt49 - my3dmc_49) .^ 2, 'all');

%% TP rate
% Calculate true positive rate
TP1 = sum(my3dmc_48(:) & gt48(:)); % count number of true positives
FN1 = sum(my3dmc_48(:) & ~gt48(:)); % count number of false negatives
TP_rate1 = TP1 / (TP1 + FN1); % calculate TP rate

TP2 = sum(my40(:) & gt48(:)); % count number of true positives
FN2 = sum(my40(:) & ~gt48(:)); % count number of false negatives
TP_rate2 = TP2 / (TP2 + FN2); % calculate TP rate

%% Confusion Matrix

C = confusionmat(gt48(:), my3dmc_48(:));
confusionchart(C);
%% read MRF workshop .csv and covert MRF.csv for Ostenson_MRF patch

% uses conv_MRF_facts_csv
% note TI, minimum TR, minimum TE, and maximum flip angle need to be
% specified on examcard

%% clean slate
clear all; close all; clc;

dir_in = './';

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fipri_best500_TR15
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn_csv_in = 'Fipri_best500_TR15.csv';
[path,prefix,ext] = fileparts(fn_csv_in);
data = csvread([dir_in fn_csv_in],14,0);

alpha_v = []; phi_v = []; TR_v = []; TE_v = [];

alpha_v = data(:,1);
phi_v = data(:,3);
TR_v = data(:,2);
TE_v = data(:,4);
alphaNom = 60;
[ facts_m, csv_m ] = conv_MRF_facts_csv(alpha_v, phi_v, TR_v, alphaNom, TE_v);
movefile('MRF.csv', sprintf('Hamburg_Welch_%s_MRF.csv', prefix)); 

%% write file with no modulations for k-space trajectory mapping
alpha_v(:) = alphaNom;
phi_v(:) = 0.0;
TR_v(:) = 0.0;
TE_v(:) = 0.0;
[ facts_m, csv_m ] = conv_MRF_facts_csv(alpha_v, phi_v, TR_v, alphaNom, TE_v);
movefile('MRF.csv', sprintf('Hamburg_Welch_ksp_traj_%s_MRF.csv', prefix)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fipri_jiang_TR16
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn_csv_in = 'Fipri_jiang_TR16.csv';
[path,prefix,ext] = fileparts(fn_csv_in);
data = csvread([dir_in fn_csv_in],14,0);

alpha_v = []; phi_v = []; TR_v = []; TE_v = [];

alpha_v = data(:,1);
phi_v = data(:,3);
TR_v = data(:,2);
TE_v = data(:,4);
alphaNom = 70;
[ facts_m, csv_m ] = conv_MRF_facts_csv(alpha_v, phi_v, TR_v, alphaNom, TE_v);
movefile('MRF.csv', sprintf('Hamburg_Welch_%s_MRF.csv', prefix)); 

%% write file with no modulations for k-space trajectory mapping
alpha_v(:) = alphaNom;
phi_v(:) = 0.0;
TR_v(:) = 0.0;
TE_v(:) = 0.0;
[ facts_m, csv_m ] = conv_MRF_facts_csv(alpha_v, phi_v, TR_v, alphaNom, TE_v);
movefile('MRF.csv', sprintf('Hamburg_Welch_ksp_traj_%s_MRF.csv', prefix)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Fipri_short_const_TR28
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fn_csv_in = 'Fipri_short_const_TR28.csv';
[path,prefix,ext] = fileparts(fn_csv_in);
data = csvread([dir_in fn_csv_in],12,0);

alpha_v = []; phi_v = []; TR_v = []; TE_v = [];

alpha_v = data(:,1);
phi_v = data(:,3);
TR_v = data(:,2);
try
    TE_v = data(:,4);
catch
    TE_v = zeros(size(TR_v));
end
alphaNom = 70;
[ facts_m, csv_m ] = conv_MRF_facts_csv(alpha_v, phi_v, TR_v, alphaNom, TE_v);
movefile('MRF.csv', sprintf('Hamburg_Welch_%s_MRF.csv', prefix)); 

%% write file with no modulations for k-space trajectory mapping
alpha_v(:) = alphaNom;
phi_v(:) = 0.0;
TR_v(:) = 0.0;
TE_v(:) = 0.0;
[ facts_m, csv_m ] = conv_MRF_facts_csv(alpha_v, phi_v, TR_v, alphaNom, TE_v);
movefile('MRF.csv', sprintf('Hamburg_Welch_ksp_traj_%s_MRF.csv', prefix)); 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
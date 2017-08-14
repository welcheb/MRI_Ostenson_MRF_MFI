%% Generate dictionaries for Hamburg workshop

datadir_out = '../data_out/';

% dictionary params
input_dict.TI = 7.0; % msec
input_dict.T1_v = [2:2:100 110:10:1000 1020:20:2000 2040:40:3000];
input_dict.T2_v = [2:2:150 160:10:500 520:20:1000 1040:40:2000];
input_dict.B1_v = [1.0];
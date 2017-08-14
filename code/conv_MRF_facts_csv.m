function [ facts_m, csv_m ] = conv_MRF_facts_csv( alpha_v,phi_v,TR_v,alphaNom,TE_v )
% Convert N flip angles, rf phase angles, and TR times to Philips compat.
% factors; write conversion to a CSV file with spec'd precision
% 
% INPUT: alpha_v flip angles (deg), phi_v rf phase (deg), TR_v rep times
% (msec), alphaNom nominal flip angle (deg), TE_v echot times (msec)
%
% OUTPUT: facts_m the Nx4 matrix form of the csv file with cols: fraction
% of nominal flip angle (no dim), phi_v (deg), extension of smallest TR
% (msec), extension of smallest TE; diff_n is the Nx4 matrix facts_m - csv_m, 
% a warning is printed re rounding errors if there are non-zero elements
% of this difference

fid = fopen('./MRF.csv','w'); % output filename
precFact_v = [6 6 2 2]; % decimal places of precision

% force vectors to col vectors
alpha_v = alpha_v(:);
phi_v = phi_v(:);
TR_v = TR_v(:);
TE_v = TE_v(:);

% create factor vectors and matrix
if max(alpha_v) > alphaNom
    disp('Warning! The largest flip angle is greater than the nominal flip angle.')
end
col1_v = round(alpha_v./alphaNom,precFact_v(1));
col2_v = round(phi_v,precFact_v(2)-3); %assume < 1000 phase angle
minTR = min(TR_v);
minTE = min(TE_v);
col3_v = round(TR_v - minTR,precFact_v(3));
disp(['FA, phi, and TR rounded to precisions of ' num2str(precFact_v(1:3))])
col4_v = (TE_v - minTE);
facts_m = [col1_v col2_v col3_v col4_v];

% write to csv
fprintf(fid,'%s,%s,%s,%s\n','flip_angle_(fraction_of_nominal)',...
    'rf_phase_(deg)', 'extension_of_base_TR_(ms)','extension_of_base_TE_(ms)');
precStr = ['%.',num2str(int8(precFact_v(1))),'f,',...
    '%.',num2str(int8(precFact_v(2))),'f,',...
    '%.',num2str(int8(precFact_v(3))),'f,',...
    '%.',num2str(int8(precFact_v(4))),'f\n'];
fprintf(fid,precStr,facts_m');
fclose(fid);

csv_m = csvread('./MRF.csv',1,0);
diff_m = facts_m - csv_m;
if any(diff_m(:))
    disp('Warning! There may be other rounding errors in the csv file compared to the original values')
end

end

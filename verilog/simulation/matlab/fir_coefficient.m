% FIR Filter Coefficient Generation
% Low-pass filter example

fs = 1000;       % Sampling frequency (Hz)
fc = 100;        % Cutoff frequency (Hz)
N = 21;          % Number of taps

wc = 2*fc/fs;
b = fir1(N-1, wc, 'low');  

disp('FIR Filter Coefficients:');
disp(b);

fileID = fopen('fir_coeffs.txt','w');
fprintf(fileID, '%f\n', b);
fclose(fileID);




output:
>> fir_coefficient
FIR Filter Coefficients:
   -0.0000   -0.0021   -0.0063   -0.0116   -0.0124    0.0000    0.0318    0.0814    0.1375    0.1821    0.1992    0.1821    0.1375    0.0814    0.0318    0.0000   -0.0124   -0.0116   -0.0063   -0.0021   -0.0000

 clear all; close all; clc;
data_path = '..\ADCS_Bdot_Experiment\data_file\';

STATUS_OPCODE = 1;
ANG_V_OPCODE = 2;
ENV_MAG_OPCODE = 3;

u = udp('127.0.0.1', 4012);
fopen(u);

tmp = datevec(now);
val = tmp(6);

val        

%% Setting up Aardvark 
lib = 'aardvark';
libhdr = 'aardvark.h';
if ~libisloaded(lib)
    [load_notfounderrors load_warnings] = loadlibrary(lib, libhdr);
end

hport = 0;
calllib(lib, 'c_aa_close', hport);
hdev = calllib(lib, 'c_aa_open', hport);
if (hdev < 0)
    error('Unable to open port 0.');
end

%% Slave Setup
% Configures Aardvark to listen as a slave, using native API wrapper
slaveaddr = hex2dec('1E'); 

outstr = [200, 200, 200, 200, 200, 200];

calllib(lib, 'c_aa_i2c_slave_set_response', hdev, length(outstr), outstr);



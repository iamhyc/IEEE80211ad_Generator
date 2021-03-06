% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genPayload.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates payload bits in two different mode
%
%    1. The data payload bits are randomly generated with specified 'state' and 'seed'
%    2. The data payload octets are provided by a count, modulo 256, starting at 0
%
%    [genParams bits] = genPayload(genParams)
%
%    Inputs:
%
%       1. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. genParams    - input transmit configuration structure updated
%                        with payload bits and random generator seed 
%       2. bits         - payload bits 
%
%  *************************************************************************************/
function [genParams bits] = genPayload(genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end

mode = genParams.header.genmode;
length = genParams.header.length;

%Sets state and seed of RAND
rand('state',genParams.randGen.payload_Ustate);
rand('seed',genParams.randGen.payload_Useed) ;
randn('state',genParams.randGen.payload_Nstate);
randn('seed',genParams.randGen.payload_Nseed) ;
bits = [];
if(mode == 0)
    bits = zeros(1,length*8);
    %randomly generate payload bits
    randnums = rand(1,length*8);
    pOne = find(randnums >= 0.5);
    bits(pOne) = ones(1,max(size(pOne)));    
elseif(mode == 1)
    %payload octets are provided by a count, modulo 256, starting at 0
    rseed = genParams.randGen.payload_Useed;
    for k=1:length,
        bits_8 = dectobin(rseed,8);
        bits = [bits bits_8];
        rseed = rseed + 1;
        rseed = mod(rseed,256);
    end
end

genParams.randGen.payload_Ustate = rand('state');
genParams.randGen.payload_Useed  = rand('seed');
genParams.randGen.payload_Nstate = randn('state');
genParams.randGen.payload_Nseed  = randn('seed');

fname = 'Payload bits.txt';
if(wfile==1) write2file([pname fname],bits,'binary','%1.0f'); end

return

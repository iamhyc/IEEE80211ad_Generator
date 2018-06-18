% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     dectobin.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function converts decimal number into binary 
%    
%    [bits] = dectobin(num,nbits)
%
%    Inputs:
%
%       1. num   - decimal number to convert to binary
%       2. nbits - number of bits in binary representation
%
%    Outputs:
%
%       1. bits  - binary representation of num(LSB first)
%
%  *************************************************************************************/
function [bits] = dectobin(num,nbits)

num = floor(num);
for k=1:nbits
	bits(k) = mod(num,2);
	num = (num - bits(k)) /2;
end

return

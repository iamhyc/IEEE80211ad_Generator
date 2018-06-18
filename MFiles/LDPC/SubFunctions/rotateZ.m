% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     rotateZ.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function generates cyclically shifted unity matrix as specified
%    cyclic-permutation index
%
%    Output matrix is a cyclic-permutations of the identity matrix.
%
%    index denotes the cyclic-permutation to generate matrix Pi obtained from
%    the Z x Z identity matrix Po by cyclically shifting the columns to the right by index elements.
%    The matrix Po is the Z x Z identity matrix. 
%  
%    [Zr] = rotateZ(index)
%
%    Inputs:
%
%       1. index   - cyclic-permutation index
%
%    Outputs:
%
%       1. Zr      - cyclically shifted unity matrix
%
%  *************************************************************************************/

function [Zr] = rotateZ(index)
zs = 42;
z = eye(zs);
p = [0:zs-1];
%p-index
pr = mod(p-index,zs);
Zr = z(:,pr+1);

return

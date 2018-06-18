% /*************************************************************************************
%
%    Project Name:  802.11ad Generator
%    File Name:     startup.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
% 
%    function appends working directory path with all sub folders in Generator
%
%    startup()
%
%  *************************************************************************************/

rootdir = pwd;
addpath(rootdir);

subdir=strcat(rootdir,'\Examples'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\GUI'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\GUI\Verify'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\GUI\Verify\SubFunctions'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\LDPC'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\LDPC\SubFunctions'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\Utilities'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\Common'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\GenParams'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\Preamble'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\Preamble\SubFunctions'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY CS'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY CS\Header'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY CS\Payload'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY CS\Payload\Modulation'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY SC'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY SC\Header'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY SC\Payload'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY SC\Payload\Modulation'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY OFDM'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY OFDM\Header'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY OFDM\Payload'); addpath(subdir);
subdir=strcat(rootdir,'\MFiles\PHY OFDM\Payload\Modulation'); addpath(subdir);

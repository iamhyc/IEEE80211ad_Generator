% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     write2file.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
%
%    function writes data to text file with name fname(including
%    obsolute directory) with the specified data type and precision
%
%    write2file(fname,data,dType,precision)
%
%    Inputs:
%
%       1. fname     - file name(including complete path on disc)
%       2. data      - data to be written to file
%       3. dType     - type of data ['complex' 'real' 'binary']
%                      complex and real type data are written with sign prepended to value
%       4. precision - this input is applied to complex type data only
%
%  *************************************************************************************/
function write2file(fname,data,dType,precision)

LenD = length(data); %Total data length
FragmentSize = 100;
Iter = floor(LenD/FragmentSize); %no of Iterations
ResLen = LenD - (Iter * FragmentSize); %Residual Length

if( strcmp(dType,'complex') )
    dataType = 2;
elseif( strcmp(dType,'real') )
    dataType = 1;
elseif( strcmp(dType,'binary') )
    dataType = 0;
else
    error('entered invalid data type');
end
%open/create file 
fid = fopen(fname,'w');
%complex type data
if(dataType == 2)
    rValueD = [];rSignD = [];iValueD = [];iSignD = [];
    Csign = 'j';
    for k=1:Iter
        D = data( (k-1)*FragmentSize + 1: k*FragmentSize );
        rValueD = real(D);    rSignD = sign(rValueD);    rValueD = abs(rValueD);
        iValueD = imag(D);    iSignD = sign(iValueD);    iValueD = abs(iValueD);
        for n = 1:FragmentSize
            if(rSignD(n) >=0)            rSign = '+';        else            rSign = '-';        end
            if(iSignD(n) >=0)            iSign = '+';        else            iSign = '-';        end
            fprintf(fid,['%s' precision '%s' precision '%s' ' '],rSign,rValueD(n),iSign,iValueD(n),Csign);
        end
    end
    OffsIndx = Iter*FragmentSize;
    rValueD = [];rSignD = [];iValueD = [];iSignD = [];
    if(ResLen > 0)
        D = data( OffsIndx+1: end );
        rValueD = real(D);    rSignD = sign(rValueD);    rValueD = abs(rValueD);
        iValueD = imag(D);    iSignD = sign(iValueD);    iValueD = abs(iValueD);
        for n = 1:ResLen
            if(rSignD(n) >=0)            rSign = '+';        else            rSign = '-';        end
            if(iSignD(n) >=0)            iSign = '+';        else            iSign = '-';        end
            fprintf(fid,['%s' precision '%s' precision '%s' ' '],rSign,rValueD(n),iSign,iValueD(n),Csign);
        end
    end
elseif(dataType == 1)
    %real type data
    rValueD = [];rSignD = [];
    for k=1:Iter
        D = data( (k-1)*FragmentSize + 1: k*FragmentSize );
        rValueD = D;    rSignD = sign(rValueD);    rValueD = abs(rValueD);
        for n = 1:FragmentSize
            if(rSignD(n) >=0)            rSign = '+';        else            rSign = '-';        end
            fprintf(fid,['%s' precision ' '],rSign,rValueD(n));
        end
    end
    OffsIndx = Iter*FragmentSize;
    rValueD = [];rSignD = [];
    if(ResLen > 0)
        D = data( OffsIndx+1: end );
        rValueD = D;    rSignD = sign(rValueD);    rValueD = abs(rValueD);
        for n = 1:ResLen
            if(rSignD(n) >=0)            rSign = '+';        else            rSign = '-';        end
            fprintf(fid,['%s' precision ' '],rSign,rValueD(n));
        end
    end
elseif(dataType == 0)
    %binary type data
    rValueD = [];
    for k=1:Iter
        D = data( (k-1)*FragmentSize + 1: k*FragmentSize );
        rValueD = D;    rValueD = abs(rValueD);
        for n = 1:FragmentSize
            fprintf(fid,[precision ' '],rValueD(n));
        end
    end
    OffsIndx = Iter*FragmentSize;
    rValueD = [];
    if(ResLen > 0)
        D = data( OffsIndx+1: end );
        rValueD = D;    rValueD = abs(rValueD);
        for n = 1:ResLen
            fprintf(fid,[precision ' '],rValueD(n));
        end
    end
end
%close file
fclose(fid);

return






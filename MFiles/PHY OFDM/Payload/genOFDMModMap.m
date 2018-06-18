% /*************************************************************************************
%
%    Project Name:  802.11ad Transmitter
%    File Name:     genOFDMModMap.m
%    Authors:       Prem Kiran Nerella
%    Version:       1.0
%    History:       May 2014 created
%
%  *************************************************************************************
%    Description:
%
%    function generates 802.11ad Std specified modualtion mapped symbols
%    for specified OFDM PHY configuration
%
%    [modSymbols] = genOFDMModMap(encodedbits, genParams)
%
%    Inputs:
%
%       1. encodedbits - encoded bit stream
%       2. genParams   - transmit configuration structure
%
%    Outputs:
%
%       1. modSymbols - modulation mapped payload data symbols
%
%  *************************************************************************************/
function [modSymbols] = genOFDMModMap(encodedbits, genParams)
%File write controls
wfile = genParams.txParams.File.wfile;
if(wfile)
    pname = genParams.txParams.File.pname;
    dname = genParams.txParams.File.dname;
end

derived_params = genParams.derived_params;

modtype = derived_params.modtype;
Ncbps = derived_params.Ncbps;
Nsym = derived_params.Nsym;

modSymbols = [];
mapsym = [];
if(modtype == 0)
    for k1 = 1:Nsym
        mapbits = encodedbits( (k1-1)*Ncbps+1 : k1*Ncbps );
        dataSym = SQPSK(mapbits);
        [OFDMsymbol genParams IFFTin] = genOFDMSymbol(dataSym, genParams);
        modSymbols = [modSymbols OFDMsymbol];
        mapsym = [mapsym dataSym];
    end
elseif(modtype == 1)
    for k1 = 1:Nsym
        mapbits = encodedbits( (k1-1)*Ncbps+1 : k1*Ncbps );
        dataSym = QPSK(mapbits);
        [OFDMsymbol genParams IFFTin] = genOFDMSymbol(dataSym, genParams);
        modSymbols = [modSymbols OFDMsymbol];
        mapsym = [mapsym dataSym];
    end
elseif(modtype == 2)
    for k1 = 1:Nsym
        mapbits = encodedbits( (k1-1)*Ncbps+1 : k1*Ncbps );
        dataSym = QAM16(mapbits);
        [OFDMsymbol genParams IFFTin] = genOFDMSymbol(dataSym, genParams);
        modSymbols = [modSymbols OFDMsymbol];
        mapsym = [mapsym dataSym];
    end
else
    for k1 = 1:Nsym
        mapbits = encodedbits( (k1-1)*Ncbps+1 : k1*Ncbps );
        dataSym = QAM64(mapbits);
        [OFDMsymbol genParams IFFTin] = genOFDMSymbol(dataSym, genParams);
        modSymbols = [modSymbols OFDMsymbol];
        mapsym = [mapsym dataSym];
    end
end
%write to file
fname = 'Constellation Mapped Data Points.txt';
if(wfile==1) write2file([pname fname],mapsym,'complex','%1.3f'); end
%write to file
fname = 'Payload Samples.txt';
if(wfile==1) write2file([pname fname],modSymbols,'complex','%1.3f'); end

return


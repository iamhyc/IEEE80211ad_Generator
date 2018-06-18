function dataout = addIdletime(datain,Idletime)

dt = datain.dt;

samplecount = ceil(Idletime/(2*dt));
addZeros = zeros(1,samplecount);

dataout = datain;

dataout.data = [addZeros datain.data addZeros];

return;

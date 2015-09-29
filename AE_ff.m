function HiddenOutput = AE_ff(data, Weight, Bias,ActivationFunction)
    NumberofTrainingData = size(data,2);
    HiddenOutput=Weight*data;
    HiddenOutput=Actfunc(HiddenOutput,ActivationFunction);
    hiddenDim = nthroot(size(HiddenOutput,1), 3);
    sampleNum = size(HiddenOutput,2);
   % HiddenOutput = reshape(HiddenOutput,hiddenDim,hiddenDim,hiddenDim,sampleNum);
    HiddenOutput = reshape(HiddenOutput,hiddenDim,hiddenDim,hiddenDim,sampleNum,1);
end
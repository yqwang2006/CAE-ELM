function [ output ] = Actfunc( inputData, ActivationFunction )
%ACTFUNC Summary of this function goes here
%   Detailed explanation goes here
switch lower(ActivationFunction)
    case {'sig','sigmoid'}
        %%%%%%%% Sigmoid 
        output = 1 ./ (1 + exp(-inputData));
    case {'sin','sine'}
        %%%%%%%% Sine
        output = sin(inputData);    
    case {'hardlim'}
        %%%%%%%% Hard Limit
        output = double(hardlim(inputData));
    case {'tribas'}
        %%%%%%%% Triangular basis function
        output = tribas(inputData);
    case {'radbas'}
        %%%%%%%% Radial basis function
        output = radbas(inputData);
        %%%%%%%% More activation functions can be added here                
    case {'tanh'}
        output = tanh(inputData);
    case {'linear'}
        output = inputData;
end

end


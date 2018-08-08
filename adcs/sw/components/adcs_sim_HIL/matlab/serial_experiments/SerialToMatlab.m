%Set the below parameters
port = 'COM11';
Baud_Rate = 9600;
Data_Bits = 8;
Stop_Bits = 1;

%Default for Parity & Flow Control are none.  
S = serial('COM3','BaudRate',Baud_Rate);
% ,'DataBits',Data_Bits,'StopBits',Stop_Bits);
fopen(S);
fscanf(S);
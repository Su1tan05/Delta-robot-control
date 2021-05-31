s = serial('COM3','BaudRate',9600);
while 1
    fopen(s);
    t1 = input("Введите theta1: ")
    t2 = input("Введите theta2: ")
    t3 = input("Введитеf theta3: ")
    
    SendStringToSerial1 =  num2str((t1*10)/10);
    SendStringToSerial2 =  num2str((t2*10)/10);
    SendStringToSerial3 =  num2str((t3*10)/10);
    SendStringToSerial = string(strcat(SendStringToSerial1,{' '},SendStringToSerial2,{' '},SendStringToSerial3))
    fprintf(s, '%s', SendStringToSerial+'\r\n');
    pause(0.2);
    fclose(s);
end
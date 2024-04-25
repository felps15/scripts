net stop SessionEnv
net stop RasMan
net stop RasAuto
net stop UmRdpService
net stop TermService
net stop RpcSs
net stop RpcLocator
net stop RpcEptMapper

TIMEOUT /T 10

net start SessionEnv
net start RasMan
net start RasAuto
net start UmRdpService
net start TermService
net start RpcSs
net start RpcLocator
net start RpcEptMapper
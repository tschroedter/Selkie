@ECHO OFF
ECHO RabbitMQ
ECHO Installing on Windows
ECHO https://www.rabbitmq.com/install-windows.html
ECHO -------------------------------------------------------
ECHO Installing on Windows (manual)
ECHO https://www.rabbitmq.com/install-windows-manual.html
ECHO -------------------------------------------------------
ECHO Install RabbitMQ under Windows
ECHO http://arcware.net/installing-rabbitmq-on-windows/
ECHO -------------------------------------------------------
ECHO Please, set ERLANG_HOME enviroment variable and point it to the Erlang folder.
ECHO e.g.: ERLANG_HOME = "C:\Program Files\erl7.2.1"
ECHO ...
ECHO Creating Selkie related vhost and users...
ECHO (adjust folder used in CD command to RabbitMQ's sbin folder)
ECHO ...
CD "C:\Program Files\RabbitMQ Server\rabbitmq_server-3.6.0\sbin\"	

ECHO Creating selkie user...
call rabbitmqctl add_user selkie selkie

ECHO Creating selkieAdmin user...
call rabbitmqctl add_user selkieAdmin selkieAdmin

ECHO Creating selkieAdmin tags...
call rabbitmqctl set_user_tags selkieAdmin administrator

ECHO Creating vhost...
call rabbitmqctl add_vhost selkie

ECHO Adding selkie user to vhost...
call rabbitmqctl set_permissions -p selkie selkie ".*" ".*" ".*"

ECHO Adding selkieAdmin user to vhost...
call rabbitmqctl set_permissions -p selkie selkieAdmin ".*" ".*" ".*"

ECHO ...
ECHO Optional you can enable RabbitMQ's managment console
ECHO (stop/start service needs admin rights)
ECHO rabbitmq-service stop
ECHO call rabbitmq-plugins enable rabbitmq_management
ECHO call rabbitmq-service start

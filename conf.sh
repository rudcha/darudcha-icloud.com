#!/bin/bash
logcp=/var/log/dump_config1/dump_conf.log 		# Log операции копирования
logtar=/var/log/dump_config1/tar.log			# Log операции архивирования 
dtime=$(date +"%d.%m.%y-%H-%M")	  			# Дата и время создания копии
sdir=/home/darudcha1               			# Директория откуда будет копироваться файл
ddir=/home/darudcha1/buckup				# Директория куда будет копироваться файл

rsync -Pav $sdir/config1 $ddir/config2_$dtime 1>>$logcp 			# Копирование файла config1 и его переименование с пометкой времени. 
cd $ddir && tar -zcvf $dtime.config2.tar.gz $ddir/config2_$dtime 1>>$logtar	# Архивирование скопированного файла
find $ddir -mmin +3 -delete							# Удаление всех файлов модификация которых больше 3 минут.

#cd $logcp $$ tar -zcvf $dtime.dump_conf.log $logcp

exit 0

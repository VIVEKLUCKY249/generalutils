PATH_TO_DUMP=$HOME/Vivek;
cd $PATH_TO_DUMP;
##tar -cf - daily_usage_scripts/ | xz -9 -c - > daily_usage_scripts_`date +%F`.tar.xz;
tar -cf - daily_usage_scripts/ | xz -9 -c - > daily_usage_scripts-`date +%F`-`date +%T`.tar.xz;
exit;
##tar -cf - daily_usage_scripts/ | xz -9 -c - > daily_usage_scripts_NEW.tar.xz

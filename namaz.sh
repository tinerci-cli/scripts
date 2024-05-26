#!/bin/bash
text(){
	names=("Fajr" "Sonnenaufgang" "Dhuhr" "Asr" "Maghrib" "Isha")
	link="https://www.muwaqqit.com/index?lt=50.0782184&ln=8.2397608&d=2024-5-20&tztype=auto&tz=Europe%2FBerlin&vc=5.65&diptype=apparent&eo=121&eh=121&ehtype=observer&t=15.0&p=1010.0&k=0.155&zt=1.0&fa=-12.0&era=-16.0&ea=-12.0&ia=4.5&isn=-10.0&fea=1.0&rsa=1.0&isna=1.0&z=1&q=&add=Luisenpl.+4%2C+65185+Wiesbaden%2C+Germany"
	times=($(curl "$link" -s |
		grep -P "\d\d:\d\d:\d\d" |
		sed -n '2p;4p;11p;12p;15p;21p' |
		awk -F'[^0-9:]+' '{ for(i=1;i<=NF;i++) if ($i ~ /^[0-9]{2}:[0-9]{2}:[0-9]{2}$/) print $i }'))

	for ((i = 0; i < 6; i++)); do
		echo ${times[$i]} - ${names[$i]}
	done
}

restart(){
	killall namaz.sh
	killall yad
}
while [ "$(hostname -I)" = "" ]; do
  echo -e "\e[1A\e[KNo network: $(date)"
  sleep 1
done
yad --notification --image="indicator-lunar" --command="yad --text='$(text)' --title='Wiesbaden - Gebetszeiten' "

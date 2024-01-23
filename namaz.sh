#!/bin/bash
while [[ true ]]; do

        pathhtml="$HOME/.local/share/scripts_assets/namaz.html"
        pathsmpl="$HOME/.local/share/scripts_assets/simple_namaz.txt"
        url="https://sunrisesunset.de/sonne/deutschland/wiesbaden/"
        asrurl="https://azaneum.de/germany/wiesbaden/?juristic=Shafii"
        usra="Mozilla/5.0 (Windows NT 10.0; rv:109.0) Gecko/20100101 Firefox/115.0"
        heute="$(date -I)"
        heutf="$(head -n1 "$pathsmpl")"

        if [[ "$heute" = "$heutf" ]]; then
                yad --notification --image="gtk-execute" --command="yad --text='$(cat $HOME/.local/share/scripts_assets/simple_namaz.txt)' --title='Wiesbaden - Gebetszeiten' "
                sleep 60
        fi

        sed -i "1s/.*/$heutf/" "$pathsmpl"
        curl -s -A "$usra" "$url" > "$pathhtml"

        fajr="$(grep ochtend_naut_scherm -m 1 "$pathhtml" | cut -d ">" -f 2 | cut -d " " -f 1)"
        auf="$(grep "id=\"sunrise\"" "$pathhtml" | cut -d ">" -f 4 | cut -d "<" -f 1)"
        dhuhr="$(grep "zen dneszenit" "$pathhtml" | cut -d ">" -f 2 | cut -d "<" -f 1)"
        asr="$(curl -s "$asrurl" | grep Asr -m 1 | cut -d ">" -f 7 | cut -d "<" -f 1)"
        maghrib="$(grep "id=\"sunset\"" "$pathhtml" | cut -d ">" -f 4 | cut -d "<" -f 1)"
        isha="$(grep avond_astr_scherm -m 1 "$pathhtml" | cut -d ">" -f 2 | cut -d " " -f 1)"

        sed -i "1s/.*/$heute/" "$pathsmpl"
        sed -i "2s/.*/$fajr - Fajr/" "$pathsmpl"
        sed -i "3s/.*/$auf - Sonnenaufgang/" "$pathsmpl"
        sed -i "4s/.*/$dhuhr - Dhuhr/" "$pathsmpl"
        sed -i "5s/.*/$asr - Asr/" "$pathsmpl"
        sed -i "6s/.*/$maghrib - Maghrib/" "$pathsmpl"
        sed -i "7s/.*/$isha - Isha/" "$pathsmpl"
        yad --notification --image="gtk-execute" --command="yad --text='$(cat $HOME/.local/share/scripts_assets/simple_namaz.txt)' --title='Wiesbaden - Gebetszeiten' "
        sleep 60

done

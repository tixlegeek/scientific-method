#!/bin/bash
METHOD=$(cat << 'EOF'
1,Poser un problème,Formuler une question ou un sujet à étudier.,33
2,Recueillir des données,Collecter des informations et des observations pour étudier le problème.,31
3,Élaborer une hypothèse,Proposer une explication possible pour le phénomène étudié.,91
4,Tester l'hypothèse,Mettre à l'épreuve l'hypothèse en effectuant des expériences ou en analysant des données.,93
5,Analyser les résultats,Examiner les résultats obtenus pour voir si l'hypothèse a été confirmée ou infirmée.,92
6,Tirer des conclusions,Déterminer si l'hypothèse est valide en se basant sur les résultats de l'expérience ou de l'analyse des données.,94
7,Publier les résultats,Partager les résultats de l'étude avec la communauté scientifique pour que d'autres scientifiques puissent les examiner et les évaluer.,35
EOF
)
IFS=$','
while read etape titre desc color;
do
echo -e "\e["$color"m"
echo $(tput bold)"[ "$etape" : "$titre" ]"$(tput sgr0)
IFS=$'\n'
foldesc=$(echo $desc | fold -s -w 50)
for i in $foldesc; do 
	echo "| $i"
done
IFS=$','
done <<< $METHOD

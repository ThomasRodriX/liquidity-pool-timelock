sleeep(){ if [[ $1 > 0 ]]; then echo -en "sleep $1 \r"; sleep 1; sleeep $(($1 - 1)); fi;}
address(){ octez-client list known contracts | grep ^$1: | sed -e "s/^$1: //g"; }


octez-client originate contract proxy transferring 0 from bootstrap1 running proxy.tz --burn-cap 0.08125  2> /dev/null
cat pool.tz | sed -e 's/KT1WcPTEYJi4cAEF7LhLeTAhsinuEg6ZZVCQ/'$(address proxy)'/g' > pool_.tz
octez-client originate contract g transferring 0 from bootstrap1 running pool_.tz --init "Pair (Pair None None 0) {} 0 0 {} {}" --force --burn-cap 4
sleeep 1

#Création des tickets FA2.1 représentants les tokens
g=$(address g)
echo ggg $g
octez-client originate contract t1 transferring 0 from bootstrap1 running contrTicketPool2.tz --init '"'$g%import_ticket'"' --force --burn-cap 1
octez-client originate contract t2 transferring 0 from bootstrap1 running contrTicketPool2.tz --init '"'$g%import_ticket'"' --force --burn-cap 1


# envoyer 101 tickets de type 1 et 102 tickets tickets de type 2 le compte de bootstrap3 dans le contrat de la pool de liquidité
octez-client transfer 0 from bootstrap3 to t1 --burn-cap 1 --arg 'Pair 101 1'
octez-client transfer 0 from bootstrap3 to t2 --burn-cap 1 --arg 'Pair 102 2'

echo z1
octez-client get contract storage for g

#on créé le dossier pour les timelocks
rm -r tl
mkdir tl
octez-client timelock precompute for 1000000 in tl 


#Data pour le Timelock1, on dépose 8 tickets de type 1 et 7 de type 2 au maximum
T=$(octez-client hash data "(Right (Left (Left (Pair 8 7))))" of type "(or (pair nat nat nat) (or (or (pair nat nat) (pair nat nat)) nat  ))" | grep "^Raw packed data:" | sed -e 's/^Raw packed data: //g')

#TL1
octez-client timelock create for 1000000 with $T in tl
mv tl/time_chest_* tl/timelock_1
mv tl/time_key_create_* tl/timekey_1
export H=$(octez-client hash data 0x$(xxd -p -c 100000 <tl/timelock_1) of type bytes | grep "^Raw Sha256 hash: " | sed -e 's/^Raw Sha256 hash: //g')


#On envoie le TL1
octez-client transfer 0 from bootstrap3 to g --burn-cap 1 --entrypoint default --arg 'Pair '0x$(xxd -p -c 100000 <tl/timelock_1)' '$(("$(octez-client get timestamp -s) + 25"))''
sleeep 15
#On unlock le TL1
echo z2
octez-client transfer 0 from bootstrap3 to g --burn-cap 1 --entrypoint unlock --arg 'Pair '$H' '0x$(xxd -p -c 100000 <tl/timekey_1)''

# envoyer 201 tickets de type 1 et 202 tickets tickets de type 2 le compte de bootstrap3 dans le contrat de la pool de liquidité
octez-client transfer 0 from bootstrap2 to t1 --burn-cap 1 --arg 'Pair 201 1'
octez-client transfer 0 from bootstrap2 to t2 --burn-cap 1 --arg 'Pair 202 2'
echo z3
octez-client get contract storage for g

#Data pour le Timelock2, on dépose 80 tickets de type 1 et 70 de type 2 au maximum
T=$(octez-client hash data "(Right (Left (Left (Pair 80 70))))" of type "(or (pair nat nat nat) (or (or (pair nat nat) (pair nat nat)) nat  ))" | grep "^Raw packed data:" | sed -e 's/^Raw packed data: //g')

#TL2
octez-client timelock create for 1000000 with $T in tl
mv tl/time_chest_* tl/timelock_2
mv tl/time_key_create_* tl/timekey_2
export H=$(octez-client hash data 0x$(xxd -p -c 100000 <tl/timelock_2) of type bytes | grep "^Raw Sha256 hash: " | sed -e 's/^Raw Sha256 hash: //g')

#On envoie le TL2
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint default --arg 'Pair '0x$(xxd -p -c 100000 <tl/timelock_2)' '$(("$(octez-client get timestamp -s) + 25"))''
sleeep 15
#On unlock le TL2
echo z4
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint unlock --arg 'Pair '$H' '0x$(xxd -p -c 100000 <tl/timekey_2)''


#Data pour le Timelock3, on échange 10 tickets de type 1 pour au moins 7 tickets  de type 2
T=$(octez-client hash data "(Left (Pair 1 10 7))" of type "(or (pair nat nat nat) (or (or (pair nat nat) (pair nat nat)) nat  ))" | grep "^Raw packed data:" | sed -e 's/^Raw packed data: //g')
#TL3
octez-client timelock create for 1000000 with $T in tl
mv tl/time_chest_* tl/timelock_3
mv tl/time_key_create_* tl/timekey_3
export H=$(octez-client hash data 0x$(xxd -p -c 100000 <tl/timelock_3) of type bytes | grep "^Raw Sha256 hash: " | sed -e 's/^Raw Sha256 hash: //g')

#On envoie le TL3
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint default --arg 'Pair '0x$(xxd -p -c 100000 <tl/timelock_3)' '$(("$(octez-client get timestamp -s) + 25"))''
sleeep 15
#On unlock le TL3
echo z5
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint unlock --arg 'Pair '$H' '0x$(xxd -p -c 100000 <tl/timekey_3)''

#Data pour le Timelock4, on retire toutes les parts de la pool (ie on récupère les tickets types 1 et 2 vers le contrat)
T=$(octez-client hash data "(Right (Right 80000000))" of type "(or (pair nat nat nat) (or (or (pair nat nat) (pair nat nat)) nat  ))" | grep "^Raw packed data:" | sed -e 's/^Raw packed data: //g')
#TL4
octez-client timelock create for 1000000 with $T in tl
mv tl/time_chest_* tl/timelock_4
mv tl/time_key_create_* tl/timekey_4
export H=$(octez-client hash data 0x$(xxd -p -c 100000 <tl/timelock_4) of type bytes | grep "^Raw Sha256 hash: " | sed -e 's/^Raw Sha256 hash: //g')

#On envoie le TL4
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint default --arg 'Pair '0x$(xxd -p -c 100000 <tl/timelock_4)' '$(("$(octez-client get timestamp -s) + 25"))''
sleeep 15
#On unlock le TL4
echo z6
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint unlock --arg 'Pair '$H' '0x$(xxd -p -c 100000 <tl/timekey_4)''
echo z7
octez-client get contract storage for g
echo z8
#Test d'export de ticket, ici la lambda n'exporte pas vers un wallet, mais drop si l'export marche (pour tester l'entrypoint, qui est bien fonctionnel)
octez-client transfer 0 from bootstrap2 to g --burn-cap 1 --entrypoint export_ticket --arg 'Pair { Pair "tz1gjaF81ZRRvdzjobyfVNsAeSC6PScjfQwN" 1 1} {DROP; NIL operation}'
